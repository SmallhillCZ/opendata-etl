import { Knex } from "knex";
import { Writable, WritableOptions } from "stream";

export interface DBWriterChunk {
  table: string,
  data: any;
}

export class DBWriter extends Writable {

  c = 0;

  constructor(private db: Knex, opts?: WritableOptions) {
    super({ ...opts, objectMode: true, highWaterMark: 3000, });
  }

  async _writev?(chunks: Array<{ chunk: DBWriterChunk, encoding: BufferEncoding; }>, callback: (error?: Error | null) => void) {

    try {
      // group data by table
      const tablesData = chunks.reduce((acc, cur) => {
        if (!acc[cur.chunk.table]) acc[cur.chunk.table] = [];
        acc[cur.chunk.table].push(cur.chunk.data);
        return acc;
      }, {} as { [table: string]: any[]; });


      // write each table in batch
      for (let table of Object.keys(tablesData)) {
        await this.db.batchInsert(table, tablesData[table]);
      }

      this.c += chunks.length;

      callback();
    }
    catch (err) {
      callback(err);
    }
  }

  _final(callback: (error?: Error | null) => void) {
    console.log(`Written ${this.c} records.`);
    callback();
  }
}