export interface Config {
  host: string;
  database: string;
  user: string | undefined;
  password: string | undefined;
  schema: string;
}

export interface AresAddress {
  ruian_kod?: number;
  stat?: string;
  psc?: string;
  okres?: string;
  obec?: string;
  cast_obce?: string;
  mop?: string;
  ulice?: string;
  cislo_pop?: string;
  cislo_or?: string;
  cislo_ev?: string;
  cislo_txt?: string;
  text?: string;
  doplnujici_text?: string;
  dorucovaci_cislo?: string;
  skryty_udaj?: string;
}

export interface Record_fosoba {
  id: number;
  jmeno?: string;
  prijmeni?: string;
  datum_narozeni?: Date;
  rodne_cislo?: string;
  obcanstvi?: string;
  titul_pred?: string;
  titul_za?: string;
  bydliste?: Address;

}

export interface Record_posoba {
  ico?: string;
  obchodni_firma?: string;
  pravni_forma?: string;
  zastoupeni?: Record_fosoba["id"];
}

export interface AresBody {
  nazev: string;
}

export interface AresBond {
  subjekt_ico: string;
  organ_nazev: string;
  funkce_nazev: string;
  fosoba_id?: number;
  posoba_id?: string;
}

export interface AresSubject {
  rejstrik: string;
  ico: string;
  obchodni_firma: string;
  pravni_forma: string;
  sidlo?: Address;
  bydliste?: Address;
  datum_zapisu: string;
  datum_vymazu: string;
}