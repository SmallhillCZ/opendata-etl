import Knex from "knex";
import request from "request";

import { SaxesStream } from "saxes-stream";
import { IndexTransform } from "./streams/index-transform";
import { DumpTransform } from "./streams/dump-transform";
import { DatabaseWriter } from "./streams/db-writer";
import { DumpMetadata } from "./schema/source";
import { DumpRecord, ContractRecord, CounterpartyRecord, AttachmentRecord } from "./schema/database";



(async function () {

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
  }
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

    console.log("Dump:", dump.odkaz);

    const dumpId = `${dump.rok}-${String(dump.mesic).padStart(2, "0")}`;

    const oldDump = await db<DumpRecord>(`${schema}.etl`).where({ id_dumpu: dumpId }).first();

    if (oldDump && oldDump.hash_dumpu === dump.hash_dumpu) {
      console.log("No changes.");
      continue;
    }

    const dumpRecord: DumpRecord = { id_dumpu: dumpId, ...dump };

    console.log("Deleting old data.");
    await db<DumpRecord>(`${schema}.etl`).where({ id_dumpu: dumpId }).delete();
    await db<ContractRecord>(`${schema}.smlouva`).where({ "id_dumpu": dumpId }).delete();
    await db<CounterpartyRecord>(`${schema}.smluvni_strana`).where({ "id_dumpu": dumpId }).delete();
    await db<AttachmentRecord>(`${schema}.priloha`).where({ "id_dumpu": dumpId }).delete();

    console.log("Writing index record.");
    await db<DumpRecord>(`${schema}.etl`).insert(dumpRecord);

    await importDump(db, schema, dumpRecord, { dry, hideProgress })
  }

  console.log("Running ANALYZE...");
  await db.raw(`ANALYZE ${schema}.etl;`)
  await db.raw(`ANALYZE ${schema}.smlouva;`)
  await db.raw(`ANALYZE ${schema}.smluvni_strana;`)
  await db.raw(`ANALYZE ${schema}.priloha;`)

  await db.destroy();
  console.log("Disconnected from db.");

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
  })
}

async function importDump(db: Knex, schema: string, dump: DumpRecord, options: { dry: boolean, hideProgress: boolean }) {

  const httpStream = request(dump.odkaz);

  const parser = new SaxesStream();

  const dumpTransform = new DumpTransform();

  const writer = new DatabaseWriter(db, schema, dump.id_dumpu, options);

  return new Promise<void>((resolve, reject) => {

    const outputStream = httpStream.pipe(parser).pipe(dumpTransform).pipe(writer);

    writer.on("error", (err: Error) => reject(err));
    writer.on("finish", () => resolve());
  })
}


