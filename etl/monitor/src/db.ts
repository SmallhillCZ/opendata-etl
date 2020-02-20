import Knex from "knex";

var db: Knex;

export async function dbConnect() {

  if (db) return db;

  const dbConfigPath = process.env["DB_CONFIG"];

  const dbConfig = dbConfigPath ? await import(dbConfigPath) : {};

  const knexConfig = {
    client: "pg",
    connection: {
      host: process.env["DB_HOST"] || dbConfig["host"],
      database: process.env["DB_NAME"] || dbConfig["database"],
      user: process.env["DB_USER"] || dbConfig["user"],
      password: process.env["DB_PASSWORD"] || dbConfig["password"]
    }
  };

  db = Knex(knexConfig);

  return db;
}