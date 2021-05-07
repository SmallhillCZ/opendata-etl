import parse from "csv-parse";
import download from "download";
import Knex from "knex";
import StreamZip from "node-stream-zip";
import path from "path";
import request from "request-promise-native";
import { Readable } from "stream";
import { EtlRecord, MonitorDataset } from "./schema";
import { DatabaseWriter } from "./writer";

export async function ImportData(options: { db: Knex, dry: boolean, tmpDir: string, hideProgress: boolean; }) {

  const { db, dry, tmpDir, hideProgress } = options;

  const tableMapping = {
    "rozv1": "rozv",
    "rozv2": "rozv",
    "vykzz1": "vykzz"
  };


  /* FIND SOURCE FILES */
  const datasets: MonitorDataset[] = await request.get("https://monitor.statnipokladna.cz/api/transakcni-data?aktivni=true", { json: true });

  let importFiles: { name: string, year: number, month: number, modified: string; }[] = [];

  importFiles = datasets
    .map(dataset => dataset.dataExtracts)
    .flat()
    .filter(resource => resource.format === "CSV")
    .map(resource => ({ name: resource.filenamePeriod, year: resource.year, month: resource.month, modified: resource.modified }));

  if (importFiles.length) {
    console.log(`Found ${importFiles.length} data files.`);
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

    const filePath = "http://monitor.statnipokladna.cz/data/extrakty/csv/" + file.name;

    const year = { year: file.year, month: file.month };

    console.log(`\n== File ${filePath} (Year: ${file.year}, Month: ${file.month})`);

    try {
      var head = await request.head(filePath);
      var etag = head["etag"];

      if (etags[file.name] === etag) {
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

    console.log("Downloading...");

    await download(filePath, tmpDir);

    try {
      var zip = new StreamZip({
        file: path.join(tmpDir, path.basename(filePath)),
        storeEntries: true,
        skipEntryNameValidation: false
      });

      await new Promise((resolve, reject) => {
        zip.on('error', reject);
        zip.on('ready', resolve);
      });
    }
    catch (err) {
      console.log("Error opening zip file.", err);
      continue;
    }

    const clearedTables: string[] = [];

    const csvFiles = Object.entries(zip.entries()).map(([name, entry]) => ({ name, entry }));

    console.log("Contained CSV files: " + csvFiles.map(file => file.name).join(", "));

    for (let csvFile of csvFiles) {

      // get target table name from the csv filename
      const match = csvFile.name.match(/^[^_\.]+/);
      if (!match) continue;

      let table = match![0]
        .toLowerCase()
        .replace(/\-/g, "_");

      if (tableMapping[table]) table = tableMapping[table];

      // check if corresponding table present in database
      if (tables.indexOf(table) === -1) {
        console.log(`Table ${table} not found. Skipping.`);
        continue;
      }

      // add the schema name to the table
      table = "src_monitor." + table;

      // manually skp errorneous files, issues reported to C42 and waiting for solution
      const manualSkip: boolean[] = [
        table === "src_monitor.finu102" && year.year === 2014 && year.month === 6, // bad header
        table === "src_monitor.rozv" && year.year === 2014 && year.month === 6, // bad header in file rozv2
        table === "src_monitor.rozv" && year.year === 2014 && year.month === 9, // bad header in file rozv2
        table === "src_monitor.rozv" && year.year === 2014 && year.month === 12 // bad header in file rozv2
      ];
      if (manualSkip.some(item => item)) {
        console.log("Skipping manually defined errorneous file");
        continue;
      }

      const csvOptions: parse.Options = {

        delimiter: ";",

        columns: header => header.map((column: string) => {

          column = column.replace(/^.*:/, ""); // remove double headers
          column = column.replace(/^\d+/, ""); // remove leading numbers
          column = column.replace("/BIC/", ""); // remove leading numbers
          column = column.toLowerCase(); // lowercase

          // ad hoc fixes
          if (table === "src_monitor.finu103" && column === "zu_aktz") column = "zu_akzt"; // fix column typo
          if (table === "src_monitor.finsf03" && column === "zu_aktz") column = "zu_akzt"; // fix column typo

          return column;
        }),

        skip_lines_with_error: true

      };

      // custom parsing rules for different files
      if (file.name === "2010_12_Data_CSUIS_ROZV.zip") csvOptions.to_line = 2495919 - 1; // error thrown because last line has column count of 1

      // encapsulate to keep await/async flow
      try {
        await new Promise<void>(async (resolve, reject) => {

          // initialize CSV parser stream, matching of CSV headers to table fields
          const parser = parse(csvOptions);

          parser.on('error', err => { throw err; });

          // initialize database writable stream
          const writer = new DatabaseWriter(table, db, { year, dry, hideProgress });
          writer.on('error', err => { throw err; });

          // clear current contents
          if (clearedTables.indexOf(table) === -1) {
            console.log(`Clearing data in the table ${table} for year ${year.year} and month ${year.month}...`);
            await writer.clear();
            clearedTables.push(table);
          }

          // import new data
          console.log(`Importing file ${csvFile.name} into table ${table} with year ${year.year} and month ${year.month}...`);

          // create stream from current zipped CSV entry
          zip.stream(csvFile.entry, (err: Error, csvStream: Readable) => {

            // save error status to prevent promise resolve after rejection or duplicate rejection
            var error = false;

            // catch errors from all streams
            csvStream.on('error', err => { error = true; if (!error) reject(err); });

            // resolve on the last stream finish
            writer.on('finish', () => { if (!error) resolve(); });

            // pipe CSV file through CSV parser to DB writer
            csvStream.pipe(parser).pipe(writer);
          });

        });

      }
      catch (err) {
        console.log("Failed to parse and import CSV", err);
        continue;
      }
    }

    await db<EtlRecord>("src_monitor.etl").where({ name: file.name }).delete();
    await db<EtlRecord>("src_monitor.etl").insert({ etag, name: file.name, modified: file.modified, timestamp: (new Date()).toISOString() });

  }

  console.log("Performing ANALYZE on all tables...");

  for (let table of tables) {
    await db.raw("ANALYZE ?", db.raw("src_monitor." + table));
  }

}
