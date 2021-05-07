import Knex from "knex";
import { DB_CLIENT, DB_HOST, DB_NAME, DB_PASSWORD, DB_USER } from "./const";
import { ImportProjects } from "./importProjects";



(async function () {

  console.log("= Initialization");

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