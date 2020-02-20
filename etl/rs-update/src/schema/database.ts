import { DumpMetadata, ContractData, CounterpartyData, AttachmentData } from "./source";

export interface DumpRecord extends DumpMetadata {
  id_dumpu: string;
}

export interface ContractRecord extends ContractData {
  id_dumpu: string;
}

export interface CounterpartyRecord extends CounterpartyData {
  id_dumpu: string;
}

export interface AttachmentRecord extends AttachmentData {
  id_dumpu: string;
}