import Knex from "knex";
import { DB_CLIENT, DB_HOST, DB_NAME, DB_USER, DB_PASSWORD } from "./const";
import { ImportProjects } from "./importProjects";
import { ProjectTransform } from "./streams/project-transform";



(async function () {

  console.log("= Initialization");

  var errors = false;

  /* CONFIG */
  const schema = process.env["DB_SCHEMA"] || "PUBLIC";

  const dry = process.env["DRY"] ? !!JSON.parse(process.env["DRY"]) : false;
  const hideProgress = process.env["HIDE_PROGRESS"] ? !!JSON.parse(process.env["HIDE_PROGRESS"]) : false;

  /* DATABASE */
  const db = Knex({
    client: DB_CLIENT,
    connection: {
      host: DB_HOST,
      database: DB_NAME,
      user: DB_USER,
      password: DB_PASSWORD,
    }
  });

  await db.raw("SELECT 1");
  console.log("Connected to db.");

  await ImportProjects(db);

  console.log("\n= Finish");

  await db.destroy();
  console.log("Disconnected from db.");
})();