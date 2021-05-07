import Knex from "knex";
import zlib from "zlib";
import axios from "axios";
import tar from "tar-stream";
import xml2js from "xml2js";
const { PerformanceObserver, performance } = require('perf_hooks');

import { Config, Record_fosoba } from "./schema";
import { connectDb } from "./db";
import { Readable, PassThrough } from "stream";
import { create } from "domain";

const ares_url = "https://wwwinfo.mfcr.cz/ares/ares_vreo_all.tar.gz"

export async function importAres(config: Config) {

  console.log("Importing ARES");

  const headers = await axios.head(ares_url).then(res => res.headers);

  const db = connectDb(config);

  console.log("Last Modified:", headers["last-modified"]);

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
    url: ares_url,
    headers: {
      "Range": "bytes=0-2000"
    },
    responseType: 'stream',
  }).then(res => res.data);

  const gunzip = zlib.createGunzip();

  const extract = tar.extract()

  extract.on('entry', function (header, stream, next) {

    let xmlString = "";

    stream.on("data", data => xmlString += data);

    stream.on("finish", () => {

      importFile(db, xmlString, timing).then(() => {
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

  })


  timing.total = performance.now() - startTime;
  timing.other = timing.total - timing.parsing - timing.processing - timing.saving;

  console.log(`Finished. Imported ${c} files in ${Math.round(timing.total / 1000 * 10) / 10}s (Parsing: ${Math.round(timing.parsing / 1000 * 10) / 10}s Processing: ${Math.round(timing.processing / 1000 * 10) / 10}s Saving: ${Math.round(timing.saving / 1000 * 10) / 10}s Other: ${Math.round(timing.other / 1000 * 10) / 10}s)`);

}

async function importFile(db: Knex, xml: string, timing: { processing: number, parsing: number, saving: number }): Promise<void> {

  const parseTime = performance.now();
  const json = await xml2js.parseStringPromise(xml, { explicitArray: false });
  timing.parsing += performance.now() - parseTime;

  const processTime = performance.now();
  const entrySource = json['are:Ares_odpovedi']['are:Odpoved']['are:Vypis_VREO'];

  const entries = Array.isArray(entrySource) ? entrySource : [entrySource];

  const fosoba_array = [];
  const fosoba_index: any = {};

  for (let entry of entries) {
    const basic = entry['are:Zakladni_udaje'];
    const board = entry['are:Statutarni_organ'];

    const subjektData = {
      ico: basic['are:ICO'],
      obchodni_firma: basic['are:ObchodniFirma'],
      sidlo: {
        ruianKod: basic['are:Sidlo']?.['are:ruianKod'],
        stat: basic['are:Sidlo']?.['are:stat'],
        psc: basic['are:Sidlo']?.['are:psc'],
        obec: basic['are:Sidlo']?.['are:obec'],
        ulice: basic['are:Sidlo']?.['are:ulice'],
        cisloTxt: basic['are:Sidlo']?.['are:cisloTxt'],
      },
      datum_zapisu: basic['are:DatumZapisu'],
      datum_vymazu: basic['are:DatumVymazu'],
    }

    if (board) {
      const members = board['are:Clen'] ? (Array.isArray(board['are:Clen']) ? board['are:Clen'] : [board['are:Clen']]) : [];

      for (let member of members) {

        let fosoba_id;
        let posoba_id;

        if (member['are:fosoba']) {
          const fosoba: Omit<Record_fosoba, "id"> = {
            adresa: {
              ruianKod: member['are:fosoba']['are:adresa']?.['are:ruianKod'],
              stat: member['are:fosoba']['are:adresa']?.['are:stat'],
              psc: member['are:fosoba']['are:adresa']?.['are:psc'],
              obec: member['are:fosoba']['are:adresa']?.['are:obec'],
              ulice: member['are:fosoba']['are:adresa']?.['are:ulice'],
              cisloTxt: member['are:fosoba']['are:adresa']?.['are:cisloTxt'],
            },
            jmeno: member['are:fosoba']['are:jmeno'],
            prijmeni: member['are:fosoba']['are:prijmeni'],
            titul_pred: member['are:fosoba']['are:titulPred'],
            titul_za: member['are:fosoba']['are:titulZa'],
          }

          const hashString = [fosoba.adresa.ruianKod, fosoba.adresa.obec, fosoba.adresa.ulice, fosoba.jmeno, fosoba.prijmeni].join("%").replace(/[^a-z0-9%]/gi, "");

          if (!fosoba_index[hashString]) {
            fosoba_index[hashString] = await create_fosoba(db, fosoba);
          }

          fosoba_id = fosoba_index[hashString].id;
        }

        if (member['are:posoba']) {
          // TODO
        }

        const vazbaData = {
          subjekt_ico: subjektData.ico,
          organ_nazev: board['are:Nazev'],
          funkce_nazev: member['are:funkce']?.['are:nazev'],
          fosoba_id,
          posoba_id
        }

        console.log(vazbaData)

      }
    }

  }

  timing.processing += performance.now() - processTime;

}

async function create_fosoba(db: Knex, fosoba: Omit<Record_fosoba, "id">): Promise<Record_fosoba["id"]> {
  const result = await db<Record_fosoba>("src_ares.vreo_fosoba").insert(fosoba, "id");
  return result[0];
}