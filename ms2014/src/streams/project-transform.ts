import { SaxesStreamChunk } from "saxes-stream";
import { Transform, TransformOptions } from "stream";
import { TABLE_PROJECTS } from "../const";
import { ProjectRecord } from "../schema/project-record";
import { DBWriterChunk } from "./db-writer";

export class ProjectTransform extends Transform {

  project: Partial<ProjectRecord> = {};

  constructor(streamOptions: TransformOptions = {}) {
    super({ ...streamOptions, objectMode: true });
  }

  _transform(chunk: SaxesStreamChunk, encoding: string, callback: (err?: Error) => void) {

    if (chunk.event === "opentag") {
      switch (chunk.path) {
        case ".EXPORT.PRJ":
          this.project = {};
          break;
      }
    }

    if (chunk.event === "text") {
      switch (chunk.path) {
        case ".EXPORT.PRJ.ID": this.project.id = chunk.text; break;
        case ".EXPORT.PRJ.ID_VYZVA": this.project.id_vyzva = chunk.text; break;
        case ".EXPORT.PRJ.KOD": this.project.kod = chunk.text; break;
        case ".EXPORT.PRJ.NAZ": this.project.naz = chunk.text; break;
        case ".EXPORT.PRJ.POPIS": this.project.popis = chunk.text; break;
        case ".EXPORT.PRJ.PROBLEM": this.project.problem = chunk.text; break;
        case ".EXPORT.PRJ.CIL": this.project.cil = chunk.text; break;
        case ".EXPORT.PRJ.DZRSKUT": this.project.dzrskut = chunk.text; break;
        case ".EXPORT.PRJ.DURPRED": this.project.durpred = chunk.text; break;
        case ".EXPORT.PRJ.DURSKUT": this.project.durskut = chunk.text; break;
        case ".EXPORT.PRJ.SUK": this.project.suk = chunk.text; break;

        // case ".EXPORT.PRJ.PRJSC.SC": this.project.naz = chunk.text; break;

        // case ".EXPORT.PRJ.ZAD.NAZ": this.project.naz = chunk.text; break;
        // case ".EXPORT.PRJ.ZAD.IC": this.project.naz = chunk.text; break;
        // case ".EXPORT.PRJ.ZAD.HPF": this.project.naz = chunk.text; break;

        // case ".EXPORT.PRJ.UM.T": this.project.naz = chunk.text; break;
        // case ".EXPORT.PRJ.UM.NZ": this.project.naz = chunk.text; break;

        // case ".EXPORT.PRJ.PF.T": this.project.naz = chunk.text; break;
        // case ".EXPORT.PRJ.PF.CZV": this.project.naz = chunk.text; break;
        // case ".EXPORT.PRJ.PF.EU": this.project.naz = chunk.text; break;
        // case ".EXPORT.PRJ.PF.CZV": this.project.naz = chunk.text; break;
        // case ".EXPORT.PRJ.PF.CNV": this.project.naz = chunk.text; break;
        // case ".EXPORT.PRJ.PF.SN": this.project.naz = chunk.text; break;
        // case ".EXPORT.PRJ.PF.ESIF": this.project.naz = chunk.text; break;
        // case ".EXPORT.PRJ.PF.CV": this.project.naz = chunk.text; break;

        // case ".EXPORT.PRJ.CILSKUP.CSKOD": this.project.naz = chunk.text; break;

      }
    }

    if (chunk.event === "closetag") {

      switch (chunk.path) {

        case ".EXPORT.PRJ":
          this.push({ table: TABLE_PROJECTS, data: <ProjectRecord>this.project });
          break;

      }

    }

    callback();
  }

  push(chunk: DBWriterChunk, encoding?: BufferEncoding): boolean {
    return super.push(chunk, encoding);
  }
}


