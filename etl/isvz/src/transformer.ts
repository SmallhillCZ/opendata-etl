import { Transform } from "stream";
import { ContractCSVRecord, ContractRecord } from "./schema/contract";

function parseNumber(input: string): number | undefined {
  return Number(input.replace(",", ".")) || undefined;
}

const re_date = /(\d{1,2})\.(\d{1,2})\.(\d{4}) (\d{1,2})\:(\d{2})\:(\d{2})/;
function parseDate(input: string): string | undefined {
  const m = re_date.exec(input);
  if (!m) return undefined;
  return `${m[3]}-${m[2].padStart(2, '0')}-${m[1].padStart(2, '0')}T${m[4].padStart(2, '0')}:${m[5]}:${m[6]}`;
}

function parseBoolean(input: string): boolean | undefined {
  switch (input) {
    case "Ano": 
    case "True": return true;
    
    case "Ne": 
    case "False": return false;
    
    default: return undefined;
  }
}

export class ISVZTransformer extends Transform {

  constructor() {
    super({ objectMode: true });
  }

  _transform(chunk: ContractCSVRecord, encoding: string, callback: (err?: Error | null, chunk?: Omit<ContractRecord, "rok">) => void) {
    callback(null, {
      "id_zakazky": chunk["ID_Zakazky"],
      "evidencni_cislo_v_zna_vvz": chunk["EvidencniCisloVZnaVVZ"],
      "cislo_formulare_na_vvz": chunk["CisloFormulareNaVVZ"],
      "druh_formulare": chunk["DruhFormulare"],
      "id_zadani": chunk["ID_Zadani"],
      "cislo_casti_zadani_vz": chunk["CisloCastiZadaniVZ"],
      "nazev_casti_vz": chunk["NazevCastiVZ"],
      "zadani_casti_zakazky": parseBoolean(chunk["ZadaniCastiZakazky"]),
      "informace_o_nezadani_casti_zakazky": chunk["InformaceONezadaniCastiZakazky"],
      "datum_zadani_vz": parseDate(chunk["DatumZadaniVZ"]),
      "pocet_obdrzenych_nabidek": parseNumber(chunk["PocetObdrzenychNabidek"]),
      "puvodni_odhadovana_celkova_hodnota_vz": parseNumber(chunk["PuvodniOdhadovanaCelkovaHodnotaVZ"]),
      "puvodni_odhadovana_celkova_hodnota_vz_mena": chunk["PuvodniOdhadovanaCelkovaHodnotaVZMena"],
      "celkova_konecna_hodnota_v_zza_zadani": parseNumber(chunk["CelkovaKonecnaHodnotaVZzaZadani"]),
      "celkova_konecna_hodnota_v_zmena_za_zadani": chunk["CelkovaKonecnaHodnotaVZmenaZaZadani"],
      "hodnota_nejnizsi_nabidky": parseNumber(chunk["HodnotaNejnizsiNabidky"]),
      "hodnota_nejnizsi_nabidky_mena": chunk["HodnotaNejnizsiNabidkyMena"],
      "hodnota_nejvyssi_nabidky": parseNumber(chunk["HodnotaNejvyssiNabidky"]),
      "subdodavky_hodnota_bez_dph": parseNumber(chunk["SubdodavkyHodnotaBezDPH"]),
      "subdodavky_mena": chunk["SubdodavkyMena"],
      "subdodavky_pomer": parseNumber(chunk["SubdodavkyPomer"]),
      "datum_odeslani_formulare_na_vvz": parseDate(chunk["DatumOdeslaniFormulareNaVVZ"]),
      "platny_formular": parseBoolean(chunk["PlatnyFormular"])
    })
  }
}