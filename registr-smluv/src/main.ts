import Knex from "knex";
import request from "request";

import { SaxesStream } from "saxes-stream";
import { IndexTransform } from "./streams/index-transform";
import { DumpTransform } from "./streams/dump-transform";
import { DatabaseWriter } from "./streams/db-writer";
import { DumpMetadata } from "./schema/source";
import { DumpRecord, ContractRecord, CounterpartyRecord, AttachmentRecord } from "./schema/database";



(async function () {

  var errors = false;

  /* CONFIG */
  const schema = process.env["DB_SCHEMA"] || "PUBLIC";

  const dry = process.env["DRY"] ? !!JSON.parse(process.env["DRY"]) : false;
  const hideProgress = process.env["HIDE_PROGRESS"] ? !!JSON.parse(process.env["HIDE_PROGRESS"]) : false;

  const knexConfig = {
    client: process.env["DB_CLIENT"],
    connection: {
      server: process.env["DB_HOST"],
      database: process.env["DB_NAME"],
      user: process.env["DB_USER"],
      password: process.env["DB_PASSWORD"]
    }
  };
  /* DATABASE */
  const db = Knex({
    client: process.env["DB_CLIENT"],
    connection: {
      host: process.env["DB_HOST"],
      database: process.env["DB_NAME"],
      user: process.env["DB_USER"],
      password: process.env["DB_PASSWORD"]
    }
  });

  await db.raw("SELECT 1");
  console.log("Connected to db.");


  /* RUN IMPORT */
  const dumps = await getDumps();

  for (let dump of dumps) {

    const dumpId = `${dump.rok}-${String(dump.mesic).padStart(2, "0")}${dump.den ? ("-" + String(dump.den).padStart(2, "0")) : ""}`;

    console.log(`= Dump: ${dump.odkaz} (ID: ${dumpId})`);

    // use only monthly dumps, continue od daily dumps
    if (dump.den) {
      console.log("Daily dump, skipping...");
      continue;
    }

    const oldDump = await db<DumpRecord>(`${schema}.etl`).where({ id_dumpu: dumpId }).first();

    if (oldDump && oldDump.hash_dumpu === dump.hash_dumpu) {
      console.log("No changes.");
      continue;
    }

    const dumpRecord: DumpRecord = { id_dumpu: dumpId, ...dump };

    console.log("Deleting old data...");
    await db<DumpRecord>(`${schema}.etl`).where({ id_dumpu: dumpId }).delete();
    await db<ContractRecord>(`${schema}.smlouva`).where({ "id_dumpu": dumpId }).delete();
    await db<CounterpartyRecord>(`${schema}.smluvni_strana`).where({ "id_dumpu": dumpId }).delete();
    await db<AttachmentRecord>(`${schema}.priloha`).where({ "id_dumpu": dumpId }).delete();

    try {
      console.log("Importing data...");
      await importDump(db, schema, dumpRecord, { dry, hideProgress });

      console.log("Writing etl log record...");
      await db<DumpRecord>(`${schema}.etl`).insert(dumpRecord);
    }
    catch (err) {
      console.log("Error:", err.message);
      errors = true;
    }



  }

  console.log("Running ANALYZE...");
  await db.raw(`ANALYZE ${schema}.etl;`);
  await db.raw(`ANALYZE ${schema}.smlouva;`);
  await db.raw(`ANALYZE ${schema}.smluvni_strana;`);
  await db.raw(`ANALYZE ${schema}.priloha;`);

  await db.destroy();
  console.log("Disconnected from db.");

  if (errors) {
    console.log("Encountered errors, exiting with status 1");
    process.exit(1);
  }

})();

async function getDumps() {
  const httpStream = request('https://data.smlouvy.gov.cz/');

  const parser = new SaxesStream();

  const indexTransform = new IndexTransform();

  const dumps: DumpMetadata[] = [];
  indexTransform.on("data", (data: DumpMetadata) => dumps.push(data));

  return new Promise<DumpMetadata[]>((resolve, reject) => {

    const outputStream = httpStream.pipe(parser).pipe(indexTransform);

    outputStream.on("error", (err: Error) => reject(err));
    outputStream.on("end", () => resolve(dumps));
  });
}

async function importDump(db: Knex, schema: string, dump: DumpRecord, options: { dry: boolean, hideProgress: boolean; }) {

  const httpStream = request(dump.odkaz);

  const parser = new SaxesStream();

  const dumpTransform = new DumpTransform();

  const writer = new DatabaseWriter(db, schema, dump.id_dumpu, options);

  let parseError: Error;

  return new Promise<void>((resolve, reject) => {

    const outputStream = httpStream.pipe(parser).pipe(dumpTransform).pipe(writer);

    parser.on("error", (err: Error) => {
      if (!parseError) {
        parseError = err;
        parser.unpipe(dumpTransform);
        writer.end();
      }
    });

    writer.on("error", (err: Error) => reject(err));
    writer.on("finish", () => {
      console.log("Write finished.");
      if (!writer.c) reject(new Error("No records written."));
      if (parseError) reject(parseError);
      else resolve();
    });
  });
}


