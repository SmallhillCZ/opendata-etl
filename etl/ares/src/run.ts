import { importAres } from "./";

(async function () {

  const config = {
    host: process.env["DB_HOST"] || "localhost",
    database: process.env["DB_NAME"] || "postgres",
    user: process.env["DB_USER"],
    password: process.env["DB_PASSWORD"],
  };

  console.log("Starting import...");
  await importAres(config);
  console.log("Finished.");

})();