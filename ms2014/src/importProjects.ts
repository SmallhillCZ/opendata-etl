import axios from "axios";
import { Knex } from "knex";
import { SaxesStream } from "saxes-stream";
import { Readable } from "stream";
import { pipeline } from "stream/promises";
import { OVERWRITE, SCHEMA, TABLE_ETL, TABLE_PROJECTS } from "./const";
import { DBWriter } from "./streams/db-writer";
import { ProjectTransform } from "./streams/project-transform";

export async function ImportProjects(db: Knex) {

  console.log("\n= Import projects");

  const url = "https://ms14opendata.mssf.cz/SeznamProjektu.xml";

  const oldEtl = await db<ETLRecord>(`${SCHEMA}.etl`).where({ url }).first();


  const head = await axios.head(url);
  const etag = head.headers["etag"];
  const modified = head.headers["last-modified"];

  const changed = oldEtl?.etag && etag && oldEtl.etag === etag;

  if (!OVERWRITE && changed) {
    console.log("Nothing changed, skipping...");
    return;
  }

  console.log("New data!");

  console.log("Deleting old data...");
  await db(TABLE_PROJECTS).truncate();

  console.log("Importing new data...");

  const httpStream: Readable = await axios.get(url, { responseType: "stream", }).then(response => response.data);

  const parser = new SaxesStream();

  const transfomer = new ProjectTransform();

  const writer = new DBWriter(db);

  await pipeline(
    httpStream,
    parser,
    transfomer,
    writer
  );

  console.log("Writing ETL record...");
  await db(TABLE_ETL).where({ url }).delete();
  await db(TABLE_ETL).insert({ url, etag, modified, checked: new Date() });

  console.log("Finished.");

}