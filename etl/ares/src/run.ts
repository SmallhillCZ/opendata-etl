import { AresImporter } from "./importer";


(async function () {

  const config = {
    host: process.env["DB_HOST"] || "localhost",
    database: process.env["DB_NAME"] || "postgres",
    user: process.env["DB_USER"],
    password: process.env["DB_PASSWORD"],
    schema: process.env["DB_SCHEMA"] || "src_ares",
  };

  const importer = new AresImporter(config);

  console.log("Starting import...");
  await importer.importAres();
  console.log("Finished.");

})();