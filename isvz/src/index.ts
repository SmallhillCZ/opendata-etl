
import requestPromise from "request-promise-native";
import request from "request";
import Knex from "knex";
import csvParse from "csv-parse";
import { Transform, Writable } from "stream";

import { ETLRecord } from "./schema/etl";
import { ContractCSVRecord, ContractRecord, contractColumns } from "./schema/contract";

//https://www.isvz.cz/ReportingSuite/Explorer/Download/Data/CSV/ZZVZ/2012
const re_csv = /https\:\/\/www.isvz.cz\/ReportingSuite\/Explorer\/Download\/Data\/CSV\/ZZVZ\/(\d{4})/gi;

const DB_SCHEMA = process.env["DB_SCHEMA"] || "src_isvz";

const sourceBoolean: { [key: string]: boolean } = { "True": true, "False": false };

(async function () {

  const index = await requestPromise("http://www.isvz.cz/ISVZ/Podpora/ISVZ_open_data_vz.aspx");

  const files: { url: string, type: string, year: number }[] = [];

  {
    let match: RegExpExecArray | null;
    while (match = re_csv.exec(index)) {
      files.push({
        url: match[0],
        type: "ZZVZ",
        year: Number(match[1])
      });
    }
  }

  // add current year if not present
  {
    const curentYear = (new Date()).getFullYear();
    if (!files.some(file => file.year === curentYear)) {
      files.unshift({
        url: `https://www.isvz.cz/ReportingSuite/Explorer/Download/Data/CSV/ZZVZ/${curentYear}`,
        type: "ZZVZ",
        year: curentYear
      });
    }
  }

  const dbConfig: Knex.Config = {
    client: "pg",
    connection: {
      host: process.env["DB_HOST"],
      database: process.env["DB_NAME"],
      user: process.env["DB_USER"],
      password: process.env["DB_PASSWORD"]
    }
  };

  console.log("Connecting DB...");
  const db = Knex(dbConfig);
  await db.raw("SELECT 1");

  console.log("Loading ETL records...");
  const etls = await db<ETLRecord>(`${DB_SCHEMA}.etl`);

  for (let file of files) {

    console.log("== File:", file.url);

    process.stdout.write(`Checking size...\r`);
    const head: any = await requestPromise.head(file.url, { rejectUnauthorized: false });
    const fileSize = head["content-length"];
    process.stdout.write(`Checking size...${fileSize}\r\n`);

    const etl = etls.find(etl => etl.year === file.year);

    if (etl && etl.size && etl.size === fileSize) {
      console.log("Same size, skipping.");
      continue;
    }

    console.log("Importing data...");
    const csv = request(file.url, { rejectUnauthorized: false });

    const parser = csvParse({
      delimiter: ";",
      skip_lines_with_error: true,
      skip_empty_lines: true,
      columns: contractColumns,
      from_line: 3
    });

    const transformer = new Transform({
      objectMode: true,
      transform(chunk: ContractCSVRecord, encoding: string, callback: (err?: Error | null, chunk?: ContractRecord) => void) {
        callback(null, {
          id_zakazky: chunk["ID_Zakazky"],
          evidencni_cislo_v_zna_vvz: chunk["EvidencniCisloVZnaVVZ"],
          cislo_formulare_na_vvz: chunk["CisloFormulareNaVVZ"],
          druh_formulare: chunk["DruhFormulare"],
          id_casti_vz: chunk["ID_CastiVZ"],
          cislo_casti_vz: chunk["CisloCastiVZ"],
          nazev_casti_vz: chunk["NazevCastiVZ"],
          popis_casti_vz: chunk["PopisCastiVZ"],
          predpokladana_celkova_hodnota_casti_vz: Number(chunk["PredpokladanaCelkovaHodnotaCastiVZ"]),
          predpokladana_celkova_hodnota_casti_vz_mena: chunk["PredpokladanaCelkovaHodnotaCastiVZMena"],
          hlavni_misto_plneni_nuts: chunk["HlavniMistoPlneniNUTS"],
          hlavni_misto_plneni: chunk["HlavniMistoPlneni"],
          cp_vkod: chunk["CPVkod"],
          zakazka_se_vztahuje_kprojektu_fin_zes: chunk["ZakazkaSeVztahujeKprojektuFinZes"],
          projekty_ci_programy_fin_zes: chunk["ProjektyCiProgramyFinZes"],
          datum_odeslani_formulare_na_vvz: chunk["DatumOdeslaniFormulareNaVVZ"],
          platny_formular: sourceBoolean[chunk["PlatnyFormular"]] || null,
        })
      }
    })

    const writer = new DBWriter(db);

    await new Promise((resolve, reject) => {

      csv.pipe(parser).pipe(transformer).pipe(writer);

      writer.on("error", err => reject(err));
      writer.on("finish", () => resolve());

    });

    console.log(`Written ${writer.c} records`);

  }

  console.log("== Finished");
  console.log("Disconnecting DB...");
  await db.destroy();
})();

class DBWriter extends Writable {

  c = 0;

  constructor(private db: Knex) {
    super({
      objectMode: true
    });
  }

  _write(chunk: ContractRecord, encoding: string, callback: (err?: Error | null) => void) {
    return this._writev([{ chunk, encoding }], callback);
  }

  async _writev(chunks: { chunk: ContractRecord, encoding: string }[], callback: (err?: Error | null) => void) {
    
    await this.db<ContractRecord>(`${DB_SCHEMA}.vestnik_vz`).insert(chunks.map(chunk => chunk.chunk))
    
    this.c += chunks.length;

    callback(null);
  }
}