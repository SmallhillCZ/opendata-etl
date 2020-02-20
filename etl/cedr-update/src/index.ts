import request from "request-promise-native";
import path from "path";
import { remove, ensureDir } from "fs-extra";
import Knex from "knex";
import parse from "csv-parse";
import { Writable } from "stream";
import changeCase from "change-case";
import zlib from "zlib";

import { CedrEndpoint } from "./schema/cedr-endpoint";
import { ETLRecord } from "./schema/etl-record";

(async function () {

  const tmpDir = path.join(__dirname, "../tmp");

  /* PREPARE DIRS */
  await remove(tmpDir);
  await ensureDir(tmpDir);

  const dbConfig = process.env["DB_CONFIG"] ? await import(process.env["DB_CONFIG"]) : {};

  const hideProgress = process.env["HIDE_PROGRESS"] ? !!JSON.parse(process.env["HIDE_PROGRESS"]) : false;

  const overwrite = process.env["OVERWRITE"] ? !!JSON.parse(process.env["OVERWRITE"]) : false; // convert 0 and 1 to boolean

  const onlyNew = process.env["ONLY_NEW"] ? !!JSON.parse(process.env["ONLY_NEW"]) : false; // convert 0 and 1 to boolean

  const dry = process.env["DRY"] ? !!JSON.parse(process.env["DRY"]) : false; // convert 0 and 1 to boolean

  const schemaName = process.env["SCHEMA_NAME"] || "src_cedr";

  /* DATABASE CONNECTION */
  const knexConfig = {
    client: "pg",
    connection: {
      host: process.env["DB_HOST"] || dbConfig["host"],
      database: process.env["DB_NAME"] || dbConfig["database"],
      user: process.env["DB_USER"] || dbConfig["user"],
      password: process.env["DB_PASSWORD"] || dbConfig["password"]
    }
  };

  const db = Knex(knexConfig);




  const headers = { "Accept": "application/json" };

  const metadataFiles = [
    "http://cedropendata.mfcr.cz/c3lod/cedr/void",
    "http://cedropendata.mfcr.cz/c3lod/csu/void",
    "http://cedropendata.mfcr.cz/c3lod/szcr/void",
    "http://cedropendata.mfcr.cz/c3lod/ruian/void",
    "http://cedropendata.mfcr.cz/c3lod/mmr/void",
    "http://cedropendata.mfcr.cz/c3lod/edssmvs/void",
    "http://cedropendata.mfcr.cz/c3lod/ares/void",
    "http://cedropendata.mfcr.cz/c3lod/rob/void",
    "http://cedropendata.mfcr.cz/c3lod/isdp/void"
  ];


  /* FIND SOURCE FILES */
  console.log("Looking up source files...");

  var importFiles: { path: string, etag: string }[] = [];

  for (let url of metadataFiles) {

    const metadata: CedrEndpoint = await request.get(url, { headers, json: true });

    const rootNode = Object.keys(metadata)[0];

    let currentDumps = metadata[rootNode]['http://rdfs.org/ns/void#dataDump'] || [];

    currentDumps = currentDumps.filter(dump => dump.value.match(/\.csv\.gz$/));

    console.log(`${url}: ${currentDumps.length} .csv.gz files`);

    for (let dump of currentDumps) {
      importFiles.push({
        path: dump.value,
        etag: await request.head(dump.value, { resolveWithFullResponse: true }).then((response: request.FullResponse) => String(response.headers["etag"]))
      })
    }

  }

  /* Get previous ETAGs, save new ETAGs */
  const etls = await db<ETLRecord>(schemaName + ".etl");

  /* get existing tables in database */
  const tables = await db("pg_catalog.pg_tables")
    .select("tablename")
    .where({ "schemaname": schemaName })
    .then((result: { tablename: string }[]) => result.map(row => row.tablename));


  for (let file of importFiles) {

    console.log(`\n== File ${file.path} ==`);

    let table = path.basename(file.path);
    table = table.replace(/\.csv\.gz$/, "");
    table = changeCase.snakeCase(table);
    table = table.replace(/(v\d{2})$/, "_$1");

    const tableFull = schemaName + "." + table;

    const etl = etls.find(etl => etl.name === table);

    /* FILTER */
    if (tables.indexOf(table) === -1) { console.log(`Table ${table} not found in database. Skipping.`); continue; }

    const tableRows = await db(tableFull).count().then(count => Number(count[0].count));
    if (onlyNew && (etl && etl.etag && file.etag === etl.etag && tableRows > 0)) { console.log("No new data AND ONLY_NEW=true. Skipping."); continue; }
    if (!overwrite && tableRows > 0) { console.log("Table not empty and OVERWRITE=false. Skipping."); continue; }


    // clear current contents
    if (!dry) {
      await db(tableFull).delete();
      console.log(`Cleared ${tableRows} rows in the table ${tableFull}.`);
    }
    else console.log(`(DRY RUN) Cleared ${tableRows} rows in the table ${tableFull}.`);

    // encapsulate to keep await/async flow
    try {
      await new Promise((resolve, reject) => {

        // save error status to prevent promise resolve after rejection or duplicate rejection
        let error = false;

        const requestStream = request(file.path);
        requestStream.on('error', err => { error = true; if (!error) reject(err); });

        const gunzip = zlib.createGunzip();
        gunzip.on('error', err => { error = true; if (!error) reject(err); });

        // initialize CSV parser stream, matching of CSV headers to table fields
        const parser = parse({
          delimiter: ",",
          columns: header => header.map((column: string) => {
            column = changeCase.snakeCase(column);
            if (table === "adresa_bydliste" && column === "obec") column = "iri_obec";
            if (table === "adresa_sidlo" && column === "iri_cast_obce") column = "cast_obce";
            if (table === "dotace" && column === "projekt_idnetifikator") column = "projekt_identifikator";
            return column;
          })
        });
        parser.on('error', err => { error = true; if (!error) reject(err); });

        // initialize database writable stream
        const writer = new DatabaseWriter(tableFull, db, { dry, hideProgress });
        writer.on('error', err => { throw err; });

        // import new data
        console.log(`Importing to table ${tableFull}...`);

        // resolve on the last stream finish
        writer.on('finish', () => { if (!error) resolve(); });

        // pipe CSV file through CSV parser to DB writer
        requestStream.pipe(gunzip).pipe(parser).pipe(writer);

      });

      console.log("Writing etl record...");
      await db<ETLRecord>(schemaName + ".etl").where({ name: table }).delete();
      await db<ETLRecord>(schemaName + ".etl").insert({
        name: table,
        url: file.path,
        etag: file.etag
      });

    }
    catch (err) {
      console.log("Failed to download, parse or import CSV", err);
      continue;
    }

  }



  for (let table of tables) {
    const fullTableName = schemaName + "." + table;
    console.log(`Performing ANALYZE on ${fullTableName}...`);
    await db.raw("ANALYZE ?", db.raw(fullTableName));
  }

  console.log("Disconnecting DB...");

  await db.destroy();

  console.log("Finished.");

})();


// Writable stream to save rows to database
class DatabaseWriter extends Writable {

  c = 0;

  constructor(private table: string, private db: Knex, private options: { dry: boolean, hideProgress: boolean }) {

    super({
      objectMode: true,
      highWaterMark: 1000 // bulk insert 1000 rows at once
    });

  }

  // write one row
  _write(chunk: any, encoding: string, callback: () => void) {
    return this._writev([{ chunk, encoding }], callback);
  }

  // bulk insert rows
  async _writev(chunks: { chunk: any, encoding: string }[], callback: () => void) {

    if (!this.options.hideProgress) {
      if (!this.options.dry) process.stdout.write(`Writing records #${this.c + 1} - #${this.c + 1 + chunks.length}\r`);
      else process.stdout.write(`(DRY RUN) Writing records #${this.c + 1} - #${this.c + 1 + chunks.length}\r`);
    }

    // extract just chunk from chunk array
    const records = chunks.map(chunk => chunk.chunk);

    for (let record of records) {
      for (let key of Object.keys(record)) {
        if (typeof record[key] === "string") record[key] = record[key].replace(/\x00/g, "");
        if (record[key] === "") record[key] = null;
      }
    };

    if (!this.options.dry) await this.db(this.table).insert(records);

    this.c += chunks.length;

    // allow receiving of another data
    callback();
  }

  _final(callback) {
    if (!this.options.dry) console.log(`Written ${this.c} records.                                         `); // spaces to erase previous longer message
    else console.log(`(DRY RUN) Written ${this.c} records.                                         `); // spaces to erase previous longer message
    // emit hte finish event
    callback();
  }

}