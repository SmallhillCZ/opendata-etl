import request from "request-promise-native";
import path from "path";
import download from "download";
import StreamZip from "node-stream-zip";
import Knex from "knex";
import parse from "csv-parse";
import { Readable } from "stream";
import { DatabaseWriter } from "./writer";

export async function ImportData(options: { db: Knex, overwrite: boolean, dry: boolean, tmpDir: string, hideProgress: boolean }) {

  const { db, overwrite, dry, tmpDir, hideProgress } = options;

  const filePatterns = [
    /\/data\/(\d{4})_(\d{2})_Data_CSUIS_ROZV.zip/g,
    /\/data\/(\d{4})_(\d{2})_Data_CSUIS_FINM.zip/g,
    /\/data\/(\d{4})_(\d{2})_Data_CSUIS_FINSF.zip/g,
    /\/data\/(\d{4})_(\d{2})_Data_CSUIS_FINU.zip/g,
    /\/data\/(\d{4})_(\d{2})_Data_CSUIS_MISRIS.zip/g
  ];

  const tableMapping = {
    "rozv1": "rozv",
    "rozv2": "rozv"
  };

  /* FIND SOURCE FILES */
  const html = await request.get("https://monitor.statnipokladna.cz/2019/zdrojova-data/transakcni-data");

  let importFiles: { name: string, year: number, month: number }[] = [];

  let match: RegExpExecArray | null;

  for (let filePattern of filePatterns) {
    while (match = filePattern.exec(html)) {
      if (match) importFiles.push({ name: match[0], year: Number(match[1]), month: Number(match[2]) });
    }
  }

  if (importFiles.length) {
    console.log(`Found ${importFiles.length} data files.`);
  }
  else {
    throw new Error(`Found ${importFiles.length} data files.`);
  }

  const tables = await db("pg_catalog.pg_tables")
    .select("tablename")
    .where({ "schemaname": "src_monitor" })
    .then((result: { tablename: string }[]) => result.map(row => row.tablename));

  for (let file of importFiles) {

    const filePath = "http://monitor.statnipokladna.cz" + file.name;

    const year = { year: file.year, month: file.month };

    console.log(`== File ${filePath} ==`);
    console.log(`Year: ${file.year}, Month: ${file.month}`);
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
        (table === "src_monitor.rozv1" || table === "src_monitor.rozv2") && year.year === 2014 && year.month === 6, // bad header in file rozv2
        (table === "src_monitor.rozv1" || table === "src_monitor.rozv2") && year.year === 2014 && year.month === 9, // bad header in file rozv2
        (table === "src_monitor.rozv1" || table === "src_monitor.rozv2") && year.year === 2014 && year.month === 12 // bad header in file rozv2
      ];
      if (manualSkip.some(item => item)) {
        console.log("Skipping manually defined errorneous file");
        continue;
      }

      // check if data present in the target table for the current year and month
      const rowCount = await db(table).where(year).count().then(count => count[0].count);

      // if data present and overwrite not allowed, skip this CSV
      if (rowCount > 0 && !overwrite) {
        console.log(`Table ${table} not empty for year ${year.year} and month ${year.month}. Skipping.`);
        continue;
      }

      // encapsulate to keep await/async flow
      try {
        await new Promise(async (resolve, reject) => {

          // initialize CSV parser stream, matching of CSV headers to table fields
          const parser = parse({
            delimiter: ";",
            columns: header => header.map((column: string) => {

              column = column.replace(/^.*:/, ""); // remove double headers
              column = column.replace(/^\d+/, ""); // remove leading numbers
              column = column.replace("/BIC/", ""); // remove leading numbers
              column = column.toLowerCase(); // lowercase

              // ad hoc fixes
              if (table === "src_monitor.finsf03" && column === "zu_aktz") column = "zu_akzt"; // fix column typo

              return column;
            })
          });

          parser.on('error', err => { throw err; });

          // initialize database writable stream
          const writer = new DatabaseWriter(table, db, { year, dry, hideProgress });
          writer.on('error', err => { throw err; });

          // clear current contents
          console.log(`Clearing ${rowCount} rows in the table ${table}...`);
          await writer.clear();

          // import new data
          console.log(`Importing table ${table}...`);

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

  }

  console.log("Performing ANALYZE on all tables...")

  for (let table of tables) {
    await db.raw("ANALYZE ?", db.raw("src_monitor." + table));
  }

}
