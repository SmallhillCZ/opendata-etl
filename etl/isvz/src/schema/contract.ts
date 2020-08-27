export const contractColumns = [
  "ID_Zakazky",
  "EvidencniCisloVZnaVVZ",
  "CisloFormulareNaVVZ",
  "DruhFormulare",
  "ID_Zadani",
  "CisloCastiZadaniVZ",
  "NazevCastiVZ",
  "ZadaniCastiZakazky",
  "InformaceONezadaniCastiZakazky",
  "DatumZadaniVZ",
  "PocetObdrzenychNabidek",
  "PuvodniOdhadovanaCelkovaHodnotaVZ",
  "PuvodniOdhadovanaCelkovaHodnotaVZMena",
  "CelkovaKonecnaHodnotaVZzaZadani",
  "CelkovaKonecnaHodnotaVZmenaZaZadani",
  "HodnotaNejnizsiNabidky",
  "HodnotaNejnizsiNabidkyMena",
  "HodnotaNejvyssiNabidky",
  "SubdodavkyHodnotaBezDPH",
  "SubdodavkyMena",
  "SubdodavkyPomer",
  "DatumOdeslaniFormulareNaVVZ",
  "PlatnyFormular"
];

export interface ContractCSVRecord {
  ID_Zakazky: string;
  EvidencniCisloVZnaVVZ: string;
  CisloFormulareNaVVZ: string;
  DruhFormulare: string;
  ID_Zadani: string;
  CisloCastiZadaniVZ: string;
  NazevCastiVZ: string;
  ZadaniCastiZakazky: string;
  InformaceONezadaniCastiZakazky: string;
  DatumZadaniVZ: string;
  PocetObdrzenychNabidek: string;
  PuvodniOdhadovanaCelkovaHodnotaVZ: string;
  PuvodniOdhadovanaCelkovaHodnotaVZMena: string;
  CelkovaKonecnaHodnotaVZzaZadani: string;
  CelkovaKonecnaHodnotaVZmenaZaZadani: string;
  HodnotaNejnizsiNabidky: string;
  HodnotaNejnizsiNabidkyMena: string;
  HodnotaNejvyssiNabidky: string;
  SubdodavkyHodnotaBezDPH: string;
  SubdodavkyMena: string;
  SubdodavkyPomer: string;
  DatumOdeslaniFormulareNaVVZ: string;
  PlatnyFormular: string;
}

export interface ContractRecord {
  rok: number;
  id_zadani: string;
  id_zakazky: string;
  evidencni_cislo_v_zna_vvz?: string;
  cislo_formulare_na_vvz?: string;
  druh_formulare?: string;
  cislo_casti_zadani_vz?: string;
  nazev_casti_vz?: string;
  zadani_casti_zakazky?: boolean;
  informace_o_nezadani_casti_zakazky?: string;
  datum_zadani_vz?: string;
  pocet_obdrzenych_nabidek?: number;
  puvodni_odhadovana_celkova_hodnota_vz?: number;
  puvodni_odhadovana_celkova_hodnota_vz_mena?: string;
  celkova_konecna_hodnota_v_zza_zadani?: number;
  celkova_konecna_hodnota_v_zmena_za_zadani?: string;
  hodnota_nejnizsi_nabidky?: number;
  hodnota_nejnizsi_nabidky_mena?: string;
  hodnota_nejvyssi_nabidky?: number;
  subdodavky_hodnota_bez_dph?: number;
  subdodavky_mena?: string;
  subdodavky_pomer?: number;
  datum_odeslani_formulare_na_vvz?: string;
  platny_formular?: boolean;
}