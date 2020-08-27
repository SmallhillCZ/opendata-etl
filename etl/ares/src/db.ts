import Knex from "knex";

import { Config } from "./schema/schema";

export function connectDb(config: Config) {
  
  const knexConfig = {
    client: "pg",
    connection: {
      host: config.host,
      database: config.database,
      user: config.user,
      password: config.password,
    }
  };

  return Knex(knexConfig);

}