
import dotenv from "dotenv";

dotenv.config();

export const OVERWRITE = process.env["OVERWRITE"] ? !!JSON.parse(process.env["OVERWRITE"]) : false;

export const SCHEMA = process.env["DB_SCHEMA"] || "PUBLIC";

export const DB_CLIENT = process.env["DB_CLIENT"];
export const DB_HOST = process.env["DB_HOST"];
export const DB_NAME = process.env["DB_NAME"];
export const DB_USER = process.env["DB_USER"];
export const DB_PASSWORD = process.env["DB_PASSWORD"];

export const TABLE_ETL = `${SCHEMA}.etl`;
export const TABLE_PROJECTS = `${SCHEMA}.projekty`;