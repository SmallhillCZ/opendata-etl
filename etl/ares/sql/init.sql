drop table if exists src_ares.vreo_subjekt;

create table src_ares.vreo_subjekt(
  zdroj varchar not null,
  rejstrik varchar,
  ico varchar not null,
  obchodni_firma varchar,
  datum_zapisu date not null,
  datum_vymazu date,
  sidlo json
);

drop table if exists src_ares.vreo_fosoba;

create table src_ares.vreo_fosoba(
  id serial not null,
  jmeno varchar,
  prijmeni varchar,
  titul_pred varchar,
  titul_za varchar,
  adresa json
);

create table src_ares.vreo_vazba(
  ico: varchar not null,
  organ_nazev: varchar not null,
  funkce_nazev: varchar,
  fosoba_id: int,
  posoba_id: int
)