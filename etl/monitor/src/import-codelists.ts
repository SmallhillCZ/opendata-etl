import request from "request-promise-native";
import Knex from "knex";
import { Writable } from "stream";
import { DatabaseWriter } from "./writer";

import Parser from "node-xml-stream";
import { MonitorDataset, EtlRecord } from "./schema";

export async function ImportCodelists(options: { db: Knex, dry: boolean, tmpDir: string, hideProgress: boolean; }) {

  const { db, dry, tmpDir, hideProgress } = options;

  /* FIND SOURCE FILES */
  const codelists: MonitorDataset[] = await request.get("https://monitor.statnipokladna.cz/api/ciselniky?aktivni=true", { json: true });

  let importFiles: string[] = [];

  importFiles = codelists.map(resource => resource.xml);

  if (importFiles.length) {
    console.log(`Found ${importFiles.length} codelist files.`);
  }
  else {
    throw new Error(`Found ${importFiles.length} data files.`);
  }

  const tables = await db("pg_catalog.pg_tables")
    .select("tablename")
    .where({ "schemaname": "src_monitor" })
    .then((result: { tablename: string; }[]) => result.map(row => row.tablename));

  const etags = (await db<EtlRecord>("src_monitor.etl"))
    .reduce((acc, cur) => (acc[cur.name] = cur.etag, acc), {} as { [file: string]: string; });


  for (let file of importFiles) {

    const filePath = "http://monitor.statnipokladna.cz/data/xml/" + file;

    const table = "c_" + file.split(".")[0];
    const tableFull = "src_monitor." + table;

    console.log(`== File ${filePath} ==`);

    try {
      var head = await request.head(filePath);
      var etag = head["etag"];

      if (etags[file] === etag) {
        console.log("Nothing changed.");
        continue;
      }
      else {
        console.log("New data!");
      }
    }
    catch (err) {
      if (err.statusCode === 404) console.log("Error: File not found.");
      else console.log("Error: File could not be accessed.");
      continue;
    }

    // check if corresponding table present in database
    if (tables.indexOf(table) === -1) {
      console.log(`Table ${tableFull} not found. Skipping.`);
      continue;
    }

    // check if data present in the target table for the current year and month
    const rowCount = await db(tableFull).count().then(count => count[0].count);

    const writer = new DatabaseWriter(tableFull, db, { dry, hideProgress });
    writer.on('error', err => { throw err; });

    console.log(`Clearing ${rowCount} rows in the table ${table}...`);
    await writer.clear();

    let entries: any[] = [];
    let entry: { [key: string]: string | null; } = {};

    let c = 0;

    let inEntry = false;
    let inEntryProperty: null | string = null;

    let parser: Writable = new Parser();

    parser.on('opentag', (name, attrs) => {
      if (name === "row") {
        if (!options.hideProgress) process.stdout.write(`Parsing record #${entries.length + 1}...\r`);
        inEntry = true;
      }
      else if (inEntry) inEntryProperty = name;
    });

    parser.on('closetag', async name => {
      if (name === "row") {

        /* TABLE SPECIFIC ERRORS */
        if (table === "c_ucjed") {
          if (entry["zrizovatel_ico"] === "Chybí") entry["zrizovatel_ico"] = null;
          // if (entry["datumakt"]) {
          //   entry["datumakt"] = entry["datumakt"] === "00000000" ? null : `${entry["datumakt"].substr(0, 4)}-${entry["datumakt"].substr(4, 2)}-${entry["datumakt"].substr(6, 2)}`;
          // }
          // if (entry["konecplat"]) {
          //   entry["konecplat"] = entry["konecplat"] === "00000000" ? null : `${entry["konecplat"].substr(0, 4)}-${entry["konecplat"].substr(4, 2)}-${entry["konecplat"].substr(6, 2)}`;
          // }
          // if (entry["datumvzniku"]) {
          //   entry["datumvzniku"] = entry["datumvzniku"] === "00000000" ? null : `${entry["datumvzniku"].substr(0, 4)}-${entry["datumvzniku"].substr(4, 2)}-${entry["datumvzniku"].substr(6, 2)}`;
          // }
        }

        /* FIX DATES IN ALL CODELISTS */
        const re_date = /^(\d{2})\-(\d{2})\-(\d{4})$/;
        Object.keys(entry).forEach(key => {

          if (entry[key]) {
            const datematch = re_date.exec(entry[key]!); // ! typescript doesnt see the if above
            if (datematch) entry[key] = `${datematch[3]}-${datematch[2]}-${datematch[1]}`;
          }

        });

        entries.push(entry);
        entry = {};
        inEntry = false;
      }
    });

    parser.on('text', text => {
      if (inEntryProperty) {
        entry[inEntryProperty] = text;
      }
    });

    const requestStream = request(filePath);
    requestStream.on('error', err => { throw err; });

    await new Promise<void>((resolve, reject) => {

      console.log("Parsing XML...");

      requestStream.pipe(parser);

      parser.on("finish", () => {
        process.stdout.write(`Parsed ${entries.length} records            \r\n`);
        resolve();
      });
    });

    console.log("Importing to database");
    while (entries.length) {
      await writer.writeRows(entries.splice(0, 1000));
    }

    await new Promise((resolve, reject) => writer.end(resolve));

    await db<EtlRecord>("src_monitor.etl").where({ name: file }).delete();
    await db<EtlRecord>("src_monitor.etl").insert({ etag, name: file, modified: head["last-modified"], timestamp: (new Date()).toISOString() });

  }

  console.log("Performing ANALYZE on all tables...");

  for (let table of tables) {
    await db.raw("ANALYZE ?", db.raw("src_monitor." + table));
  }
}