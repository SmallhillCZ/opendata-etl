import { Transform } from "stream";
import { DumpMetadata } from "../schema/source";
import { SaxesStreamChunk } from "saxes-stream";



export class IndexTransform extends Transform {

  dump: Partial<DumpMetadata> = {};

  constructor() {
    super({ objectMode: true });
  }

  _transform(chunk: SaxesStreamChunk, encoding: string, callback: (err?: Error) => void) {

    if (chunk.event === "text") {
      switch (chunk.path) {
        case ".index.dump.dokoncenyMesic": this.dump["dokonceny_mesic"] = chunk.text === "1"; break; //boolean
        case ".index.dump.odkaz": this.dump["odkaz"] = chunk.text; break; //string
        case ".index.dump.den": this.dump["den"] = Number(chunk.text); break; //number
        case ".index.dump.mesic": this.dump["mesic"] = Number(chunk.text); break; //number
        case ".index.dump.rok": this.dump["rok"] = Number(chunk.text); break; //number
        case ".index.dump.hashDumpu": this.dump["hash_dumpu"] = chunk.text; break; //string
        case ".index.dump.velikostDumpu": this.dump["velikost_dumpu"] = chunk.text; break; //string
        case ".index.dump.casGenerovani": this.dump["cas_generovani"] = chunk.text; break; //string
      }
    }

    if (chunk.event === "closetag") {
      switch (chunk.path) {
        case ".index.dump":
          this.push(this.dump);
          this.dump = {};
          break;
      }
    }

    callback();

  }
}