import { Writable } from "stream";
import Knex from "knex";

interface WriteOptions {
  year?: { year: number, month: number };
  dry: boolean;
  hideProgress: boolean;
}

// Writable stream to save rows to database
export class DatabaseWriter extends Writable {

  c = 0;

  constructor(private table: string, private db: Knex, private options: WriteOptions) {

    super({
      objectMode: true,
      highWaterMark: 1000 // bulk insert 1000 rows at once
    });

  }

  public async clear() {
    if (!this.options.dry) {
      if (this.options.year) return this.db(this.table).where(this.options.year).delete();
      else return this.db(this.table).delete();
    }
    else console.log("DRY RUN, not executed.");
  }

  // write one row
  _write(chunk: any, encoding: string, callback: () => void) {
    return this._writev([{ chunk, encoding }], callback);
  }

  // bulk insert rows
  async _writev(chunks: { chunk: any, encoding: string }[], callback: () => void) {

    // extract just chunk from chunk array
    const rows = chunks.map(chunk => chunk.chunk);

    await this.writeRows(rows);

    // allow receiving of another data
    callback();
  }

  async writeRows(rows: any[]) {

    if (!this.options.hideProgress) {
      if (!this.options.dry) process.stdout.write(`Writing records #${this.c + 1} - #${this.c + rows.length}\r`);
      else process.stdout.write(`DRY RUN Writing records #${this.c + 1} - #${this.c + rows.length}\r`);
    }

    // add year and month data to each row
    if (this.options.year) rows.forEach(row => {
      row.year = this.options.year!.year;
      row.month = this.options.year!.month;
    })



    // convert SAP style negative numbers to Postgre understandable numbers
    rows.forEach(row => {
      for (let key of Object.keys(row)) {
        if (typeof row[key] === "string") {
          const match = row[key].match(/([\d\.])\-$/); // detect number and trailing minus sign
          if (match) row[key] = "-" + match[1];
        }
      }
    });

    if (!this.options.dry) await this.db(this.table).insert(rows);

    this.c += rows.length;
  }

  _final(callback) {
    if (!this.options.dry) console.log(`Written ${this.c} records.                                         `); // spaces to erase previous longer message
    else console.log(`DRY RUN Written ${this.c} records.                                         `); // spaces to erase previous longer message
    // emit hte finish event
    callback();
  }

}