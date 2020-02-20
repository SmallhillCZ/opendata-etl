
import request from "request-promise-native";

import { default as $ } from "cheerio";

exports = async function(db) {

  console.log("getting the page");
  
  const xml = await request("http://monitor.statnipokladna.cz/data/polozka.xml");

  const dom = $(xml);

  dom.find("Radek").map((i, el) => {

    const object: any = {};
    
    $(el).children().each((i,value) => {
      object[value.name] = $(value).text();
    });
    
    return object;
  
  }).get();

}