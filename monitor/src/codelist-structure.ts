import request from "request-promise-native";
import Knex from "knex";
import { writeFile, ensureDir } from "fs-extra";
import path from "path";

(async function () {

  const html = await request.get("http://monitor.statnipokladna.cz/2019/zdrojova-data/ciselniky");

  const files: { path: string, table: string }[] = [];
  const files_re = /\/xsd\/monitor(.+)\.xsd/g;

  const db = Knex({ client: "pg" });

  const sql: string[] = [];

  let match: RegExpExecArray | null;

  while (match = files_re.exec(html)) {
    if (match) {
      files.push({
        path: match[0],
        table: "c_" + match[1].toLowerCase()
      });
    }
  }

  for (let file of files) {

    console.log(`== Reading file ${file.path}`);

    try {
      var xsd = await request.get("http://monitor.statnipokladna.cz" + file.path);
    }
    catch (err) {
      console.log("Error getting XSD file. Skipping.")
      continue;
    }

    const object_re = /<xs:element.+<xs:element.+<xs:sequence>(.+?)<\/xs:sequence>/s;


    const object_match = object_re.exec(xsd);

    if (!object_match) {
      console.log("Error: Did not match object sequence.");
      continue;
    }

    const object = object_match[1];

    const element_re = /<xs:element type="xs:([^"]+)" name="([^"]+)"\/>/g;

    const elements: { type: string, name: string }[] = [];

    let match: RegExpExecArray | null;

    while (match = element_re.exec(object)) {
      if (match) {
        elements.push({
          type: match[1],
          name: match[2]
        });
      }
    }

    sql.push("-- Table " + file.table);

    console.log("Columns: " + elements.map(element => element.name).join(", "));

    sql.push(`DROP VIEW IF EXISTS d_monitor.${file.table};`);

    sql.push(db.schema.withSchema("src_monitor").dropTableIfExists(file.table).toString() + ";");

    sql.push(db.schema.withSchema("src_monitor").createTable(file.table, table => {
      for (let element of elements) {

        if (element.name.match(/_date$/)) element.type = "date";
        switch (element.type) {

          case "byte":
            table.specificType(element.name, "SMALLINT");
            break;

          case "int":
          case "short":
            table.integer(element.name);
            break;

          case "long":
            table.bigInteger(element.name);
            break;

          case "string":
            table.string(element.name, undefined);
            break;

          case "date":
            table.date(element.name);
            break;

          default:
            throw new Error("Unknown element type: " + element.type);
        }

      }
    }).toString() + ";");

    sql.push(`CREATE VIEW d_monitor.${file.table} AS SELECT * FROM src_monitor.${file.table};`);


    sql.push(`GRANT ALL ON TABLE src_monitor.${file.table} TO etl;`);
    sql.push(`GRANT SELECT ON TABLE d_monitor.${file.table} TO PUBLIC;`);

    sql.push("\r\n");
  }

  

  const outputDir = path.join(__dirname, "../output");
  const outputFile = path.join(outputDir, "codelists.sql");
  await ensureDir(outputDir);

  console.log("Writing file...");
  await writeFile(outputFile, sql.join("\r\n"));

  console.log("SQL written to file " + outputFile);
})();