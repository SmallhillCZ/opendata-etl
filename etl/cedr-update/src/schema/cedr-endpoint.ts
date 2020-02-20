interface UriValue {
  type: string;
  value: string;
}

interface StringValue {
  type: string;
  value: string;
  lang: string;
}

interface AnyValue {
  type: string;
  value: string;
  dataType?: string;
}

export interface CedrEndpoint {

  [rootNode:string]: {
    "http://www.w3.org/1999/02/22-rdf-syntax-ns#type": UriValue[],
    "http://rdfs.org/ns/void#exampleResource": UriValue[],
    "http://purl.org/dc/terms/description": StringValue[],
    "http://purl.org/dc/terms/publisher": AnyValue[],
    "http://purl.org/dc/terms/title": StringValue[],
    "http://rdfs.org/ns/void#dataDump": UriValue[],
    "http://xmlns.com/foaf/0.1/homepage": AnyValue[],
    "http://rdfs.org/ns/void#sparqlEndpoint": AnyValue[],
    "http://rdfs.org/ns/void#uriLookupEndpoint": AnyValue[],
    "http://rdfs.org/ns/void#vocabulary": AnyValue[],
    "http://purl.org/dc/terms/created": AnyValue[],
    "http://purl.org/dc/terms/license": AnyValue[],
    "http://rdfs.org/ns/void#triples": AnyValue[],
    "http://purl.org/dc/terms/modified": AnyValue[],
    "http://purl.org/dc/terms/valid": AnyValue[]
  }
}