import { Writable } from "stream";
import Knex = require("knex");
import { DumpChunk } from "./dump-transform";
import { ContractRecord, CounterpartyRecord, AttachmentRecord } from "../schema/database";

export interface DBRecords {
  "smlouva": ContractRecord[];
  "smluvni_strana": CounterpartyRecord[];
  "priloha": AttachmentRecord[];
}

export class DatabaseWriter extends Writable {

  public c = 0;

  constructor(private db: Knex, private schema: string, private dumpId: string, private options: { dry: boolean, hideProgress: boolean }) {

    super({
      objectMode: true,
      highWaterMark: 1000 // bulk insert up to 1000 rows at once
    });

  }

  // write one row
  _write(chunk: any, encoding: string, callback: () => void) {
    return this._writev([{ chunk, encoding }], callback);
  }

  // bulk insert rows
  async _writev(chunks: { chunk: any, encoding: string }[], callback: (err?: Error) => void) {

    if (!this.options.hideProgress) {
      if (!this.options.dry) process.stdout.write(`Writing records #${this.c + 1} - #${this.c + 1 + chunks.length}\r`);
      else process.stdout.write(`(DRY RUN) Writing records #${this.c + 1} - #${this.c + 1 + chunks.length}\r`);
    }

    // extract just chunk from chunk array
    const records = chunks
      .reduce((acc, chunk: { chunk: DumpChunk, encoding: string }) => {

        const chunkData: any = chunk.chunk.data;
        chunkData.id_dumpu = this.dumpId;

        if (chunk.chunk.type === "smlouva") acc["smlouva"].push(<ContractRecord>chunkData);
        if (chunk.chunk.type === "smluvni_strana") acc["smluvni_strana"].push(<CounterpartyRecord>chunkData);
        if (chunk.chunk.type === "priloha") acc["priloha"].push(<AttachmentRecord>chunkData);

        return acc;
      }, { "smlouva": [], "smluvni_strana": [], "priloha": [] } as DBRecords);

    try {
      if (!this.options.dry) await this.writeData(records)
      this.c += chunks.length;
      callback();
    }
    catch (err) {
      callback(err);
    }

  }

  async writeData(records: DBRecords) {
    await this.db(`${this.schema}.smlouva`).insert(records["smlouva"]);
    await this.db(`${this.schema}.smluvni_strana`).insert(records["smluvni_strana"]);
    await this.db(`${this.schema}.priloha`).insert(records["priloha"]);
  }

  _final(callback: (err?: Error) => void) {
    if (!this.options.dry) console.log(`Written ${this.c} records.                                         `); // spaces to erase previous longer message
    else console.log(`(DRY RUN) Written ${this.c} records.                                         `); // spaces to erase previous longer message
    // emit the finish event
    callback();
  }

}