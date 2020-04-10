import Knex from "knex";
import zlib from "zlib";
import axios from "axios";
import tar from "tar-stream";
import xml2js from "xml2js";

import { Config } from "./schema";
import { connectDb } from "./db";
import { Readable, PassThrough } from "stream";

const ares_url = "https://wwwinfo.mfcr.cz/ares/ares_vreo_all.tar.gz"

export async function importAres(config: Config) {

  const headers = await axios.head(ares_url).then(res => res.headers);

  const readStream: Readable = await axios({
    method: 'get',
    url: ares_url,
    headers: {
      "Range": "bytes=0-2048"
    },
    responseType: 'stream',
  }).then(res => res.data);

  const gunzip = zlib.createGunzip();
  gunzip.on('error', console.error);

  const extract = tar.extract()

  extract.on('entry', function (header, stream, next) {

    let xmlString = "";
    
    stream.on("data", data => xmlString += data);
    
    stream.on("finish", () => {
      importFile(xmlString).then(() => next())
    });

    stream.resume();
  })


  await new Promise((resolve, reject) => {

    const pipeline = readStream.pipe(gunzip).pipe(extract);

    pipeline.on("finish", () => resolve());

    // connectDb(config);
  })

}

async function importFile(xml: string): Promise<void> {

  const json = await xml2js.parseStringPromise(xml, { explicitArray: false });

  const entrySource = json['are:Ares_odpovedi']['are:Odpoved']['are:Vypis_VREO'];

  const entries = Array.isArray(entrySource) ? entrySource : [entrySource];

  for (let entry of entries) {
    const basic = entry['are:Zakladni_udaje'];
    const owners = entry['are:Statutarni_organ'];

    const osobaData = {
      ico: basic['are:ICO'],
      name: basic['are:ObchodniFirma'],
      sidlo_ruianKod: basic['are:Sidlo']?.['are:ruianKod'],
      sidlo_stat: basic['are:Sidlo']?.['are:stat'],
      sidlo_psc: basic['are:Sidlo']?.['are:psc'],
      sidlo_obec: basic['are:Sidlo']?.['are:obec'],
      sidlo_ulice: basic['are:Sidlo']?.['are:ulice'],
      sidlo_cisloTxt: basic['are:Sidlo']?.['are:cisloTxt'],
      datumZapisu: basic['are:DatumZapisu'],
      datumVymazu: basic['are:DatumVymazu'],
    }

    console.log(osobaData);
  }

}
