import request from "request-promise-native";
import Knex from "knex";
import { Writable } from "stream";
import { DatabaseWriter } from "./writer";

import Parser from "node-xml-stream";

export async function ImportCodelists(options: { db: Knex, overwrite: boolean, dry: boolean, tmpDir: string, hideProgress: boolean }) {

  const { db, overwrite, dry, tmpDir, hideProgress } = options;

  const filePattern = /\/data\/([^\.]+)\.xml/g;

  const tableMapping = {
    "rozv1": "rozv",
    "rozv2": "rozv"
  };

  /* FIND SOURCE FILES */
  const html = await request.get("http://monitor.statnipokladna.cz/2019/zdrojova-data/ciselniky");

  let importFiles: { path: string, table: string }[] = [];

  let match: RegExpExecArray | null;

  while (match = filePattern.exec(html)) {
    if (match) importFiles.push({ path: match![0], table: "c_" + match![1] });
  }

  const tables = await db("pg_catalog.pg_tables")
    .select("tablename")
    .where({ "schemaname": "src_monitor" })
    .then((result: { tablename: string }[]) => result.map(row => row.tablename));

  for (let file of importFiles) {

    const filePath = "http://monitor.statnipokladna.cz" + file.path;

    const table = file.table;
    const tableFull = "src_monitor." + file.table;

    console.log(`== File ${filePath} ==`);

    // check if corresponding table present in database
    if (tables.indexOf(table) === -1) {
      console.log(`Table ${tableFull} not found. Skipping.`);
      continue;
    }

    // check if data present in the target table for the current year and month
    const rowCount = await db(tableFull).count().then(count => count[0].count);

    // if data present and overwrite not allowed, skip this CSV
    if (rowCount > 0 && !overwrite) {
      console.log(`Table ${table} not empty. Skipping.`);
      continue;
    }

    const writer = new DatabaseWriter(tableFull, db, { dry, hideProgress });
    writer.on('error', err => { throw err; });

    console.log(`Clearing ${rowCount} rows in the table ${table}...`);
    await writer.clear();

    let entries: any[] = [];
    let entry: any = {};

    let c = 0;

    let inEntry = false;
    let inEntryProperty: null | string = null;

    let parser: Writable = new Parser();

    parser.on('opentag', (name, attrs) => {
      if (name === "Radek") {
        process.stdout.write(`Parsing record #${entries.length + 1}...\r`);
        inEntry = true;
      }
      else if (inEntry) inEntryProperty = name;
    });

    parser.on('closetag', async name => {
      if (name === "Radek") {

        if (table === "c_ucjed") entry.datumakt = null;
        if (table === "c_ucjed" && entry["zrizovatel_ico"] === "Chybí") entry["zrizovatel_ico"] = null;

        const re_date = /^(\d{2})\-(\d{2})\-(\d{4})$/;
        Object.keys(entry).forEach(key => {

          // fix dates          
          const datematch = re_date.exec(entry[key]);

          if (datematch) entry[key] = `${datematch[3]}-${datematch[2]}-${datematch[1]}`;

        })

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

    await new Promise((resolve, reject) => {

      console.log("Parsing XML...");

      requestStream.pipe(parser);

      parser.on("finish", () => {
        process.stdout.write(`Parsed ${entries.length} records            \r\n`);
        resolve();
      })
    })

    console.log("Importing to database");
    while (entries.length) {
      await writer.writeRows(entries.splice(0, 1000));
    }

    await new Promise((resolve, reject) => writer.end(resolve));

  }
}