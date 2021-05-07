import { Transform, TransformOptions } from "stream";
import { ContractData, CounterpartyData, AttachmentData } from "../schema/source";
import { SaxesStreamChunk } from "saxes-stream";


export type DumpChunk =
  { type: "smlouva", data: ContractData; } |
  { type: "smluvni_strana", data: CounterpartyData; } |
  { type: "priloha", data: AttachmentData; };


export class DumpTransform extends Transform {

  contract: Partial<ContractData>;

  counterparties: CounterpartyData[];
  counterparty: Partial<CounterpartyData>;
  attachments: AttachmentData[];
  attachment: Partial<AttachmentData>;

  constructor(streamOptions: TransformOptions = {}) {

    const defaultStreamOptions = {
      objectMode: true
    };

    streamOptions = Object.assign(defaultStreamOptions, streamOptions);

    super(streamOptions);

    this.contract = {};
    this.counterparty = {};
    this.counterparties = [];
    this.attachment = {};
    this.attachments = [];
  }

  _transform(chunk: SaxesStreamChunk, encoding: string, callback: (err?: Error) => void) {

    let chunkPath = chunk.path;
    // only used for daily dumps - uncomment when daily dumps implemented later
    // chunkPath = chunkPath.replace(/^\.daily/, ".dump");

    if (chunk.event === "text") {
      switch (chunkPath) {
        case ".dump.zaznam.identifikator.idSmlouvy": this.contract["id_smlouvy"] = Number(chunk.text); break;// number
        case ".dump.zaznam.identifikator.idVerze": this.contract["id_verze"] = Number(chunk.text); break;// number

        case ".dump.zaznam.odkaz": this.contract["odkaz"] = chunk.text; break; //string
        case ".dump.zaznam.casZverejneni": this.contract["cas_zverejneni"] = chunk.text; break; //string

        case ".dump.zaznam.smlouva.predmet": this.contract["predmet"] = chunk.text; break;// string
        case ".dump.zaznam.smlouva.datumUzavreni": this.contract["datum_uzavreni"] = chunk.text; break;// string
        case ".dump.zaznam.smlouva.cisloSmlouvy": this.contract["cislo_smlouvy"] = chunk.text; break; //string
        case ".dump.zaznam.smlouva.schvalil": this.contract["schvalil"] = chunk.text; break; //string
        case ".dump.zaznam.smlouva.hodnotaBezDph": this.contract["hodnota_bez_dph"] = Number(chunk.text); break; //number
        case ".dump.zaznam.smlouva.hodnotaVcetneDph": this.contract["hodnota_vcetne_dph"] = Number(chunk.text); break; //number

        case ".dump.zaznam.smlouva.ciziMena.mena": this.contract["cizi_mena"] = chunk.text; break; //string
        case ".dump.zaznam.smlouva.ciziMena.hodnota": this.contract["cizi_mena_hodnota"] = Number(chunk.text); break; //number

        case ".dump.zaznam.smlouva.hodnotaBezDph": this.contract["hodnota_bez_dph"] = Number(chunk.text); break;// number
        case ".dump.zaznam.smlouva.navazanyZaznam": this.contract["navazany_zaznam"] = Number(chunk.text); break;// number

        case ".dump.zaznam.smlouva.subjekt.datovaSchranka": this.counterparty["datova_schranka"] = chunk.text; break; //string
        case ".dump.zaznam.smlouva.subjekt.nazev": this.counterparty["nazev"] = chunk.text; break; //string
        case ".dump.zaznam.smlouva.subjekt.ico": this.counterparty["ico"] = chunk.text; break; //string
        case ".dump.zaznam.smlouva.subjekt.adresa": this.counterparty["adresa"] = chunk.text; break; //string
        case ".dump.zaznam.smlouva.subjekt.utvar": this.counterparty["utvar"] = chunk.text; break; //string
        case ".dump.zaznam.smlouva.subjekt.platce": this.counterparty["platce"] = chunk.text === "1"; break; //boolean

        case ".dump.zaznam.smlouva.smluvniStrana.datovaSchranka": this.counterparty["datova_schranka"] = chunk.text; break; //string
        case ".dump.zaznam.smlouva.smluvniStrana.nazev": this.counterparty["nazev"] = chunk.text; break; //string
        case ".dump.zaznam.smlouva.smluvniStrana.ico": this.counterparty["ico"] = chunk.text; break; //string
        case ".dump.zaznam.smlouva.smluvniStrana.adresa": this.counterparty["adresa"] = chunk.text; break; //string
        case ".dump.zaznam.smlouva.smluvniStrana.utvar": this.counterparty["utvar"] = chunk.text; break; //string
        case ".dump.zaznam.smlouva.smluvniStrana.prijemce": this.counterparty["platce"] = chunk.text === "1"; break; //boolean

        case ".dump.zaznam.prilohy.priloha.nazevSouboru": this.attachment["nazev_souboru"] = chunk.text; break; //string
        case ".dump.zaznam.prilohy.priloha.hash": this.attachment["hash"] = chunk.text; break; //string
        case ".dump.zaznam.prilohy.priloha.odkaz": this.attachment["odkaz"] = chunk.text; break; //string

        case ".dump.zaznam.platnyZaznam": this.contract["platny_zaznam"] = chunk.text === "1"; break; //string
      };
    }

    if (chunk.event === "closetag") {

      switch (chunkPath) {

        case ".dump.zaznam":

          const contract = <ContractData>this.contract;

          this.push({ type: "smlouva", data: contract });

          this.counterparties.forEach(counterparty => {
            counterparty["id_verze"] = contract["id_verze"];
            this.push({ type: "smluvni_strana", data: counterparty });
          });

          this.attachments.forEach(attachment => {
            attachment["id_verze"] = contract["id_verze"];
            this.push({ type: "priloha", data: attachment });
          });

          this.counterparties = [];
          this.attachments = [];
          this.contract = {};
          break;

        case ".dump.zaznam.smlouva.subjekt":
          this.counterparty["subjekt"] = true;
          this.counterparties.push(<CounterpartyData>this.counterparty);
          this.counterparty = {};
          break;

        case ".dump.zaznam.smlouva.smluvniStrana":
          this.counterparty["subjekt"] = false;
          this.counterparties.push(<CounterpartyData>this.counterparty);
          this.counterparty = {};
          break;

        case ".dump.zaznam.prilohy.priloha":
          this.attachments.push(<AttachmentData>this.attachment);
          this.attachment = {};
          break;

      }

    }

    callback();
  }

  push(chunk: DumpChunk, encoding?: string): boolean {
    return super.push(chunk, encoding);
  }
}