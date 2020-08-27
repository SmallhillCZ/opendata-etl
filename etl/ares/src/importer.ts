import Knex from "knex";
import zlib from "zlib";
import axios from "axios";
import tar from "tar-stream";
import { performance } from 'perf_hooks';

import { Config, Record_fosoba, Record_vazba, Record_subjekt, Address, Record_posoba } from "./schema/schema";
import { connectDb } from "./db";
import { Readable } from "stream";
import { AresParser } from "./parser";


export class AresImporter {


  ares_url = "https://wwwinfo.mfcr.cz/ares/ares_vreo_all.tar.gz";

  db?: Knex;

  fosoba_index: any = {};
  posoba_index: any = {};

  constructor(private config: Config) {
  }

  async connectDB() {
    if (this.db) return this.db;
    this.db = connectDb(this.config);
    return this.db;
  }

  async importAres() {

    const db = await this.connectDB();

    console.log("Importing ARES");

    const headers = await axios.head(this.ares_url).then(res => res.headers);

    console.log("Last Modified:", headers["last-modified"]);

    console.log("Deleting old data...");
    await db(this.config.schema + ".vreo_fosoba").delete();
    // await db(this.config.schema + ".vreo_posoba").delete();
    await db(this.config.schema + ".vreo_subjekt").delete();
    await db(this.config.schema + ".vreo_vazba").delete();

    console.log("Importing...");

    var c = 0;
    const timing = {
      parsing: 0,
      processing: 0,
      saving: 0,
      other: 0,
      total: 0
    };

    const startTime = performance.now();

    const readStream: Readable = await axios({
      method: 'get',
      url: this.ares_url,
      headers: {
        "Range": "bytes=0-2000"
      },
      responseType: 'stream',
    }).then(res => res.data);

    const gunzip = zlib.createGunzip();

    const extract = tar.extract()

    extract.on('entry', (header, stream, next) => {

      let xmlString = "";

      stream.on("data", data => xmlString += data);

      stream.on("finish", () => {

        this.importFile(db, xmlString, timing).then(() => {
          c++;
          if (c % 1000 === 0) process.stdout.write(".");
          if (c % 10000 === 0) process.stdout.write(String(c));
          next();
        });

      });

      stream.resume();
    })


    await new Promise((resolve, reject) => {

      let error = false;

      extract.on("finish", () => resolve());

      extract.on("error", err => { if (!error) { error = true; console.error(err); resolve(); } });
      gunzip.on("error", err => { if (!error) { error = true; console.error(err); resolve(); } });
      readStream.on("error", err => { if (!error) { error = true; console.error(err); resolve(); } });

      const pipeline = readStream.pipe(gunzip).pipe(extract);

    });


    timing.total = performance.now() - startTime;
    timing.other = timing.total - timing.parsing - timing.processing - timing.saving;

    console.log(`Finished. Imported ${c} files in ${Math.round(timing.total / 1000 * 10) / 10}s (Parsing: ${Math.round(timing.parsing / 1000 * 10) / 10}s Processing: ${Math.round(timing.processing / 1000 * 10) / 10}s Saving: ${Math.round(timing.saving / 1000 * 10) / 10}s Other: ${Math.round(timing.other / 1000 * 10) / 10}s)`);

    console.log("Disconnecting DB");
    // await db.destroy();

  }

  async importFile(db: Knex, xml: string, timing: { processing: number, parsing: number, saving: number }): Promise<void> {

    const parseTime = performance.now();
    const parser = new AresParser();

    const data = await parser.parse(xml);
    console.log(data);
    timing.parsing += performance.now() - parseTime;
    return;

    const processTime = performance.now();
    const entrySource = json['are:Ares_odpovedi']['are:Odpoved']['are:Vypis_VREO'];

    const entries = Array.isArray(entrySource) ? entrySource : [entrySource];


    for (let subject of parser.getSubjects()) {

      if(!subject.ico){
        process.stdout.write("x");
        continue;
      }

      if (subject.board) {
        const members = board['are:Clen'] ? (Array.isArray(board['are:Clen']) ? board['are:Clen'] : [board['are:Clen']]) : [];

        for (let member of members) {

          const vazbaData: Record_vazba = {
            subjekt_ico: subjektData.ico,
            organ_nazev: board['are:Nazev'],
            funkce_nazev: member['are:funkce']?.['are:nazev'],
            fosoba_id: member['are:fosoba'] && await this.get_fosoba(db, member['are:fosoba']),
            posoba_id: member['are:posoba'] && await this.get_posoba(db, member['are:posoba']),
          }

          await db<Record_vazba>(this.config.schema + ".vreo_vazba").insert(vazbaData);

        }
      }

      await db<Record_subjekt>(this.config.schema + ".vreo_subjekt").insert(subjektData);

    }

    timing.processing += performance.now() - processTime;

  }



  async get_fosoba(db: Knex, data: any): Promise<Record_fosoba["id"]> {

    const fosoba: Omit<Record_fosoba, "id"> = {
      bydliste: data['are:adresa'] && this.parseAddress(data['are:adresa']),
      jmeno: data['are:jmeno'],
      prijmeni: data['are:prijmeni'],
      titul_pred: data['are:titulPred'],
      titul_za: data['are:titulZa'],
    }

    const id = [fosoba.bydliste?.ruian_kod, fosoba.bydliste?.obec, fosoba.bydliste?.ulice, fosoba.jmeno, fosoba.prijmeni].join("%").replace(/[^a-z0-9%]/gi, "");

    if (!this.fosoba_index[id]) {
      const result = await db<Record_fosoba>(this.config.schema + ".vreo_fosoba").insert(fosoba, "id");
      this.fosoba_index[id] = { id: result[0], ...fosoba };
    }

    return this.fosoba_index[id]["id"];
  }



  async get_posoba(db: Knex, data: any): Promise<Record_posoba["ico"]> {

    const id = data['are:ICO'];

    if (id && this.posoba_index[id]) return this.posoba_index[id].ico;

    const posoba: Record_posoba = {
      ico: data['are:ICO'],
      obchodni_firma: data['are:ObchodniFirma'],
      pravni_forma: data['are:PravniForma'],
      zastoupeni: undefined,
    };

    if (data['are:Zastoupeni']?.['are:fosoba']) posoba.zastoupeni = await this.get_fosoba(db, data['are:Zastoupeni']?.['are:fosoba']);

    await db<Record_posoba>(this.config.schema + ".vreo_posoba").insert(posoba);

    if (posoba.ico) this.posoba_index[posoba.ico] = posoba;

    return posoba.ico;
  }


}