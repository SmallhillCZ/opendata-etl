export const contractColumns = [
  "ID_Zakazky",
  "EvidencniCisloVZnaVVZ",
  "CisloFormulareNaVVZ",
  "DruhFormulare",
  "ID_CastiVZ",
  "CisloCastiVZ",
  "NazevCastiVZ",
  "PopisCastiVZ",
  "PredpokladanaCelkovaHodnotaCastiVZ",
  "PredpokladanaCelkovaHodnotaCastiVZMena",
  "HlavniMistoPlneniNUTS",
  "HlavniMistoPlneni",
  "CPVkod",
  "ZakazkaSeVztahujeKprojektuFinZes",
  "ProjektyCiProgramyFinZes",
  "DatumOdeslaniFormulareNaVVZ",
  "PlatnyFormular",
];

export interface ContractCSVRecord {
  ID_Zakazky: string;
  EvidencniCisloVZnaVVZ: string;
  CisloFormulareNaVVZ: string;
  DruhFormulare: string;
  ID_CastiVZ: string;
  CisloCastiVZ: string;
  NazevCastiVZ: string;
  PopisCastiVZ: string;
  PredpokladanaCelkovaHodnotaCastiVZ: string;
  PredpokladanaCelkovaHodnotaCastiVZMena: string;
  HlavniMistoPlneniNUTS: string;
  HlavniMistoPlneni: string;
  CPVkod: string;
  ZakazkaSeVztahujeKprojektuFinZes: string;
  ProjektyCiProgramyFinZes: string;
  DatumOdeslaniFormulareNaVVZ: string;
  PlatnyFormular: string;
}

export interface ContractRecord {
  id_zakazky: string;
  evidencni_cislo_v_zna_vvz: string;
  cislo_formulare_na_vvz: string;
  druh_formulare: string;
  id_casti_vz: string;
  cislo_casti_vz: string;
  nazev_casti_vz: string;
  popis_casti_vz: string;
  predpokladana_celkova_hodnota_casti_vz: number;
  predpokladana_celkova_hodnota_casti_vz_mena: string;
  hlavni_misto_plneni_nuts: string;
  hlavni_misto_plneni: string;
  cp_vkod: string;
  zakazka_se_vztahuje_kprojektu_fin_zes: string;
  projekty_ci_programy_fin_zes: string;
  datum_odeslani_formulare_na_vvz: string;
  platny_formular: boolean | null;
}