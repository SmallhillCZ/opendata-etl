import parser from "fast-xml-parser";
import { AresSubject, AresAddress, AresBond } from "./schema/schema";

export class AresParser {

  async parse(data: string) {
    const json = parser.parse(data, {
      ignoreAttributes: true,
      ignoreNameSpace: true
    });

    const output = json.Ares_odpovedi.Odpoved.Vypis_VREO;
    console.log(output);

    const subject = this.parseSubject(output["Zakladni_udaje"]);

    const bonds = this.parseBonds(Array.isArray(output["Statutarni_organ"]) ? output["Statutarni_organ"] : [output["Statutarni_organ"]]);

    return { subject, bonds };
  }

  parseSubject(data: any): AresSubject {
    return {
      rejstrik: data["Rejstrik"],
      ico: data["ICO"],
      obchodni_firma: data["ObchodniFirma"],
      pravni_forma: data["PravniForma"],
      sidlo: data["Sidlo"] && this.parseAddress(data["Sidlo"]),
      bydliste: data["Bydliste"] && this.parseAddress(data["Bydliste"]),
      datum_zapisu: data["DatumZapisu"],
      datum_vymazu: data["DatumVymazu"],
    };
  }

  parseAddress(data: any): AresAddress {
    return {
      ruian_kod: data['ruianKod'],
      stat: data['stat'],
      psc: data['psc'],
      obec: data['obec'],
      ulice: data['ulice'],
      cislo_txt: data['cisloTxt'],
    };
  }

  parseBodies(data: any[]): AresBody[] {

    const bonds: AresBond[] = [];

    for (let bond of data) {

      const members = Array.isArray(bond["Clen"]) ? bond["Clen"] : [bond["Clen"]];

      for (let member of members) {

        bonds.push({
          organ_nazev: bond["Nazev"],
          funkce_nazev: member["funkce"],
          fosoba_id: member['fosoba'] && this.getPrivatePerson(member['fosoba']),
          posoba_id: member['posoba'] && this.getLegalPerson(member['posoba']),
        })
      }
    }

    return bonds;
  }