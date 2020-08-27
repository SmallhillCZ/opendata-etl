import { Writable } from "stream";
import Knex from "knex";

import { ContractRecord } from "./schema/contract";
import { ETLRecord } from "./schema/etl";

const DB_SCHEMA = process.env["DB_SCHEMA"] || "src_isvz";

export class DBWriter extends Writable {

  c = 0;

  constructor(private db: Knex, private year: number, private url: string, private size: number) {
    super({
      objectMode: true
    });
  }

  async clear() {
    return this.db<ContractRecord>(`${DB_SCHEMA}.vestnik_vz`).where({ "rok": this.year }).delete();
  }

  _write(chunk: Omit<ContractRecord, "rok">, encoding: string, callback: (err?: Error | null) => void) {
    return this._writev([{ chunk, encoding }], callback);
  }

  async _writev(chunks: { chunk: Omit<ContractRecord, "rok">, encoding: string }[], callback: (err?: Error | null) => void) {

    let records: ContractRecord[] = chunks.map(chunk => ({ "rok": this.year, ...chunk.chunk }));

    await this.db<ContractRecord>(`${DB_SCHEMA}.vestnik_vz`).insert(records);

    this.c += records.length;

    callback(null);
  }

  async _final(callback: (error?: Error | null) => void): Promise<void> {
    try {
      await this.db<ETLRecord>(`${DB_SCHEMA}.etl`).where({ year: this.year }).delete();
      await this.db<ETLRecord>(`${DB_SCHEMA}.etl`).insert({ year: this.year, url: this.url, size: this.size });

      callback();
    }
    catch (err) {
      callback(err);
    }
  }

  static async loadEtls(db: Knex): Promise<ETLRecord[]> {
    return db<ETLRecord>(`${DB_SCHEMA}.etl`);
  }
}
