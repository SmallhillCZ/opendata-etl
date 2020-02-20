--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3
-- Dumped by pg_dump version 12.0

-- Started on 2020-01-10 15:40:07 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 46 (class 2615 OID 16452)
-- Name: src_cedr; Type: SCHEMA; Schema: -; Owner: data04
--

CREATE SCHEMA src_cedr;


ALTER SCHEMA src_cedr OWNER TO data04;

SET default_tablespace = '';

--
-- TOC entry 244 (class 1259 OID 16799)
-- Name: adresa_bydliste; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.adresa_bydliste (
    id_adresa character varying NOT NULL,
    id_prijemce character varying,
    adr_typ character varying,
    iri_stat character varying,
    iri_obec character varying,
    obec_kod character varying,
    obec_nazev character varying,
    d_platnost date,
    dt_aktualizace timestamp without time zone
);


ALTER TABLE src_cedr.adresa_bydliste OWNER TO data04;

--
-- TOC entry 245 (class 1259 OID 16810)
-- Name: adresa_sidlo; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.adresa_sidlo (
    id_adresa character varying NOT NULL,
    id_prijemce character varying,
    adr_typ character varying,
    iri_stat character varying,
    iri_obec character varying,
    obec_kod character varying,
    obec_nazev character varying,
    psc character varying,
    adresni_misto_kod character varying,
    cast_obce character varying,
    cast_obce_kod character varying,
    cislo_domovni character varying,
    cislo_orientacni character varying,
    ulice_kod character varying,
    ulice character varying,
    adresa_text character varying,
    d_platnost date,
    dt_aktualizace timestamp without time zone
);


ALTER TABLE src_cedr.adresa_sidlo OWNER TO data04;

--
-- TOC entry 277 (class 1259 OID 18717)
-- Name: ciselnik_cedr_cinnost_type_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_cedr_cinnost_type_v01 (
    id_cinnost_typ character varying NOT NULL,
    id_grantove_schema character varying,
    cinnost_typ_kod character varying,
    cinnost_typ_nazev text,
    cinnost_typ_cislo character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_cedr_cinnost_type_v01 OWNER TO data04;

--
-- TOC entry 278 (class 1259 OID 18725)
-- Name: ciselnik_cedr_grantove_schema_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_cedr_grantove_schema_v01 (
    id_grantove_schema character varying NOT NULL,
    grantove_schema_kod character varying,
    grantove_schema_nazev text,
    grantove_schema_cislo character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_cedr_grantove_schema_v01 OWNER TO data04;

--
-- TOC entry 279 (class 1259 OID 18733)
-- Name: ciselnik_cedr_opatreni_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_cedr_opatreni_v01 (
    id_opatreni character varying NOT NULL,
    id_priorita character varying,
    opatreni_kod character varying,
    opatreni_nazev text,
    opatreni_cislo character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_cedr_opatreni_v01 OWNER TO data04;

--
-- TOC entry 280 (class 1259 OID 18741)
-- Name: ciselnik_cedr_operacni_program_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_cedr_operacni_program_v01 (
    id_operacni_program character varying NOT NULL,
    operacni_program_kod character varying,
    operacni_program_nazev text,
    operacni_program_cislo character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_cedr_operacni_program_v01 OWNER TO data04;

--
-- TOC entry 281 (class 1259 OID 18749)
-- Name: ciselnik_cedr_pod_opatreni_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_cedr_pod_opatreni_v01 (
    id_pod_opatreni character varying NOT NULL,
    id_opatreni character varying,
    pod_opatreni_kod character varying,
    pod_opatreni_nazev text,
    pod_opatreni_cislo character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_cedr_pod_opatreni_v01 OWNER TO data04;

--
-- TOC entry 282 (class 1259 OID 18757)
-- Name: ciselnik_cedr_podprogram_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_cedr_podprogram_v01 (
    id_podprogram character varying NOT NULL,
    id_operacni_program character varying,
    podprogram_kod character varying,
    podprogram_nazev text,
    podprogram_cislo character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_cedr_podprogram_v01 OWNER TO data04;

--
-- TOC entry 283 (class 1259 OID 18765)
-- Name: ciselnik_cedr_priorita_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_cedr_priorita_v01 (
    id_priorita character varying NOT NULL,
    id_operacni_program character varying,
    id_podprogram character varying,
    priorita_kod character varying,
    priorita_nazev text,
    priorita_cislo character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_cedr_priorita_v01 OWNER TO data04;

--
-- TOC entry 284 (class 1259 OID 18773)
-- Name: ciselnik_cedr_program_podpora_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_cedr_program_podpora_v01 (
    id_program_podpora character varying NOT NULL,
    id_cinnost_typ character varying,
    program_podpora_kod character varying,
    program_podpora_nazev text,
    program_podpora_cislo character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_cedr_program_podpora_v01 OWNER TO data04;

--
-- TOC entry 285 (class 1259 OID 18781)
-- Name: ciselnik_dotace_poskytovatel_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_dotace_poskytovatel_v01 (
    id character varying NOT NULL,
    dotace_poskytovatel_kod character varying,
    dotace_poskytovatel_nazev text,
    dotace_poskytovatel_nadrizeny_kod character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_dotace_poskytovatel_v01 OWNER TO data04;

--
-- TOC entry 286 (class 1259 OID 18789)
-- Name: ciselnik_dotace_titul_rozpoctova_skladba_paragraf_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_dotace_titul_rozpoctova_skladba_paragraf_v01 (
    id_dotace_tiltul character varying NOT NULL,
    id_rozpoctova_skladba_paragraf character varying NOT NULL
);


ALTER TABLE src_cedr.ciselnik_dotace_titul_rozpoctova_skladba_paragraf_v01 OWNER TO data04;

--
-- TOC entry 287 (class 1259 OID 18797)
-- Name: ciselnik_dotace_titul_rozpoctova_skladba_polozka_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_dotace_titul_rozpoctova_skladba_polozka_v01 (
    id_dotace_tiltul character varying NOT NULL,
    id_rozpoctova_skladba_polozka character varying NOT NULL
);


ALTER TABLE src_cedr.ciselnik_dotace_titul_rozpoctova_skladba_polozka_v01 OWNER TO data04;

--
-- TOC entry 288 (class 1259 OID 18805)
-- Name: ciselnik_dotace_titul_statni_rozpocet_ukazatel_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_dotace_titul_statni_rozpocet_ukazatel_v01 (
    id_dotace_tiltul character varying NOT NULL,
    id_statni_rozpocet_ukazatel character varying NOT NULL
);


ALTER TABLE src_cedr.ciselnik_dotace_titul_statni_rozpocet_ukazatel_v01 OWNER TO data04;

--
-- TOC entry 289 (class 1259 OID 18813)
-- Name: ciselnik_dotace_titul_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_dotace_titul_v01 (
    id_dotace_titul character varying NOT NULL,
    dotace_titul_kod character varying,
    dotace_titul_vlastni_kod character varying,
    statni_rozpocet_kapitola_kod character varying,
    dotace_titul_nazev text,
    dotace_titul_nazev_zkraceny text,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_dotace_titul_v01 OWNER TO data04;

--
-- TOC entry 290 (class 1259 OID 18821)
-- Name: ciselnik_financni_prostredek_cleneni_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_financni_prostredek_cleneni_v01 (
    id character varying NOT NULL,
    financni_prostredek_cleneni_kod character varying,
    financni_prostredek_cleneni_nazev text,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_financni_prostredek_cleneni_v01 OWNER TO data04;

--
-- TOC entry 291 (class 1259 OID 18829)
-- Name: ciselnik_financni_zdroj_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_financni_zdroj_v01 (
    id character varying NOT NULL,
    financni_zdroj_kod character varying,
    financni_zdroj_nadrizeny_kod character varying,
    financni_zdroj_nazev text,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_financni_zdroj_v01 OWNER TO data04;

--
-- TOC entry 469 (class 1259 OID 32800)
-- Name: ciselnik_kraj_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_kraj_v01 (
    id character varying NOT NULL,
    kraj_kod character varying,
    kraj_nazev character varying,
    globalni_navrh_zmena_identifikator character varying,
    nespravnost_indikator boolean,
    transakce_identifikator character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_kraj_v01 OWNER TO data04;

--
-- TOC entry 470 (class 1259 OID 32808)
-- Name: ciselnik_mestsky_obvod_mestska_cast_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_mestsky_obvod_mestska_cast_v01 (
    id character varying NOT NULL,
    mestsky_obvod_mestska_cast_kod character varying,
    mestsky_obvod_mestska_cast_nazev character varying,
    obec_nad character varying,
    pad2 character varying,
    pad3 character varying,
    pad4 character varying,
    pad5 character varying,
    pad6 character varying,
    pad7 character varying,
    globalni_navrh_zmena_identifikator character varying,
    nespravnost_indikator boolean,
    transakce_identifikator character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_mestsky_obvod_mestska_cast_v01 OWNER TO data04;

--
-- TOC entry 450 (class 1259 OID 32666)
-- Name: ciselnik_mmr_cinnost_type_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_mmr_cinnost_type_v01 (
    id_cinnost_typ character varying NOT NULL,
    id_grantove_schema character varying,
    cinnost_typ_kod character varying,
    cinnost_typ_nazev character varying,
    cinnost_typ_cislo character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_mmr_cinnost_type_v01 OWNER TO data04;

--
-- TOC entry 451 (class 1259 OID 32674)
-- Name: ciselnik_mmr_grantove_schema_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_mmr_grantove_schema_v01 (
    id_grantove_schema character varying NOT NULL,
    grantove_schema_kod character varying,
    grantove_schema_nazev character varying,
    grantove_schema_cislo character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_mmr_grantove_schema_v01 OWNER TO data04;

--
-- TOC entry 452 (class 1259 OID 32682)
-- Name: ciselnik_mmr_opatreni_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_mmr_opatreni_v01 (
    id_opatreni character varying NOT NULL,
    id_priorita character varying,
    opatreni_kod character varying,
    opatreni_nazev character varying,
    opatreni_cislo character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_mmr_opatreni_v01 OWNER TO data04;

--
-- TOC entry 453 (class 1259 OID 32690)
-- Name: ciselnik_mmr_operacni_program_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_mmr_operacni_program_v01 (
    id_operacni_program character varying NOT NULL,
    operacni_program_kod character varying,
    operacni_program_nazev character varying,
    operacni_program_cislo character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_mmr_operacni_program_v01 OWNER TO data04;

--
-- TOC entry 454 (class 1259 OID 32698)
-- Name: ciselnik_mmr_pod_opatreni_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_mmr_pod_opatreni_v01 (
    id_pod_opatreni character varying NOT NULL,
    id_opatreni character varying,
    pod_opatreni_kod character varying,
    pod_opatreni_nazev character varying,
    pod_opatreni_cislo character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_mmr_pod_opatreni_v01 OWNER TO data04;

--
-- TOC entry 455 (class 1259 OID 32706)
-- Name: ciselnik_mmr_podprogram_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_mmr_podprogram_v01 (
    id_podprogram character varying NOT NULL,
    id_operacni_program character varying,
    podprogram_kod character varying,
    podprogram_nazev character varying,
    podprogram_cislo character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_mmr_podprogram_v01 OWNER TO data04;

--
-- TOC entry 456 (class 1259 OID 32714)
-- Name: ciselnik_mmr_priorita_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_mmr_priorita_v01 (
    id_priorita character varying NOT NULL,
    id_operacni_program character varying,
    id_podprogram character varying,
    priorita_kod character varying,
    priorita_nazev character varying,
    priorita_cislo character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_mmr_priorita_v01 OWNER TO data04;

--
-- TOC entry 457 (class 1259 OID 32722)
-- Name: ciselnik_mmr_program_podpora_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_mmr_program_podpora_v01 (
    id_program_podpora character varying NOT NULL,
    id_cinnost_typ character varying,
    program_podpora_kod character varying,
    program_podpora_nazev character varying,
    program_podpora_cislo character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_mmr_program_podpora_v01 OWNER TO data04;

--
-- TOC entry 471 (class 1259 OID 32816)
-- Name: ciselnik_obec_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_obec_v01 (
    id character varying NOT NULL,
    obec_kod character varying,
    obec_nuts_kod character varying,
    obec_nazev character varying,
    okres_nad character varying,
    pad2 character varying,
    pad3 character varying,
    pad4 character varying,
    pad5 character varying,
    pad6 character varying,
    pad7 character varying,
    globalni_navrh_zmena_identifikator character varying,
    nespravnost_indikator boolean,
    transakce_identifikator character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_obec_v01 OWNER TO data04;

--
-- TOC entry 472 (class 1259 OID 32824)
-- Name: ciselnik_okres_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_okres_v01 (
    id character varying NOT NULL,
    okres_kod character varying,
    okres_nazev character varying,
    okres_nuts_kod character varying,
    kraj_nad character varying,
    vusc_nad character varying,
    globalni_navrh_zmena_identifikator character varying,
    nespravnost_indikator boolean,
    transakce_identifikator character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_okres_v01 OWNER TO data04;

--
-- TOC entry 467 (class 1259 OID 32784)
-- Name: ciselnik_pravni_forma_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_pravni_forma_v01 (
    id character varying NOT NULL,
    pravni_forma_kod character varying,
    pravni_forma_nazev character varying,
    pravni_forma_nazev_zkraceny character varying,
    pravni_forma_typ_kod character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_pravni_forma_v01 OWNER TO data04;

--
-- TOC entry 468 (class 1259 OID 32792)
-- Name: ciselnik_pravni_forma_v02; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_pravni_forma_v02 (
    id character varying NOT NULL,
    pravni_forma_kod character varying,
    pravni_forma_nazev character varying,
    pravni_forma_nazev_zkraceny character varying,
    pravni_forma_typ_kod character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_pravni_forma_v02 OWNER TO data04;

--
-- TOC entry 474 (class 1259 OID 32840)
-- Name: ciselnik_program_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_program_v01 (
    id character varying NOT NULL,
    program_kod character varying,
    program_nazev character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_program_v01 OWNER TO data04;

--
-- TOC entry 292 (class 1259 OID 18837)
-- Name: ciselnik_rozpoctova_skladba_paragraf_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_rozpoctova_skladba_paragraf_v01 (
    id character varying NOT NULL,
    rozpoctova_skladba_paragraf_kod character varying,
    rozpoctova_skladba_paragraf_nazev text,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_rozpoctova_skladba_paragraf_v01 OWNER TO data04;

--
-- TOC entry 293 (class 1259 OID 18845)
-- Name: ciselnik_rozpoctova_skladba_polozka_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_rozpoctova_skladba_polozka_v01 (
    id character varying NOT NULL,
    rozpoctova_skladba_polozka_kod character varying,
    rozpoctova_skladba_polozka_nazev text,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_rozpoctova_skladba_polozka_v01 OWNER TO data04;

--
-- TOC entry 466 (class 1259 OID 32776)
-- Name: ciselnik_stat_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_stat_v01 (
    id character varying NOT NULL,
    stat_kod3_znaky character varying,
    stat_kod3_cisla character varying,
    stat_kod_omezeny character varying,
    stat_nazev character varying,
    stat_nazev_zkraceny character varying,
    stat_nazev_en character varying,
    stat_nazev_zkraceny_en character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_stat_v01 OWNER TO data04;

--
-- TOC entry 294 (class 1259 OID 18853)
-- Name: ciselnik_statni_rozpocet_kapitola_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_statni_rozpocet_kapitola_v01 (
    id character varying NOT NULL,
    statni_rozpocet_kapitola_kod character varying,
    statni_rozpocet_kapitola_nazev text,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_statni_rozpocet_kapitola_v01 OWNER TO data04;

--
-- TOC entry 295 (class 1259 OID 18861)
-- Name: ciselnik_statni_rozpocet_ukazatel_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_statni_rozpocet_ukazatel_v01 (
    id character varying NOT NULL,
    id_statni_rozpocet_kapitola character varying,
    statni_rozpocet_ukazatel_kod character varying,
    statni_rozpocet_kapitola_kod character varying,
    statni_rozpocet_ukazatel_nadrizeny_kod character varying,
    statni_rozpocet_ukazatel_nazev text,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_statni_rozpocet_ukazatel_v01 OWNER TO data04;

--
-- TOC entry 296 (class 1259 OID 18869)
-- Name: ciselnik_ucel_znak_dotacni_titul_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_ucel_znak_dotacni_titul_v01 (
    id_ucel_znak character varying NOT NULL,
    id_dotace_titul character varying NOT NULL
);


ALTER TABLE src_cedr.ciselnik_ucel_znak_dotacni_titul_v01 OWNER TO data04;

--
-- TOC entry 297 (class 1259 OID 18877)
-- Name: ciselnik_ucel_znak_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_ucel_znak_v01 (
    id_ucel_znak character varying NOT NULL,
    ucel_znak_kod character varying,
    statni_rozpocet_kapitola_kod character varying,
    ucel_znak_nazev text,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_ucel_znak_v01 OWNER TO data04;

--
-- TOC entry 473 (class 1259 OID 32832)
-- Name: ciselnik_vusc_v01; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ciselnik_vusc_v01 (
    id character varying NOT NULL,
    vusc_kod character varying,
    kraj_nuts_kod character varying,
    vusc_nazev character varying,
    globalni_navrh_zmena_identifikator character varying,
    nespravnost_indikator boolean,
    transakce_identifikator character varying,
    zaznam_platnost_od_datum date,
    zaznam_platnost_do_datum date
);


ALTER TABLE src_cedr.ciselnik_vusc_v01 OWNER TO data04;

--
-- TOC entry 246 (class 1259 OID 16822)
-- Name: dotace; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.dotace (
    id_dotace character varying NOT NULL,
    id_prijemce character varying,
    projekt_kod character varying,
    podpis_datum date,
    subjekt_rozliseni_kod character varying,
    ukonceni_planovane_datum date,
    ukonceni_skutecne_datum date,
    zahajeni_planovane_datum date,
    zahajeni_skutecne_datum date,
    zmena_smlouvy_indikator boolean,
    projekt_identifikator character varying,
    projekt_nazev text,
    iri_operacni_program character varying,
    iri_podprogram character varying,
    iri_priorita character varying,
    iri_opatreni character varying,
    iri_podopatreni character varying,
    iri_grantove_schema character varying,
    iri_program_podpora character varying,
    iri_typ_cinnosti character varying,
    iri_program character varying,
    d_platnost date,
    dt_aktualizace timestamp without time zone
);


ALTER TABLE src_cedr.dotace OWNER TO data04;

--
-- TOC entry 475 (class 1259 OID 32848)
-- Name: ekonomika_subjekt; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.ekonomika_subjekt (
    id character varying NOT NULL,
    ico character varying
);


ALTER TABLE src_cedr.ekonomika_subjekt OWNER TO data04;

--
-- TOC entry 242 (class 1259 OID 16633)
-- Name: etapa; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.etapa (
    id_etapa character varying NOT NULL,
    id_dotace character varying,
    etapa_cislo character varying,
    etapa_nazev text,
    ukonceni_planovane_datum date,
    ukonceni_skutecne_datum date,
    zahajeni_planovane_datum date,
    zahajeni_skutecne_datum date,
    poznamka text,
    dt_aktualizace timestamp without time zone
);


ALTER TABLE src_cedr.etapa OWNER TO data04;

--
-- TOC entry 476 (class 1259 OID 32856)
-- Name: osoba; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.osoba (
    id character varying NOT NULL,
    jmeno character varying,
    prijmeni character varying,
    narozeni_rok integer,
    bydliste_obec_kod character varying
);


ALTER TABLE src_cedr.osoba OWNER TO data04;

--
-- TOC entry 243 (class 1259 OID 16779)
-- Name: prijemce_pomoci; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.prijemce_pomoci (
    id_prijemce character varying NOT NULL,
    ico character varying,
    obchodni_jmeno character varying,
    jmeno character varying,
    prijmeni character varying,
    iri_pravni_forma character varying,
    rok_narozeni smallint,
    iri_stat character varying,
    iri_osoba character varying,
    iri_ekonomika_subjekt character varying,
    d_platnost date,
    dt_aktualizace timestamp without time zone
);


ALTER TABLE src_cedr.prijemce_pomoci OWNER TO data04;

--
-- TOC entry 247 (class 1259 OID 16838)
-- Name: rozhodnuti; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.rozhodnuti (
    id_rozhodnuti character varying NOT NULL,
    id_dotace character varying,
    castka_pozadovana numeric(14,2),
    castka_rozhodnuta numeric(14,2),
    iri_poskytovatel_dotace character varying,
    iri_cleneni_financnich_prostredku character varying,
    iri_financni_zdroj character varying,
    rok_rozhodnuti smallint,
    investice_indikator boolean,
    navratnost_indikator boolean,
    refundace_indikator boolean,
    d_platnost date,
    dt_aktualizace timestamp without time zone
);


ALTER TABLE src_cedr.rozhodnuti OWNER TO data04;

--
-- TOC entry 248 (class 1259 OID 16908)
-- Name: rozhodnuti_smlouva; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.rozhodnuti_smlouva (
    id_smlouva character varying NOT NULL,
    id_rozhodnuti character varying,
    cislo_jednaci_rozhodnuti character varying,
    dokument_druh_kod smallint,
    rozhodnuti_datum date,
    dt_aktualizace timestamp without time zone
);


ALTER TABLE src_cedr.rozhodnuti_smlouva OWNER TO data04;

--
-- TOC entry 249 (class 1259 OID 16921)
-- Name: rozpoctove_obdobi; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.rozpoctove_obdobi (
    id_obdobi character varying NOT NULL,
    id_rozhodnuti character varying,
    castka_cerpana numeric(14,2),
    castka_uvolnena numeric(14,2),
    castka_vracena numeric(14,2),
    castka_spotrebovana numeric(14,2),
    rozpoctove_obdobi smallint,
    vyporadani_kod smallint,
    iri_dotacni_titul character varying,
    iri_ucelovy_znak character varying,
    d_platnost date,
    dt_aktualizace timestamp without time zone
);


ALTER TABLE src_cedr.rozpoctove_obdobi OWNER TO data04;

--
-- TOC entry 250 (class 1259 OID 16935)
-- Name: splatka_kalendar; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.splatka_kalendar (
    id_s_kalendar character varying NOT NULL,
    id_rozhodnuti character varying,
    castka_splatka_planovana numeric(14,2),
    castka_splatka_skutecna numeric(14,2),
    uroceni_indikator boolean,
    d_platnost date,
    dt_aktualizace timestamp without time zone
);


ALTER TABLE src_cedr.splatka_kalendar OWNER TO data04;

--
-- TOC entry 298 (class 1259 OID 19176)
-- Name: uzemni_realizace; Type: TABLE; Schema: src_cedr; Owner: data04
--

CREATE TABLE src_cedr.uzemni_realizace (
    id_uzemi character varying NOT NULL,
    id_dotace character varying,
    mezinarodni_pusobnost_indikator boolean,
    iri_realizovan_na_uzemi_statu character varying,
    uzemni_realizace_popis text,
    obvod_praha_predavaci_kod character varying,
    spravni_obvod_praha_predavaci_kod character varying,
    stavebni_objekt_kod character varying,
    ulice_kod character varying,
    iri_cast_obce character varying,
    iri_kraj character varying,
    iri_mestsky_obvod_mestska_cast character varying,
    iri_obec character varying,
    iri_okres character varying,
    iri_vusc character varying,
    adresni_misto_kod character varying,
    okres_nuts_kod character varying,
    d_platnost date,
    dt_aktualizace timestamp without time zone
);


ALTER TABLE src_cedr.uzemni_realizace OWNER TO data04;

--
-- TOC entry 4517 (class 2606 OID 16806)
-- Name: adresa_bydliste adresa_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.adresa_bydliste
    ADD CONSTRAINT adresa_pkey PRIMARY KEY (id_adresa);


--
-- TOC entry 4520 (class 2606 OID 17335)
-- Name: adresa_sidlo adresa_sidlo_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.adresa_sidlo
    ADD CONSTRAINT adresa_sidlo_pkey PRIMARY KEY (id_adresa);


--
-- TOC entry 4537 (class 2606 OID 18724)
-- Name: ciselnik_cedr_cinnost_type_v01 ciselnik_cedr_cinnost_type_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_cedr_cinnost_type_v01
    ADD CONSTRAINT ciselnik_cedr_cinnost_type_v01_pkey PRIMARY KEY (id_cinnost_typ);


--
-- TOC entry 4539 (class 2606 OID 18732)
-- Name: ciselnik_cedr_grantove_schema_v01 ciselnik_cedr_grantove_schema_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_cedr_grantove_schema_v01
    ADD CONSTRAINT ciselnik_cedr_grantove_schema_v01_pkey PRIMARY KEY (id_grantove_schema);


--
-- TOC entry 4541 (class 2606 OID 18740)
-- Name: ciselnik_cedr_opatreni_v01 ciselnik_cedr_opatreni_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_cedr_opatreni_v01
    ADD CONSTRAINT ciselnik_cedr_opatreni_v01_pkey PRIMARY KEY (id_opatreni);


--
-- TOC entry 4543 (class 2606 OID 18748)
-- Name: ciselnik_cedr_operacni_program_v01 ciselnik_cedr_operacni_program_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_cedr_operacni_program_v01
    ADD CONSTRAINT ciselnik_cedr_operacni_program_v01_pkey PRIMARY KEY (id_operacni_program);


--
-- TOC entry 4545 (class 2606 OID 18756)
-- Name: ciselnik_cedr_pod_opatreni_v01 ciselnik_cedr_pod_opatreni_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_cedr_pod_opatreni_v01
    ADD CONSTRAINT ciselnik_cedr_pod_opatreni_v01_pkey PRIMARY KEY (id_pod_opatreni);


--
-- TOC entry 4547 (class 2606 OID 18764)
-- Name: ciselnik_cedr_podprogram_v01 ciselnik_cedr_podprogram_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_cedr_podprogram_v01
    ADD CONSTRAINT ciselnik_cedr_podprogram_v01_pkey PRIMARY KEY (id_podprogram);


--
-- TOC entry 4549 (class 2606 OID 18772)
-- Name: ciselnik_cedr_priorita_v01 ciselnik_cedr_priorita_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_cedr_priorita_v01
    ADD CONSTRAINT ciselnik_cedr_priorita_v01_pkey PRIMARY KEY (id_priorita);


--
-- TOC entry 4551 (class 2606 OID 18780)
-- Name: ciselnik_cedr_program_podpora_v01 ciselnik_cedr_program_podpora_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_cedr_program_podpora_v01
    ADD CONSTRAINT ciselnik_cedr_program_podpora_v01_pkey PRIMARY KEY (id_program_podpora);


--
-- TOC entry 4553 (class 2606 OID 18788)
-- Name: ciselnik_dotace_poskytovatel_v01 ciselnik_dotace_poskytovatel_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_dotace_poskytovatel_v01
    ADD CONSTRAINT ciselnik_dotace_poskytovatel_v01_pkey PRIMARY KEY (id);


--
-- TOC entry 4555 (class 2606 OID 18796)
-- Name: ciselnik_dotace_titul_rozpoctova_skladba_paragraf_v01 ciselnik_dotace_titul_rozpoctova_skladba_paragraf_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_dotace_titul_rozpoctova_skladba_paragraf_v01
    ADD CONSTRAINT ciselnik_dotace_titul_rozpoctova_skladba_paragraf_v01_pkey PRIMARY KEY (id_dotace_tiltul, id_rozpoctova_skladba_paragraf);


--
-- TOC entry 4557 (class 2606 OID 18804)
-- Name: ciselnik_dotace_titul_rozpoctova_skladba_polozka_v01 ciselnik_dotace_titul_rozpoctova_skladba_polozka_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_dotace_titul_rozpoctova_skladba_polozka_v01
    ADD CONSTRAINT ciselnik_dotace_titul_rozpoctova_skladba_polozka_v01_pkey PRIMARY KEY (id_dotace_tiltul, id_rozpoctova_skladba_polozka);


--
-- TOC entry 4559 (class 2606 OID 18812)
-- Name: ciselnik_dotace_titul_statni_rozpocet_ukazatel_v01 ciselnik_dotace_titul_statni_rozpocet_ukazatel_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_dotace_titul_statni_rozpocet_ukazatel_v01
    ADD CONSTRAINT ciselnik_dotace_titul_statni_rozpocet_ukazatel_v01_pkey PRIMARY KEY (id_dotace_tiltul, id_statni_rozpocet_ukazatel);


--
-- TOC entry 4561 (class 2606 OID 18820)
-- Name: ciselnik_dotace_titul_v01 ciselnik_dotace_titul_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_dotace_titul_v01
    ADD CONSTRAINT ciselnik_dotace_titul_v01_pkey PRIMARY KEY (id_dotace_titul);


--
-- TOC entry 4563 (class 2606 OID 18828)
-- Name: ciselnik_financni_prostredek_cleneni_v01 ciselnik_financni_prostredek_cleneni_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_financni_prostredek_cleneni_v01
    ADD CONSTRAINT ciselnik_financni_prostredek_cleneni_v01_pkey PRIMARY KEY (id);


--
-- TOC entry 4565 (class 2606 OID 18836)
-- Name: ciselnik_financni_zdroj_v01 ciselnik_financni_zdroj_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_financni_zdroj_v01
    ADD CONSTRAINT ciselnik_financni_zdroj_v01_pkey PRIMARY KEY (id);


--
-- TOC entry 4604 (class 2606 OID 32807)
-- Name: ciselnik_kraj_v01 ciselnik_kraj_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_kraj_v01
    ADD CONSTRAINT ciselnik_kraj_v01_pkey PRIMARY KEY (id);


--
-- TOC entry 4606 (class 2606 OID 32815)
-- Name: ciselnik_mestsky_obvod_mestska_cast_v01 ciselnik_mestsky_obvod_mestska_cast_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_mestsky_obvod_mestska_cast_v01
    ADD CONSTRAINT ciselnik_mestsky_obvod_mestska_cast_v01_pkey PRIMARY KEY (id);


--
-- TOC entry 4582 (class 2606 OID 32673)
-- Name: ciselnik_mmr_cinnost_type_v01 ciselnik_mmr_cinnost_type_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_mmr_cinnost_type_v01
    ADD CONSTRAINT ciselnik_mmr_cinnost_type_v01_pkey PRIMARY KEY (id_cinnost_typ);


--
-- TOC entry 4584 (class 2606 OID 32681)
-- Name: ciselnik_mmr_grantove_schema_v01 ciselnik_mmr_grantove_schema_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_mmr_grantove_schema_v01
    ADD CONSTRAINT ciselnik_mmr_grantove_schema_v01_pkey PRIMARY KEY (id_grantove_schema);


--
-- TOC entry 4586 (class 2606 OID 32689)
-- Name: ciselnik_mmr_opatreni_v01 ciselnik_mmr_opatreni_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_mmr_opatreni_v01
    ADD CONSTRAINT ciselnik_mmr_opatreni_v01_pkey PRIMARY KEY (id_opatreni);


--
-- TOC entry 4588 (class 2606 OID 32697)
-- Name: ciselnik_mmr_operacni_program_v01 ciselnik_mmr_operacni_program_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_mmr_operacni_program_v01
    ADD CONSTRAINT ciselnik_mmr_operacni_program_v01_pkey PRIMARY KEY (id_operacni_program);


--
-- TOC entry 4590 (class 2606 OID 32705)
-- Name: ciselnik_mmr_pod_opatreni_v01 ciselnik_mmr_pod_opatreni_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_mmr_pod_opatreni_v01
    ADD CONSTRAINT ciselnik_mmr_pod_opatreni_v01_pkey PRIMARY KEY (id_pod_opatreni);


--
-- TOC entry 4592 (class 2606 OID 32713)
-- Name: ciselnik_mmr_podprogram_v01 ciselnik_mmr_podprogram_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_mmr_podprogram_v01
    ADD CONSTRAINT ciselnik_mmr_podprogram_v01_pkey PRIMARY KEY (id_podprogram);


--
-- TOC entry 4594 (class 2606 OID 32721)
-- Name: ciselnik_mmr_priorita_v01 ciselnik_mmr_priorita_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_mmr_priorita_v01
    ADD CONSTRAINT ciselnik_mmr_priorita_v01_pkey PRIMARY KEY (id_priorita);


--
-- TOC entry 4596 (class 2606 OID 32729)
-- Name: ciselnik_mmr_program_podpora_v01 ciselnik_mmr_program_podpora_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_mmr_program_podpora_v01
    ADD CONSTRAINT ciselnik_mmr_program_podpora_v01_pkey PRIMARY KEY (id_program_podpora);


--
-- TOC entry 4608 (class 2606 OID 32823)
-- Name: ciselnik_obec_v01 ciselnik_obec_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_obec_v01
    ADD CONSTRAINT ciselnik_obec_v01_pkey PRIMARY KEY (id);


--
-- TOC entry 4610 (class 2606 OID 32831)
-- Name: ciselnik_okres_v01 ciselnik_okres_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_okres_v01
    ADD CONSTRAINT ciselnik_okres_v01_pkey PRIMARY KEY (id);


--
-- TOC entry 4600 (class 2606 OID 32791)
-- Name: ciselnik_pravni_forma_v01 ciselnik_pravni_forma_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_pravni_forma_v01
    ADD CONSTRAINT ciselnik_pravni_forma_v01_pkey PRIMARY KEY (id);


--
-- TOC entry 4602 (class 2606 OID 32799)
-- Name: ciselnik_pravni_forma_v02 ciselnik_pravni_forma_v02_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_pravni_forma_v02
    ADD CONSTRAINT ciselnik_pravni_forma_v02_pkey PRIMARY KEY (id);


--
-- TOC entry 4614 (class 2606 OID 32847)
-- Name: ciselnik_program_v01 ciselnik_program_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_program_v01
    ADD CONSTRAINT ciselnik_program_v01_pkey PRIMARY KEY (id);


--
-- TOC entry 4567 (class 2606 OID 18844)
-- Name: ciselnik_rozpoctova_skladba_paragraf_v01 ciselnik_rozpoctova_skladba_paragraf_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_rozpoctova_skladba_paragraf_v01
    ADD CONSTRAINT ciselnik_rozpoctova_skladba_paragraf_v01_pkey PRIMARY KEY (id);


--
-- TOC entry 4569 (class 2606 OID 18852)
-- Name: ciselnik_rozpoctova_skladba_polozka_v01 ciselnik_rozpoctova_skladba_polozka_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_rozpoctova_skladba_polozka_v01
    ADD CONSTRAINT ciselnik_rozpoctova_skladba_polozka_v01_pkey PRIMARY KEY (id);


--
-- TOC entry 4598 (class 2606 OID 32783)
-- Name: ciselnik_stat_v01 ciselnik_stat_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_stat_v01
    ADD CONSTRAINT ciselnik_stat_v01_pkey PRIMARY KEY (id);


--
-- TOC entry 4571 (class 2606 OID 18860)
-- Name: ciselnik_statni_rozpocet_kapitola_v01 ciselnik_statni_rozpocet_kapitola_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_statni_rozpocet_kapitola_v01
    ADD CONSTRAINT ciselnik_statni_rozpocet_kapitola_v01_pkey PRIMARY KEY (id);


--
-- TOC entry 4573 (class 2606 OID 18868)
-- Name: ciselnik_statni_rozpocet_ukazatel_v01 ciselnik_statni_rozpocet_ukazatel_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_statni_rozpocet_ukazatel_v01
    ADD CONSTRAINT ciselnik_statni_rozpocet_ukazatel_v01_pkey PRIMARY KEY (id);


--
-- TOC entry 4575 (class 2606 OID 18876)
-- Name: ciselnik_ucel_znak_dotacni_titul_v01 ciselnik_ucel_znak_dotacni_titul_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_ucel_znak_dotacni_titul_v01
    ADD CONSTRAINT ciselnik_ucel_znak_dotacni_titul_v01_pkey PRIMARY KEY (id_ucel_znak, id_dotace_titul);


--
-- TOC entry 4577 (class 2606 OID 18884)
-- Name: ciselnik_ucel_znak_v01 ciselnik_ucel_znak_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_ucel_znak_v01
    ADD CONSTRAINT ciselnik_ucel_znak_v01_pkey PRIMARY KEY (id_ucel_znak);


--
-- TOC entry 4612 (class 2606 OID 32839)
-- Name: ciselnik_vusc_v01 ciselnik_vusc_v01_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ciselnik_vusc_v01
    ADD CONSTRAINT ciselnik_vusc_v01_pkey PRIMARY KEY (id);


--
-- TOC entry 4523 (class 2606 OID 16829)
-- Name: dotace dotace_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.dotace
    ADD CONSTRAINT dotace_pkey PRIMARY KEY (id_dotace);


--
-- TOC entry 4616 (class 2606 OID 32855)
-- Name: ekonomika_subjekt ekonomika_subjekt_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.ekonomika_subjekt
    ADD CONSTRAINT ekonomika_subjekt_pkey PRIMARY KEY (id);


--
-- TOC entry 4512 (class 2606 OID 16640)
-- Name: etapa etapa_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.etapa
    ADD CONSTRAINT etapa_pkey PRIMARY KEY (id_etapa);


--
-- TOC entry 4618 (class 2606 OID 32863)
-- Name: osoba osoba_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.osoba
    ADD CONSTRAINT osoba_pkey PRIMARY KEY (id);


--
-- TOC entry 4514 (class 2606 OID 16786)
-- Name: prijemce_pomoci prijemce_pomoci_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.prijemce_pomoci
    ADD CONSTRAINT prijemce_pomoci_pkey PRIMARY KEY (id_prijemce);


--
-- TOC entry 4526 (class 2606 OID 16845)
-- Name: rozhodnuti rozhodnuti_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.rozhodnuti
    ADD CONSTRAINT rozhodnuti_pkey PRIMARY KEY (id_rozhodnuti);


--
-- TOC entry 4529 (class 2606 OID 17001)
-- Name: rozhodnuti_smlouva rozhodnuti_smlouva_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.rozhodnuti_smlouva
    ADD CONSTRAINT rozhodnuti_smlouva_pkey PRIMARY KEY (id_smlouva);


--
-- TOC entry 4532 (class 2606 OID 16928)
-- Name: rozpoctove_obdobi rozpoctove_obdobi_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.rozpoctove_obdobi
    ADD CONSTRAINT rozpoctove_obdobi_pkey PRIMARY KEY (id_obdobi);


--
-- TOC entry 4535 (class 2606 OID 16942)
-- Name: splatka_kalendar splatka_kalendar_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.splatka_kalendar
    ADD CONSTRAINT splatka_kalendar_pkey PRIMARY KEY (id_s_kalendar);


--
-- TOC entry 4580 (class 2606 OID 19183)
-- Name: uzemni_realizace uzemni_realizace_pkey; Type: CONSTRAINT; Schema: src_cedr; Owner: data04
--

ALTER TABLE ONLY src_cedr.uzemni_realizace
    ADD CONSTRAINT uzemni_realizace_pkey PRIMARY KEY (id_uzemi);


--
-- TOC entry 4515 (class 1259 OID 16992)
-- Name: adresa_bydliste_id_prijemce_idx; Type: INDEX; Schema: src_cedr; Owner: data04
--

CREATE INDEX adresa_bydliste_id_prijemce_idx ON src_cedr.adresa_bydliste USING btree (id_prijemce);


--
-- TOC entry 4518 (class 1259 OID 16991)
-- Name: adresa_sidlo_id_prijemce_idx; Type: INDEX; Schema: src_cedr; Owner: data04
--

CREATE INDEX adresa_sidlo_id_prijemce_idx ON src_cedr.adresa_sidlo USING btree (id_prijemce);


--
-- TOC entry 4521 (class 1259 OID 16993)
-- Name: dotace_id_prijemce_idx; Type: INDEX; Schema: src_cedr; Owner: data04
--

CREATE INDEX dotace_id_prijemce_idx ON src_cedr.dotace USING btree (id_prijemce);


--
-- TOC entry 4510 (class 1259 OID 16994)
-- Name: etapa_id_etapa_idx; Type: INDEX; Schema: src_cedr; Owner: data04
--

CREATE INDEX etapa_id_etapa_idx ON src_cedr.etapa USING btree (id_etapa);


--
-- TOC entry 4524 (class 1259 OID 16995)
-- Name: rozhodnuti_id_dotace_idx; Type: INDEX; Schema: src_cedr; Owner: data04
--

CREATE INDEX rozhodnuti_id_dotace_idx ON src_cedr.rozhodnuti USING btree (id_dotace);


--
-- TOC entry 4527 (class 1259 OID 17004)
-- Name: rozhodnuti_smlouva_id_rozhodnuti_idx; Type: INDEX; Schema: src_cedr; Owner: data04
--

CREATE INDEX rozhodnuti_smlouva_id_rozhodnuti_idx ON src_cedr.rozhodnuti_smlouva USING btree (id_rozhodnuti);


--
-- TOC entry 4530 (class 1259 OID 17005)
-- Name: rozpoctove_obdobi_id_rozhodnuti_idx; Type: INDEX; Schema: src_cedr; Owner: data04
--

CREATE INDEX rozpoctove_obdobi_id_rozhodnuti_idx ON src_cedr.rozpoctove_obdobi USING btree (id_rozhodnuti);


--
-- TOC entry 4533 (class 1259 OID 17006)
-- Name: splatka_kalendar_id_rozhodnuti_idx; Type: INDEX; Schema: src_cedr; Owner: data04
--

CREATE INDEX splatka_kalendar_id_rozhodnuti_idx ON src_cedr.splatka_kalendar USING btree (id_rozhodnuti);


--
-- TOC entry 4578 (class 1259 OID 19184)
-- Name: uzemni_realizace_id_dotace_idx; Type: INDEX; Schema: src_cedr; Owner: data04
--

CREATE INDEX uzemni_realizace_id_dotace_idx ON src_cedr.uzemni_realizace USING btree (id_dotace);


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 46
-- Name: SCHEMA src_cedr; Type: ACL; Schema: -; Owner: data04
--

GRANT ALL ON SCHEMA src_cedr TO etl;


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE adresa_bydliste; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.adresa_bydliste TO etl;


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE adresa_sidlo; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.adresa_sidlo TO etl;


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 277
-- Name: TABLE ciselnik_cedr_cinnost_type_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_cedr_cinnost_type_v01 TO etl;


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 278
-- Name: TABLE ciselnik_cedr_grantove_schema_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_cedr_grantove_schema_v01 TO etl;


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 279
-- Name: TABLE ciselnik_cedr_opatreni_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_cedr_opatreni_v01 TO etl;


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 280
-- Name: TABLE ciselnik_cedr_operacni_program_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_cedr_operacni_program_v01 TO etl;


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 281
-- Name: TABLE ciselnik_cedr_pod_opatreni_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_cedr_pod_opatreni_v01 TO etl;


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 282
-- Name: TABLE ciselnik_cedr_podprogram_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_cedr_podprogram_v01 TO etl;


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 283
-- Name: TABLE ciselnik_cedr_priorita_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_cedr_priorita_v01 TO etl;


--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 284
-- Name: TABLE ciselnik_cedr_program_podpora_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_cedr_program_podpora_v01 TO etl;


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 285
-- Name: TABLE ciselnik_dotace_poskytovatel_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_dotace_poskytovatel_v01 TO etl;


--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 286
-- Name: TABLE ciselnik_dotace_titul_rozpoctova_skladba_paragraf_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_dotace_titul_rozpoctova_skladba_paragraf_v01 TO etl;


--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 287
-- Name: TABLE ciselnik_dotace_titul_rozpoctova_skladba_polozka_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_dotace_titul_rozpoctova_skladba_polozka_v01 TO etl;


--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 288
-- Name: TABLE ciselnik_dotace_titul_statni_rozpocet_ukazatel_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_dotace_titul_statni_rozpocet_ukazatel_v01 TO etl;


--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 289
-- Name: TABLE ciselnik_dotace_titul_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_dotace_titul_v01 TO etl;


--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 290
-- Name: TABLE ciselnik_financni_prostredek_cleneni_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_financni_prostredek_cleneni_v01 TO etl;


--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 291
-- Name: TABLE ciselnik_financni_zdroj_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_financni_zdroj_v01 TO etl;


--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 469
-- Name: TABLE ciselnik_kraj_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_kraj_v01 TO etl;


--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 470
-- Name: TABLE ciselnik_mestsky_obvod_mestska_cast_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_mestsky_obvod_mestska_cast_v01 TO etl;


--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 450
-- Name: TABLE ciselnik_mmr_cinnost_type_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_mmr_cinnost_type_v01 TO etl;


--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 451
-- Name: TABLE ciselnik_mmr_grantove_schema_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_mmr_grantove_schema_v01 TO etl;


--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 452
-- Name: TABLE ciselnik_mmr_opatreni_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_mmr_opatreni_v01 TO etl;


--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 453
-- Name: TABLE ciselnik_mmr_operacni_program_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_mmr_operacni_program_v01 TO etl;


--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 454
-- Name: TABLE ciselnik_mmr_pod_opatreni_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_mmr_pod_opatreni_v01 TO etl;


--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 455
-- Name: TABLE ciselnik_mmr_podprogram_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_mmr_podprogram_v01 TO etl;


--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 456
-- Name: TABLE ciselnik_mmr_priorita_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_mmr_priorita_v01 TO etl;


--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 457
-- Name: TABLE ciselnik_mmr_program_podpora_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_mmr_program_podpora_v01 TO etl;


--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 471
-- Name: TABLE ciselnik_obec_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_obec_v01 TO etl;


--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 472
-- Name: TABLE ciselnik_okres_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_okres_v01 TO etl;


--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 467
-- Name: TABLE ciselnik_pravni_forma_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_pravni_forma_v01 TO etl;


--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 468
-- Name: TABLE ciselnik_pravni_forma_v02; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_pravni_forma_v02 TO etl;


--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 474
-- Name: TABLE ciselnik_program_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_program_v01 TO etl;


--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 292
-- Name: TABLE ciselnik_rozpoctova_skladba_paragraf_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_rozpoctova_skladba_paragraf_v01 TO etl;


--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 293
-- Name: TABLE ciselnik_rozpoctova_skladba_polozka_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_rozpoctova_skladba_polozka_v01 TO etl;


--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 466
-- Name: TABLE ciselnik_stat_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_stat_v01 TO etl;


--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 294
-- Name: TABLE ciselnik_statni_rozpocet_kapitola_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_statni_rozpocet_kapitola_v01 TO etl;


--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 295
-- Name: TABLE ciselnik_statni_rozpocet_ukazatel_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_statni_rozpocet_ukazatel_v01 TO etl;


--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 296
-- Name: TABLE ciselnik_ucel_znak_dotacni_titul_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_ucel_znak_dotacni_titul_v01 TO etl;


--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 297
-- Name: TABLE ciselnik_ucel_znak_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_ucel_znak_v01 TO etl;


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 473
-- Name: TABLE ciselnik_vusc_v01; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ciselnik_vusc_v01 TO etl;


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE dotace; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.dotace TO etl;


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 475
-- Name: TABLE ekonomika_subjekt; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.ekonomika_subjekt TO etl;


--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 242
-- Name: TABLE etapa; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.etapa TO etl;


--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 476
-- Name: TABLE osoba; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.osoba TO etl;


--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE prijemce_pomoci; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.prijemce_pomoci TO etl;


--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE rozhodnuti; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.rozhodnuti TO etl;


--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE rozhodnuti_smlouva; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.rozhodnuti_smlouva TO etl;


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE rozpoctove_obdobi; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.rozpoctove_obdobi TO etl;


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE splatka_kalendar; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.splatka_kalendar TO etl;


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 298
-- Name: TABLE uzemni_realizace; Type: ACL; Schema: src_cedr; Owner: data04
--

GRANT ALL ON TABLE src_cedr.uzemni_realizace TO etl;


-- Completed on 2020-01-10 15:40:07 UTC

--
-- PostgreSQL database dump complete
--

