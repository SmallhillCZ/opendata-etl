import { Transform, TransformCallback } from "stream";
import { SaxesStreamChunk } from "saxes-stream";

export type ISVZType = "Zadani" | "VZ" | "Dodavatele" | "CastiVZ" | "HodnoticiKriteria";

export class ISVZParser extends Transform {

  type: string;

  data: any;

  re_record = /^\.[^\.]+\.([^\.]+)$/;
  re_value = /[^\.]+$/;

  _transform(chunk: SaxesStreamChunk, encoding: string, callback: TransformCallback) {
    if (chunk.event === "opentag") {

      const header = this.re_record.exec(chunk.path);

      if (header) {
        this.type = header[1];
      }

    }

    if (chunk.event === "text") {
      const value = this.re_value.exec(chunk.path);

      if(value){
        this.data[value[1]] = chunk.
      }

    callback();
  }

}