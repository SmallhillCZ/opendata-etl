import { ImportData } from "./import-data";
import { remove, ensureDir } from "fs-extra";
import { ImportCodelists } from "./import-codelists";
import path from "path";
import { dbConnect } from "./db";

(async function () {

  const tmpDir = path.join(__dirname, "../tmp");

  const overwrite = process.env["OVERWRITE"] ? !!JSON.parse(process.env["OVERWRITE"]) : false; // convert 0 and 1 to boolean

  const dry = process.env["DRY"] ? !!JSON.parse(process.env["DRY"]) : false; // convert 0 and 1 to boolean

  const hideProgress = process.env["HIDE_PROGRESS"] ? !!JSON.parse(process.env["HIDE_PROGRESS"]) : false; // convert 0 and 1 to boolean

  await remove(tmpDir);
  await ensureDir(tmpDir);

  /* DATABASE CONNECTION */
  const db = await dbConnect();

  await ImportCodelists({ db, overwrite, dry, tmpDir, hideProgress });

  await ImportData({ db, overwrite, dry, tmpDir, hideProgress });

  console.log("Finished. Disconnecting DB.");

  await db.destroy();

})();