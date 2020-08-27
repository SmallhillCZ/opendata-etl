
import axios from "axios";
import https from "https";
import Knex from "knex";
import csvParse from "csv-parse";
import stripBomStream from "strip-bom-stream";

import { ETLRecord } from "./schema/etl";
import { contractColumns } from "./schema/contract";
import { ISVZTransformer } from "./transformer";
import { DBWriter } from "./writer-vz";

const DB_SCHEMA = process.env["DB_SCHEMA"] || "src_isvz";

//https://www.isvz.cz/ReportingSuite/Explorer/Download/Data/CSV/ZZVZ/2012
const re_csv = /https\:\/\/www.isvz.cz\/ReportingSuite\/Explorer\/Download\/Data\/CSV\/ZZVZ\/(\d{4})/gi;

(async function () {

  /* FIND IMPORT FILES */
  console.log("Loading index file...");
  const index = await axios.get("http://www.isvz.cz/ISVZ/Podpora/ISVZ_open_data_vz.aspx", { responseType: "text" });

  if (!index) {
    console.log("Cant load index file.");
    return;
  }

  const files: { url: string, type: string, year: number }[] = [];

  {
    let match: RegExpExecArray | null;
    while (match = re_csv.exec(index.data)) {
      files.push({
        url: match[0],
        type: "ZZVZ",
        year: Number(match[1])
      });
    }
  }

  
  {
    const curentYear = (new Date()).getFullYear();
    if (!files.some(file => file.year === curentYear)) {
      files.unshift({
        url: `https://www.isvz.cz/ReportingSuite/Explorer/Download/Data/CSV/ZZVZ/${curentYear}`,
        type: "ZZVZ",
        year: curentYear
      });
    }
  }

  /* CONNECT DB */
  const dbConfig: Knex.Config = {
    client: "pg",
    connection: {
      host: process.env["DB_HOST"],
      database: process.env["DB_NAME"],
      user: process.env["DB_USER"],
      password: process.env["DB_PASSWORD"]
    }
  };

  console.log("Connecting DB...");
  const db = Knex(dbConfig);
  await db.raw("SELECT 1");


  /* LOAD ETL LOG */
  console.log("Loading ETL records...");
  const etls = await DBWriter.loadEtls(db);

  for (let file of files) {

    console.log("== File:", file.url);

    process.stdout.write(`Checking size...\r`);
    const head = await axios.head(file.url, { httpsAgent: new https.Agent({ rejectUnauthorized: false }) });
    const fileSize = Number(head.headers["content-length"]);
    process.stdout.write(`Checking size...${fileSize}\r\n`);

    const etl = etls.find(etl => etl.year === file.year);

    if (etl && etl.size && etl.size === fileSize) {
      console.log("Same size, skipping.");
      continue;
    }

    /* EXTRACT */
    const parser = csvParse({
      delimiter: ";",
      record_delimiter: "\r\n",
      skip_empty_lines: true,
      skip_lines_with_error: true,
      columns: contractColumns,
      from_line: 3
    });

    /* TRANSFORM */
    const transformer = new ISVZTransformer();

    /* LOAD */
    const writer = new DBWriter(db, file.year, file.url, fileSize);


    /* RUN IMPORT */
    console.log("Clearing table for year", file.year)
    await writer.clear();

    console.log("Importing...")

    const csvRequest = await axios.get(file.url, { responseType: "stream", httpsAgent: new https.Agent({ rejectUnauthorized: false }) });
    if (!csvRequest) {
      // TODO: handle error
    }
    const csvStream = csvRequest.data;

    await new Promise((resolve, reject) => {

      csvStream.pipe(stripBomStream()).pipe(parser).pipe(transformer).pipe(writer);

      writer.on("error", err => reject(err));
      writer.on("finish", () => resolve());

    });

    console.log(`Written ${writer.c} records`);

  }

  console.log("== Finished");
  console.log("Disconnecting DB...");
  await db.destroy();
})();


