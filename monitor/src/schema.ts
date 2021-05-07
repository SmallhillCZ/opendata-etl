export interface MonitorDataset {
  id: number;
  uri: string;
  deleted: boolean;
  code: string;
  titleCS: string;
  titleEN: string;
  descriptionCS: string;
  descriptionEN: string;
  structureFile: string;
  xsd: string;
  xml: string;
  contactPoint: string;
  bureauCode: string;
  periodicity: string;
  active: boolean;
  order: number;

  dataExtracts: MonitorResource[];
}

export interface MonitorResource {
  id: number;
  uri: string;
  deleted: boolean;
  loadID: number;
  year: number;
  month: number;
  titleCS: string;
  titleEN: string;
  filename: string;
  filenamePeriod: string;
  format: string;
  modified: string;
  active: boolean;
  statement: any;
}

export interface EtlRecord {
  name: string;
  etag: string;
  modified: string;
  timestamp: string;
}