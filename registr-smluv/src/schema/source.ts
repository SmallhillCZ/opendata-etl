export interface DumpMetadata {
  dokonceny_mesic: boolean;
  odkaz: string;
  den: number;
  mesic: number;
  rok: number;
  hash_dumpu: string;
  velikost_dumpu: string;
  cas_generovani: string;
}

export interface ContractData {
  id_smlouvy: number;
  id_verze: number;
  odkaz: string;
  cas_zverejneni: string;
  predmet: string;
  datum_uzavreni: string;
  cislo_smlouvy?: string;
  schvalil?: string;
  hodnota_bez_dph?: number;
  hodnota_vcetne_dph?: number;
  cizi_mena?: string;
  cizi_mena_hodnota?: number;
  navazany_zaznam?: number;
  platny_zaznam: boolean;
}

export interface CounterpartyData {
  id_verze: number;
  subjekt: boolean;
  datova_schranka: string;
  nazev: string;
  ico: string;
  adresa: string;
  utvar: string;
  platce: boolean;
  prijemce: boolean;
}

export interface AttachmentData {
  id_verze: number;
  nazev_souboru: string;
  hash?: string;
  odkaz?: string;
}