-- Table c_aktorg
DROP VIEW IF EXISTS d_monitor.c_aktorg;
drop table if exists src_monitor.c_aktorg;
create table src_monitor.c_aktorg (aktorg_id VARCHAR, aktorg_nazev VARCHAR);
CREATE VIEW d_monitor.c_aktorg AS SELECT * FROM src_monitor.c_aktorg;
GRANT ALL ON TABLE src_monitor.c_aktorg TO etl;
GRANT SELECT ON TABLE d_monitor.c_aktorg TO PUBLIC;


-- Table c_vykaz
DROP VIEW IF EXISTS d_monitor.c_vykaz;
drop table if exists src_monitor.c_vykaz;
create table src_monitor.c_vykaz (vykaz_id VARCHAR, vykaz_tabulka VARCHAR, vykaz_nazev VARCHAR);
CREATE VIEW d_monitor.c_vykaz AS SELECT * FROM src_monitor.c_vykaz;
GRANT ALL ON TABLE src_monitor.c_vykaz TO etl;
GRANT SELECT ON TABLE d_monitor.c_vykaz TO PUBLIC;


-- Table c_druhrizeni
DROP VIEW IF EXISTS d_monitor.c_druhrizeni;
drop table if exists src_monitor.c_druhrizeni;
create table src_monitor.c_druhrizeni (druhrizeni_id VARCHAR, druhrizeni_nazev VARCHAR);
CREATE VIEW d_monitor.c_druhrizeni AS SELECT * FROM src_monitor.c_druhrizeni;
GRANT ALL ON TABLE src_monitor.c_druhrizeni TO etl;
GRANT SELECT ON TABLE d_monitor.c_druhrizeni TO PUBLIC;


-- Table c_druhukazatele
DROP VIEW IF EXISTS d_monitor.c_druhukazatele;
drop table if exists src_monitor.c_druhukazatele;
create table src_monitor.c_druhukazatele (druhukazatele_id VARCHAR, druhukazatele_nazev VARCHAR);
CREATE VIEW d_monitor.c_druhukazatele AS SELECT * FROM src_monitor.c_druhukazatele;
GRANT ALL ON TABLE src_monitor.c_druhukazatele TO etl;
GRANT SELECT ON TABLE d_monitor.c_druhukazatele TO PUBLIC;


-- Table c_druhuj
DROP VIEW IF EXISTS d_monitor.c_druhuj;
drop table if exists src_monitor.c_druhuj;
create table src_monitor.c_druhuj (druhuj_id VARCHAR, druhuj_nazev VARCHAR);
CREATE VIEW d_monitor.c_druhuj AS SELECT * FROM src_monitor.c_druhuj;
GRANT ALL ON TABLE src_monitor.c_druhuj TO etl;
GRANT SELECT ON TABLE d_monitor.c_druhuj TO PUBLIC;


-- Table c_eds
DROP VIEW IF EXISTS d_monitor.c_eds;
drop table if exists src_monitor.c_eds;
create table src_monitor.c_eds (eds_id VARCHAR, eds_nazev VARCHAR);
CREATE VIEW d_monitor.c_eds AS SELECT * FROM src_monitor.c_eds;
GRANT ALL ON TABLE src_monitor.c_eds TO etl;
GRANT SELECT ON TABLE d_monitor.c_eds TO PUBLIC;


-- Table c_finmisto
DROP VIEW IF EXISTS d_monitor.c_finmisto;
drop table if exists src_monitor.c_finmisto;
create table src_monitor.c_finmisto (finmisto_id VARCHAR, end_date date, start_date date, ico VARCHAR, typ_mista VARCHAR, typ_organizace VARCHAR, finmisto_nazev VARCHAR, kapitola_id VARCHAR);
CREATE VIEW d_monitor.c_finmisto AS SELECT * FROM src_monitor.c_finmisto;
GRANT ALL ON TABLE src_monitor.c_finmisto TO etl;
GRANT SELECT ON TABLE d_monitor.c_finmisto TO PUBLIC;


-- Table c_forma
DROP VIEW IF EXISTS d_monitor.c_forma;
drop table if exists src_monitor.c_forma;
create table src_monitor.c_forma (forma_id VARCHAR, forma_nazev VARCHAR);
CREATE VIEW d_monitor.c_forma AS SELECT * FROM src_monitor.c_forma;
GRANT ALL ON TABLE src_monitor.c_forma TO etl;
GRANT SELECT ON TABLE d_monitor.c_forma TO PUBLIC;


-- Table c_kapitola
DROP VIEW IF EXISTS d_monitor.c_kapitola;
drop table if exists src_monitor.c_kapitola;
create table src_monitor.c_kapitola (kapitola_id VARCHAR, kapitola_nazev VARCHAR, id_nazev VARCHAR);
CREATE VIEW d_monitor.c_kapitola AS SELECT * FROM src_monitor.c_kapitola;
GRANT ALL ON TABLE src_monitor.c_kapitola TO etl;
GRANT SELECT ON TABLE d_monitor.c_kapitola TO PUBLIC;


-- Table c_katobyv
DROP VIEW IF EXISTS d_monitor.c_katobyv;
drop table if exists src_monitor.c_katobyv;
create table src_monitor.c_katobyv (katobyv_id VARCHAR, katobyv_nazev VARCHAR);
CREATE VIEW d_monitor.c_katobyv AS SELECT * FROM src_monitor.c_katobyv;
GRANT ALL ON TABLE src_monitor.c_katobyv TO etl;
GRANT SELECT ON TABLE d_monitor.c_katobyv TO PUBLIC;


-- Table c_cofog
DROP VIEW IF EXISTS d_monitor.c_cofog;
drop table if exists src_monitor.c_cofog;
create table src_monitor.c_cofog (cofog_id VARCHAR, cofog_nazev VARCHAR);
CREATE VIEW d_monitor.c_cofog AS SELECT * FROM src_monitor.c_cofog;
GRANT ALL ON TABLE src_monitor.c_cofog TO etl;
GRANT SELECT ON TABLE d_monitor.c_cofog TO PUBLIC;


-- Table c_nuts
DROP VIEW IF EXISTS d_monitor.c_nuts;
drop table if exists src_monitor.c_nuts;
create table src_monitor.c_nuts (nuts_id VARCHAR, okres VARCHAR, kraj VARCHAR, oblast VARCHAR, nuts_nazev VARCHAR, start_date date, end_date date);
CREATE VIEW d_monitor.c_nuts AS SELECT * FROM src_monitor.c_nuts;
GRANT ALL ON TABLE src_monitor.c_nuts TO etl;
GRANT SELECT ON TABLE d_monitor.c_nuts TO PUBLIC;


-- Table c_isektor
DROP VIEW IF EXISTS d_monitor.c_isektor;
drop table if exists src_monitor.c_isektor;
create table src_monitor.c_isektor (isektor_id VARCHAR, isektor_nazev VARCHAR);
CREATE VIEW d_monitor.c_isektor AS SELECT * FROM src_monitor.c_isektor;
GRANT ALL ON TABLE src_monitor.c_isektor TO etl;
GRANT SELECT ON TABLE d_monitor.c_isektor TO PUBLIC;


-- Table c_nastroj
DROP VIEW IF EXISTS d_monitor.c_nastroj;
drop table if exists src_monitor.c_nastroj;
create table src_monitor.c_nastroj (nastroj_id VARCHAR, nastroj_nazev VARCHAR, start_date date, end_date date);
CREATE VIEW d_monitor.c_nastroj AS SELECT * FROM src_monitor.c_nastroj;
GRANT ALL ON TABLE src_monitor.c_nastroj TO etl;
GRANT SELECT ON TABLE d_monitor.c_nastroj TO PUBLIC;


-- Table c_nastrojanal
DROP VIEW IF EXISTS d_monitor.c_nastrojanal;
drop table if exists src_monitor.c_nastrojanal;
create table src_monitor.c_nastrojanal (nastrojanal_id VARCHAR, nastrojanal_nazev VARCHAR);
CREATE VIEW d_monitor.c_nastrojanal AS SELECT * FROM src_monitor.c_nastrojanal;
GRANT ALL ON TABLE src_monitor.c_nastrojanal TO etl;
GRANT SELECT ON TABLE d_monitor.c_nastrojanal TO PUBLIC;


-- Table c_pou
DROP VIEW IF EXISTS d_monitor.c_pou;
drop table if exists src_monitor.c_pou;
create table src_monitor.c_pou (pou_id VARCHAR, pou_nazev VARCHAR);
CREATE VIEW d_monitor.c_pou AS SELECT * FROM src_monitor.c_pou;
GRANT ALL ON TABLE src_monitor.c_pou TO etl;
GRANT SELECT ON TABLE d_monitor.c_pou TO PUBLIC;


-- Table c_orp
DROP VIEW IF EXISTS d_monitor.c_orp;
drop table if exists src_monitor.c_orp;
create table src_monitor.c_orp (orp_id VARCHAR, orp_nazev VARCHAR);
CREATE VIEW d_monitor.c_orp AS SELECT * FROM src_monitor.c_orp;
GRANT ALL ON TABLE src_monitor.c_orp TO etl;
GRANT SELECT ON TABLE d_monitor.c_orp TO PUBLIC;


-- Table c_paragraf
DROP VIEW IF EXISTS d_monitor.c_paragraf;
drop table if exists src_monitor.c_paragraf;
create table src_monitor.c_paragraf (paragraf VARCHAR, skupina VARCHAR, oddil VARCHAR, pododdil VARCHAR, nazev VARCHAR, kr_nazev VARCHAR, str_nazev VARCHAR, start_date date, end_date date);
CREATE VIEW d_monitor.c_paragraf AS SELECT * FROM src_monitor.c_paragraf;
GRANT ALL ON TABLE src_monitor.c_paragraf TO etl;
GRANT SELECT ON TABLE d_monitor.c_paragraf TO PUBLIC;

-- Table c_paragraf (pridan manualne)
DROP VIEW IF EXISTS d_monitor.c_paragraf_long;
drop table if exists src_monitor.c_paragraf_long;
create table src_monitor.c_paragraf_long (paragraf_long VARCHAR, paragraf VARCHAR, skupina VARCHAR, oddil VARCHAR, pododdil VARCHAR, nazev VARCHAR, kr_nazev VARCHAR, str_nazev VARCHAR, start_date date, end_date date);
CREATE VIEW d_monitor.c_paragraf_long AS SELECT * FROM src_monitor.c_paragraf_long;
GRANT ALL ON TABLE src_monitor.c_paragraf_long TO etl;
GRANT SELECT ON TABLE d_monitor.c_paragraf_long TO PUBLIC;


-- Table c_pocob
DROP VIEW IF EXISTS d_monitor.c_pocob;
drop table if exists src_monitor.c_pocob;
create table src_monitor.c_pocob (ico VARCHAR, load_id VARCHAR, pocob INTEGER, katobyv_id VARCHAR);
CREATE VIEW d_monitor.c_pocob AS SELECT * FROM src_monitor.c_pocob;
GRANT ALL ON TABLE src_monitor.c_pocob TO etl;
GRANT SELECT ON TABLE d_monitor.c_pocob TO PUBLIC;


-- Table c_poddruhuj
DROP VIEW IF EXISTS d_monitor.c_poddruhuj;
drop table if exists src_monitor.c_poddruhuj;
create table src_monitor.c_poddruhuj (druhuj_id VARCHAR, poddruhuj_id VARCHAR, poddruhuj_nazev VARCHAR);
CREATE VIEW d_monitor.c_poddruhuj AS SELECT * FROM src_monitor.c_poddruhuj;
GRANT ALL ON TABLE src_monitor.c_poddruhuj TO etl;
GRANT SELECT ON TABLE d_monitor.c_poddruhuj TO PUBLIC;


-- Table c_podklad
DROP VIEW IF EXISTS d_monitor.c_podklad;
drop table if exists src_monitor.c_podklad;
create table src_monitor.c_podklad (podklad_id VARCHAR, podklad_nazev VARCHAR);
CREATE VIEW d_monitor.c_podklad AS SELECT * FROM src_monitor.c_podklad;
GRANT ALL ON TABLE src_monitor.c_podklad TO etl;
GRANT SELECT ON TABLE d_monitor.c_podklad TO PUBLIC;


-- Table c_polvyk
DROP VIEW IF EXISTS d_monitor.c_polvyk;
drop table if exists src_monitor.c_polvyk;
create table src_monitor.c_polvyk (vykaz VARCHAR, vtab VARCHAR, polvyk VARCHAR, polvyk_nazev VARCHAR, polvyk_order INTEGER, synuc VARCHAR, start_date date, end_date date);
CREATE VIEW d_monitor.c_polvyk AS SELECT * FROM src_monitor.c_polvyk;
GRANT ALL ON TABLE src_monitor.c_polvyk TO etl;
GRANT SELECT ON TABLE d_monitor.c_polvyk TO PUBLIC;


-- Table c_pomv
DROP VIEW IF EXISTS d_monitor.c_pomv;
drop table if exists src_monitor.c_pomv;
create table src_monitor.c_pomv (pomv_id VARCHAR, pomv_nazev VARCHAR);
CREATE VIEW d_monitor.c_pomv AS SELECT * FROM src_monitor.c_pomv;
GRANT ALL ON TABLE src_monitor.c_pomv TO etl;
GRANT SELECT ON TABLE d_monitor.c_pomv TO PUBLIC;


-- Table c_prostjedn
DROP VIEW IF EXISTS d_monitor.c_prostjedn;
drop table if exists src_monitor.c_prostjedn;
create table src_monitor.c_prostjedn (prostjedn_id VARCHAR, prostjedn_nazev VARCHAR, start_date date, end_date date);
CREATE VIEW d_monitor.c_prostjedn AS SELECT * FROM src_monitor.c_prostjedn;
GRANT ALL ON TABLE src_monitor.c_prostjedn TO etl;
GRANT SELECT ON TABLE d_monitor.c_prostjedn TO PUBLIC;


-- Table c_pvs
DROP VIEW IF EXISTS d_monitor.c_pvs;
drop table if exists src_monitor.c_pvs;
create table src_monitor.c_pvs (kapitola_id VARCHAR, pvs_id VARCHAR, p_prijem BOOLEAN, p_vydaj BOOLEAN, pvs_nazev VARCHAR, blok VARCHAR, okruh VARCHAR, mnozina VARCHAR);
CREATE VIEW d_monitor.c_pvs AS SELECT * FROM src_monitor.c_pvs;
GRANT ALL ON TABLE src_monitor.c_pvs TO etl;
GRANT SELECT ON TABLE d_monitor.c_pvs TO PUBLIC;


-- Table c_polozka
DROP VIEW IF EXISTS d_monitor.c_polozka;
drop table if exists src_monitor.c_polozka;
create table src_monitor.c_polozka (polozka VARCHAR, start_date date, end_date date, druh VARCHAR, trida VARCHAR, seskupeni VARCHAR, podseskupeni VARCHAR, nazev VARCHAR, kr_nazev VARCHAR, str_nazev VARCHAR, kon_pol VARCHAR, kon_okr VARCHAR, kon_kraj VARCHAR, kon_rep VARCHAR);
CREATE VIEW d_monitor.c_polozka AS SELECT * FROM src_monitor.c_polozka;
GRANT ALL ON TABLE src_monitor.c_polozka TO etl;
GRANT SELECT ON TABLE d_monitor.c_polozka TO PUBLIC;


-- Table c_rozprog
DROP VIEW IF EXISTS d_monitor.c_rozprog;
drop table if exists src_monitor.c_rozprog;
create table src_monitor.c_rozprog (rozprog_id VARCHAR, rozprog_nazev VARCHAR, start_date date, end_date date);
CREATE VIEW d_monitor.c_rozprog AS SELECT * FROM src_monitor.c_rozprog;
GRANT ALL ON TABLE src_monitor.c_rozprog TO etl;
GRANT SELECT ON TABLE d_monitor.c_rozprog TO PUBLIC;


-- Table c_uctosnova
DROP VIEW IF EXISTS d_monitor.c_uctosnova;
drop table if exists src_monitor.c_uctosnova;
create table src_monitor.c_uctosnova (vykaz_id VARCHAR, vykaz_tabulka VARCHAR, polvyk VARCHAR, polvyk_nazev VARCHAR, polvyk_order INTEGER, synuc VARCHAR, start_date date, end_date date);
CREATE VIEW d_monitor.c_uctosnova AS SELECT * FROM src_monitor.c_uctosnova;
GRANT ALL ON TABLE src_monitor.c_uctosnova TO etl;
GRANT SELECT ON TABLE d_monitor.c_uctosnova TO PUBLIC;


-- Table c_typfinmista
DROP VIEW IF EXISTS d_monitor.c_typfinmista;
drop table if exists src_monitor.c_typfinmista;
create table src_monitor.c_typfinmista (typfinmista_id VARCHAR, typfinmista_nazev VARCHAR);
CREATE VIEW d_monitor.c_typfinmista AS SELECT * FROM src_monitor.c_typfinmista;
GRANT ALL ON TABLE src_monitor.c_typfinmista TO etl;
GRANT SELECT ON TABLE d_monitor.c_typfinmista TO PUBLIC;


-- Table c_typorg
DROP VIEW IF EXISTS d_monitor.c_typorg;
drop table if exists src_monitor.c_typorg;
create table src_monitor.c_typorg (typorg_id VARCHAR, typorg_nazev VARCHAR);
CREATE VIEW d_monitor.c_typorg AS SELECT * FROM src_monitor.c_typorg;
GRANT ALL ON TABLE src_monitor.c_typorg TO etl;
GRANT SELECT ON TABLE d_monitor.c_typorg TO PUBLIC;


-- Table c_ucel
DROP VIEW IF EXISTS d_monitor.c_ucel;
drop table if exists src_monitor.c_ucel;
create table src_monitor.c_ucel (ucel_id VARCHAR, start_date date, end_date date, ucel_nazev VARCHAR);
CREATE VIEW d_monitor.c_ucel AS SELECT * FROM src_monitor.c_ucel;
GRANT ALL ON TABLE src_monitor.c_ucel TO etl;
GRANT SELECT ON TABLE d_monitor.c_ucel TO PUBLIC;


-- Table c_ucelznak
DROP VIEW IF EXISTS d_monitor.c_ucelznak;
drop table if exists src_monitor.c_ucelznak;
create table src_monitor.c_ucelznak (ucelznak_id VARCHAR, ucelznak_nazev VARCHAR, poskytovatel VARCHAR, start_date date, end_date date);
CREATE VIEW d_monitor.c_ucelznak AS SELECT * FROM src_monitor.c_ucelznak;
GRANT ALL ON TABLE src_monitor.c_ucelznak TO etl;
GRANT SELECT ON TABLE d_monitor.c_ucelznak TO PUBLIC;


-- Table c_ucjed
DROP VIEW IF EXISTS d_monitor.c_ucjed;
drop table if exists src_monitor.c_ucjed;
create table src_monitor.c_ucjed (ico VARCHAR, start_date date, end_date date, ucjed_nazev VARCHAR, dic VARCHAR, adresa TEXT, zrizovatel_ico VARCHAR, nace_id VARCHAR, nuts_id VARCHAR, cofog_id VARCHAR, isektor_id VARCHAR, kapitola_id VARCHAR, druhuj_id VARCHAR, poddruhuj_id VARCHAR, forma_id VARCHAR, katobyv_id VARCHAR, pocob INTEGER, konecplat DATE, obec VARCHAR, kraj VARCHAR, datumvzniku DATE, datumakt DATE, aktorg_id VARCHAR, ulice VARCHAR, sidlo VARCHAR, psc VARCHAR, druhrizeni_id VARCHAR, stat_id VARCHAR, typorg_id VARCHAR, zdrojfin_id VARCHAR, zpodm_id VARCHAR, veduc_id VARCHAR, kod_pou VARCHAR, kod_rp VARCHAR, zuj VARCHAR);
CREATE VIEW d_monitor.c_ucjed AS SELECT * FROM src_monitor.c_ucjed;
GRANT ALL ON TABLE src_monitor.c_ucjed TO etl;
GRANT SELECT ON TABLE d_monitor.c_ucjed TO PUBLIC;


-- Table c_veduc
DROP VIEW IF EXISTS d_monitor.c_veduc;
drop table if exists src_monitor.c_veduc;
create table src_monitor.c_veduc (veduc_id VARCHAR, veduc_nazev VARCHAR);
CREATE VIEW d_monitor.c_veduc AS SELECT * FROM src_monitor.c_veduc;
GRANT ALL ON TABLE src_monitor.c_veduc TO etl;
GRANT SELECT ON TABLE d_monitor.c_veduc TO PUBLIC;


-- Table c_zuj
DROP VIEW IF EXISTS d_monitor.c_zuj;
drop table if exists src_monitor.c_zuj;
create table src_monitor.c_zuj (zuj_id VARCHAR, zuj_nazev VARCHAR);
CREATE VIEW d_monitor.c_zuj AS SELECT * FROM src_monitor.c_zuj;
GRANT ALL ON TABLE src_monitor.c_zuj TO etl;
GRANT SELECT ON TABLE d_monitor.c_zuj TO PUBLIC;


-- Table c_polvkk
DROP VIEW IF EXISTS d_monitor.c_polvkk;
drop table if exists src_monitor.c_polvkk;
create table src_monitor.c_polvkk (polvkk VARCHAR, polvkk_nazev VARCHAR, kapitola_id VARCHAR, druh_ukazatele VARCHAR, start_date date, end_date date);
CREATE VIEW d_monitor.c_polvkk AS SELECT * FROM src_monitor.c_polvkk;
GRANT ALL ON TABLE src_monitor.c_polvkk TO etl;
GRANT SELECT ON TABLE d_monitor.c_polvkk TO PUBLIC;


-- Table c_psuk
DROP VIEW IF EXISTS d_monitor.c_psuk;
drop table if exists src_monitor.c_psuk;
create table src_monitor.c_psuk (psuk_id VARCHAR, psuk VARCHAR, polvkk VARCHAR, psuk_nazev VARCHAR, kapitola_id VARCHAR, typ_ukazatele VARCHAR, druh_ukazatele VARCHAR, start_date date, end_date date);
CREATE VIEW d_monitor.c_psuk AS SELECT * FROM src_monitor.c_psuk;
GRANT ALL ON TABLE src_monitor.c_psuk TO etl;
GRANT SELECT ON TABLE d_monitor.c_psuk TO PUBLIC;


-- Table c_zazjedn
DROP VIEW IF EXISTS d_monitor.c_zazjedn;
drop table if exists src_monitor.c_zazjedn;
create table src_monitor.c_zazjedn (zazjedn_id VARCHAR, zazjedn_nazev VARCHAR);
CREATE VIEW d_monitor.c_zazjedn AS SELECT * FROM src_monitor.c_zazjedn;
GRANT ALL ON TABLE src_monitor.c_zazjedn TO etl;
GRANT SELECT ON TABLE d_monitor.c_zazjedn TO PUBLIC;


-- Table c_zdroj
DROP VIEW IF EXISTS d_monitor.c_zdroj;
drop table if exists src_monitor.c_zdroj;
create table src_monitor.c_zdroj (zdroj_id VARCHAR, start_date date, end_date date, prostjedn_id VARCHAR, nastroj_id VARCHAR, podklad_id VARCHAR, nastrojanal_id VARCHAR, zdroj_nazev VARCHAR);
CREATE VIEW d_monitor.c_zdroj AS SELECT * FROM src_monitor.c_zdroj;
GRANT ALL ON TABLE src_monitor.c_zdroj TO etl;
GRANT SELECT ON TABLE d_monitor.c_zdroj TO PUBLIC;


-- Table c_zdrojfin
DROP VIEW IF EXISTS d_monitor.c_zdrojfin;
drop table if exists src_monitor.c_zdrojfin;
create table src_monitor.c_zdrojfin (zdrojfin_id VARCHAR, zdrojfin_nazev VARCHAR);
CREATE VIEW d_monitor.c_zdrojfin AS SELECT * FROM src_monitor.c_zdrojfin;
GRANT ALL ON TABLE src_monitor.c_zdrojfin TO etl;
GRANT SELECT ON TABLE d_monitor.c_zdrojfin TO PUBLIC;


-- Table c_zpodm
DROP VIEW IF EXISTS d_monitor.c_zpodm;
drop table if exists src_monitor.c_zpodm;
create table src_monitor.c_zpodm (zpodm_id VARCHAR, zpodm_nazev VARCHAR);
CREATE VIEW d_monitor.c_zpodm AS SELECT * FROM src_monitor.c_zpodm;
GRANT ALL ON TABLE src_monitor.c_zpodm TO etl;
GRANT SELECT ON TABLE d_monitor.c_zpodm TO PUBLIC;

