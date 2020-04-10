export interface Config {
  host: string;
  database: string;
  user: string | undefined;
  password: string | undefined;
}

export interface Record_fosoba {
  id: number;
  jmeno: string;
  prijmeni: string;
  titul_pred: string;
  titul_za: string;
  adresa: any;
}