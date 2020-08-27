--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3
-- Dumped by pg_dump version 12.4

-- Started on 2020-08-27 11:48:12 UTC

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
-- TOC entry 18 (class 2615 OID 17017)
-- Name: src_monitor; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA src_monitor;


--
-- TOC entry 377 (class 1259 OID 31263)
-- Name: c_aktorg; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_aktorg (
    aktorg_id character varying,
    aktorg_nazev character varying
);


--
-- TOC entry 5220 (class 0 OID 0)
-- Dependencies: 377
-- Name: TABLE c_aktorg; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.c_aktorg IS 'Číselník - Aktivní organizace';


--
-- TOC entry 393 (class 1259 OID 31363)
-- Name: c_cofog; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_cofog (
    cofog_id character varying,
    cofog_nazev character varying
);


--
-- TOC entry 379 (class 1259 OID 31283)
-- Name: c_druhrizeni; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_druhrizeni (
    druhrizeni_id character varying,
    druhrizeni_nazev character varying
);


--
-- TOC entry 383 (class 1259 OID 31303)
-- Name: c_druhuj; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_druhuj (
    druhuj_id character varying,
    druhuj_nazev character varying
);


--
-- TOC entry 381 (class 1259 OID 31293)
-- Name: c_druhukazatele; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_druhukazatele (
    druhukazatele_id character varying,
    druhukazatele_nazev character varying
);


--
-- TOC entry 385 (class 1259 OID 31313)
-- Name: c_eds; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_eds (
    eds_id character varying,
    eds_nazev character varying
);


--
-- TOC entry 387 (class 1259 OID 31323)
-- Name: c_finmisto; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_finmisto (
    finmisto_id character varying,
    end_date date,
    start_date date,
    ico character varying,
    typ_mista character varying,
    typ_organizace character varying,
    finmisto_nazev character varying,
    kapitola_id character varying
);


--
-- TOC entry 389 (class 1259 OID 31333)
-- Name: c_forma; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_forma (
    forma_id character varying,
    forma_nazev character varying
);


--
-- TOC entry 397 (class 1259 OID 31383)
-- Name: c_isektor; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_isektor (
    isektor_id character varying,
    isektor_nazev character varying
);


--
-- TOC entry 391 (class 1259 OID 31343)
-- Name: c_kapitola; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_kapitola (
    kapitola_id character varying,
    kapitola_nazev character varying,
    id_nazev character varying
);


--
-- TOC entry 602 (class 1259 OID 55814)
-- Name: c_katobyv; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_katobyv (
    katobyv_id character varying,
    nazev character varying
);


--
-- TOC entry 399 (class 1259 OID 31393)
-- Name: c_nastroj; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_nastroj (
    nastroj_id character varying,
    nastroj_nazev character varying,
    start_date date,
    end_date date
);


--
-- TOC entry 401 (class 1259 OID 31403)
-- Name: c_nastrojanal; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_nastrojanal (
    nastrojanal_id character varying,
    nastrojanal_nazev character varying
);


--
-- TOC entry 395 (class 1259 OID 31373)
-- Name: c_nuts; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_nuts (
    nuts_id character varying,
    okres character varying,
    kraj character varying,
    oblast character varying,
    nuts_nazev character varying,
    start_date date,
    end_date date
);


--
-- TOC entry 405 (class 1259 OID 31423)
-- Name: c_orp; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_orp (
    orp_id character varying,
    orp_nazev character varying
);


--
-- TOC entry 604 (class 1259 OID 55830)
-- Name: c_paragraf; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_paragraf (
    paragraf character varying,
    skupina character varying,
    oddil character varying,
    pododdil character varying,
    paragraf_nazev character varying,
    start_date date,
    end_date date
);


--
-- TOC entry 606 (class 1259 OID 55842)
-- Name: c_paragraf_long; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_paragraf_long (
    paragraf_long character varying,
    paragraf character varying,
    skupina character varying,
    oddil character varying,
    pododdil character varying,
    paragraf_nazev character varying,
    start_date date,
    end_date date
);


--
-- TOC entry 450 (class 1259 OID 31863)
-- Name: c_pocob; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_pocob (
    ico character varying,
    load_id character varying,
    pocob integer,
    katobyv_id character varying
);


--
-- TOC entry 407 (class 1259 OID 31463)
-- Name: c_poddruhuj; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_poddruhuj (
    druhuj_id character varying,
    poddruhuj_id character varying,
    poddruhuj_nazev character varying
);


--
-- TOC entry 409 (class 1259 OID 31473)
-- Name: c_podklad; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_podklad (
    podklad_id character varying,
    podklad_nazev character varying
);


--
-- TOC entry 437 (class 1259 OID 31624)
-- Name: c_polvkk; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_polvkk (
    polvkk character varying,
    polvkk_nazev character varying,
    kapitola_id character varying,
    druh_ukazatele character varying,
    start_date date,
    end_date date
);


--
-- TOC entry 411 (class 1259 OID 31483)
-- Name: c_polvyk; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_polvyk (
    vykaz character varying,
    vtab character varying,
    polvyk character varying,
    polvyk_nazev character varying,
    polvyk_order integer,
    synuc character varying,
    start_date date,
    end_date date
);


--
-- TOC entry 413 (class 1259 OID 31493)
-- Name: c_pomv; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_pomv (
    pomv_id character varying,
    pomv_nazev character varying
);


--
-- TOC entry 403 (class 1259 OID 31413)
-- Name: c_pou; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_pou (
    pou_id character varying,
    pou_nazev character varying
);


--
-- TOC entry 415 (class 1259 OID 31503)
-- Name: c_prostjedn; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_prostjedn (
    prostjedn_id character varying,
    prostjedn_nazev character varying,
    start_date date,
    end_date date
);


--
-- TOC entry 608 (class 1259 OID 55908)
-- Name: c_psuk; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_psuk (
    psuk character varying,
    psuk_nazev character varying,
    polvkk character varying,
    kapitola character varying,
    typ_ukazatele character varying,
    druh_ukazatele character varying,
    start_date date,
    end_date date,
    psuk_order integer
);


--
-- TOC entry 417 (class 1259 OID 31513)
-- Name: c_pvs; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_pvs (
    pvs_kapitola_id character varying,
    pvs character varying,
    p_prijem boolean,
    p_vydaj boolean,
    pvs_nazev character varying,
    blok character varying,
    okruh character varying,
    mnozina character varying,
    p_uct boolean,
    p_neuct boolean,
    p_spec boolean,
    kapitola_id character varying
);


--
-- TOC entry 421 (class 1259 OID 31533)
-- Name: c_rozprog; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_rozprog (
    rozprog character varying,
    rozprog_nazev character varying,
    start_date date,
    end_date date,
    rozprog_kapitola_id character varying,
    kapitola_id character varying
);


--
-- TOC entry 425 (class 1259 OID 31553)
-- Name: c_typfinmista; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_typfinmista (
    typfinmista_id character varying,
    typfinmista_nazev character varying
);


--
-- TOC entry 427 (class 1259 OID 31563)
-- Name: c_typorg; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_typorg (
    typorg_id character varying,
    typorg_nazev character varying
);


--
-- TOC entry 429 (class 1259 OID 31573)
-- Name: c_ucel; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_ucel (
    ucel_id character varying,
    start_date date,
    end_date date,
    ucel_nazev character varying
);


--
-- TOC entry 431 (class 1259 OID 31583)
-- Name: c_ucelznak; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_ucelznak (
    ucelznak_id character varying,
    ucelznak_nazev character varying,
    poskytovatel character varying,
    start_date date,
    end_date date,
    typ character varying
);


--
-- TOC entry 433 (class 1259 OID 31593)
-- Name: c_ucjed; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_ucjed (
    ico character varying,
    start_date date,
    end_date date,
    ucjed_nazev character varying,
    dic character varying,
    adresa text,
    zrizovatel_id character varying,
    nace_id character varying,
    nuts_id character varying,
    cofog_id character varying,
    isektor_id character varying,
    kapitola_id character varying,
    druhuj_id character varying,
    poddruhuj_id character varying,
    forma_id character varying,
    katobyv_id character varying,
    pocob integer,
    konecplat date,
    obec character varying,
    kraj character varying,
    datumvzniku date,
    datumakt date,
    aktorg_id character varying,
    ulice character varying,
    sidlo character varying,
    psc character varying,
    druhrizeni_id character varying,
    stat_id character varying,
    typorg_id character varying,
    zdrojfin_id character varying,
    zpodm_id character varying,
    veduc_id character varying,
    ico_obec_pou character varying,
    ico_obec_rp character varying,
    ico_lau1 character varying,
    csuis_ucjed_id character varying
);


--
-- TOC entry 423 (class 1259 OID 31543)
-- Name: c_uctosnova; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_uctosnova (
    vykaz character varying,
    vtab character varying,
    polvyk character varying,
    polvyk_nazev character varying,
    polvyk_order integer,
    synuc character varying,
    start_date date,
    end_date date
);


--
-- TOC entry 447 (class 1259 OID 31783)
-- Name: c_veduc; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_veduc (
    veduc_id character varying,
    veduc_nazev character varying
);


--
-- TOC entry 600 (class 1259 OID 55804)
-- Name: c_vykaz; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_vykaz (
    vykaz character varying,
    vykaz_tabulka character varying,
    vykaz_nazev character varying
);


--
-- TOC entry 439 (class 1259 OID 31644)
-- Name: c_zazjedn; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_zazjedn (
    zazjedn_id character varying,
    zazjedn_nazev character varying
);


--
-- TOC entry 441 (class 1259 OID 31654)
-- Name: c_zdroj; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_zdroj (
    zdroj_id character varying,
    start_date date,
    end_date date,
    prostjedn_id character varying,
    nastroj_id character varying,
    podklad_id character varying,
    nastrojanal_id character varying,
    zdroj_nazev character varying
);


--
-- TOC entry 443 (class 1259 OID 31664)
-- Name: c_zdrojfin; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_zdrojfin (
    zdrojfin_id character varying,
    zdrojfin_nazev character varying
);


--
-- TOC entry 445 (class 1259 OID 31674)
-- Name: c_zpodm; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_zpodm (
    zpodm_id character varying,
    zpodm_nazev character varying
);


--
-- TOC entry 435 (class 1259 OID 31614)
-- Name: c_zuj; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_zuj (
    zuj_id character varying,
    zuj_nazev character varying
);


--
-- TOC entry 276 (class 1259 OID 18293)
-- Name: finm201; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.finm201 (
    year smallint NOT NULL,
    month smallint NOT NULL,
    zc_vykaz character varying NOT NULL,
    zc_vtab character varying NOT NULL,
    fiscper character varying NOT NULL,
    zc_ucjed character varying NOT NULL,
    zc_ico character varying NOT NULL,
    zc_kraj character varying NOT NULL,
    zc_nuts character varying NOT NULL,
    ci_type character varying NOT NULL,
    func_area character varying NOT NULL,
    zcmmt_itm character varying NOT NULL,
    zu_rozsch numeric(14,2),
    zu_rozpzm numeric(14,2),
    zu_rozkz numeric(14,2)
);


--
-- TOC entry 5221 (class 0 OID 0)
-- Dependencies: 276
-- Name: TABLE finm201; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.finm201 IS 'FIN 2-12 M - Plnění rozpočtu MŘO - FINM201';


--
-- TOC entry 5222 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN finm201.zc_vykaz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm201.zc_vykaz IS 'Výkaz';


--
-- TOC entry 5223 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN finm201.zc_vtab; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm201.zc_vtab IS 'Tabulka výkazu - část I. a II. výkazu';


--
-- TOC entry 5224 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN finm201.fiscper; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm201.fiscper IS 'Fiskál.rok/období';


--
-- TOC entry 5225 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN finm201.zc_ucjed; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm201.zc_ucjed IS 'Číslo účetní jednotky';


--
-- TOC entry 5226 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN finm201.zc_ico; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm201.zc_ico IS 'IČ';


--
-- TOC entry 5227 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN finm201.zc_kraj; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm201.zc_kraj IS 'NUTS kraje /regionu';


--
-- TOC entry 5228 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN finm201.zc_nuts; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm201.zc_nuts IS 'NUTS účetní jednotky';


--
-- TOC entry 5229 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN finm201.ci_type; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm201.ci_type IS 'Typ rozpočtové položky';


--
-- TOC entry 5230 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN finm201.func_area; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm201.func_area IS 'Paragraf';


--
-- TOC entry 5231 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN finm201.zcmmt_itm; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm201.zcmmt_itm IS 'Položka';


--
-- TOC entry 5232 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN finm201.zu_rozsch; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm201.zu_rozsch IS 'Schválený rozpočet';


--
-- TOC entry 5233 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN finm201.zu_rozpzm; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm201.zu_rozpzm IS 'Rozpočet po změnách';


--
-- TOC entry 5234 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN finm201.zu_rozkz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm201.zu_rozkz IS 'Výsledek od počátku roku';


--
-- TOC entry 277 (class 1259 OID 18301)
-- Name: finm202; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.finm202 (
    year smallint NOT NULL,
    month smallint NOT NULL,
    zc_vykaz character varying NOT NULL,
    zc_vtab character varying NOT NULL,
    fiscper character varying NOT NULL,
    zc_ucjed character varying NOT NULL,
    zc_ico character varying NOT NULL,
    zc_kraj character varying NOT NULL,
    zc_nuts character varying NOT NULL,
    zc_polvyk character varying NOT NULL,
    zu_rozsch numeric(14,2),
    zu_rozpzm numeric(14,2),
    zu_rozkz numeric(14,2)
);


--
-- TOC entry 5235 (class 0 OID 0)
-- Dependencies: 277
-- Name: TABLE finm202; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.finm202 IS 'FIN 2-12 M - Plnění rozpočtu MŘO - FINM202';


--
-- TOC entry 5236 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN finm202.zc_vykaz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm202.zc_vykaz IS 'Výkaz';


--
-- TOC entry 5237 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN finm202.zc_vtab; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm202.zc_vtab IS 'Tabulka výkazu - část III. výkazu';


--
-- TOC entry 5238 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN finm202.fiscper; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm202.fiscper IS 'Fiskál.rok/období';


--
-- TOC entry 5239 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN finm202.zc_ucjed; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm202.zc_ucjed IS 'Číslo účetní jednotky';


--
-- TOC entry 5240 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN finm202.zc_ico; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm202.zc_ico IS 'IČ';


--
-- TOC entry 5241 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN finm202.zc_kraj; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm202.zc_kraj IS 'NUTS kraje /regionu';


--
-- TOC entry 5242 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN finm202.zc_nuts; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm202.zc_nuts IS 'NUTS účetní jednotky';


--
-- TOC entry 5243 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN finm202.zc_polvyk; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm202.zc_polvyk IS 'Položka výkazu';


--
-- TOC entry 5244 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN finm202.zu_rozsch; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm202.zu_rozsch IS 'Schválený rozpočet';


--
-- TOC entry 5245 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN finm202.zu_rozpzm; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm202.zu_rozpzm IS 'Rozpočet po změnách';


--
-- TOC entry 5246 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN finm202.zu_rozkz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm202.zu_rozkz IS 'Výsledek od počátku roku';


--
-- TOC entry 278 (class 1259 OID 18309)
-- Name: finm203; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.finm203 (
    year smallint NOT NULL,
    month smallint NOT NULL,
    zc_vykaz character varying NOT NULL,
    zc_vtab character varying NOT NULL,
    fiscper character varying NOT NULL,
    zc_ucjed character varying NOT NULL,
    zc_ico character varying NOT NULL,
    zc_kraj character varying NOT NULL,
    zc_nuts character varying NOT NULL,
    zc_polvyk character varying NOT NULL,
    zu_rozsch numeric(14,2),
    zu_rozpzm numeric(14,2),
    zu_rozkz numeric(14,2)
);


--
-- TOC entry 5247 (class 0 OID 0)
-- Dependencies: 278
-- Name: TABLE finm203; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.finm203 IS 'FIN 2-12 M - Plnění rozpočtu MŘO - FINM203';


--
-- TOC entry 5248 (class 0 OID 0)
-- Dependencies: 278
-- Name: COLUMN finm203.zc_vykaz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm203.zc_vykaz IS 'Výkaz';


--
-- TOC entry 5249 (class 0 OID 0)
-- Dependencies: 278
-- Name: COLUMN finm203.zc_vtab; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm203.zc_vtab IS 'Tabulka výkazu - část IV. výkazu';


--
-- TOC entry 5250 (class 0 OID 0)
-- Dependencies: 278
-- Name: COLUMN finm203.fiscper; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm203.fiscper IS 'Fiskál.rok/období';


--
-- TOC entry 5251 (class 0 OID 0)
-- Dependencies: 278
-- Name: COLUMN finm203.zc_ucjed; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm203.zc_ucjed IS 'Číslo účetní jednotky';


--
-- TOC entry 5252 (class 0 OID 0)
-- Dependencies: 278
-- Name: COLUMN finm203.zc_ico; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm203.zc_ico IS 'IČ';


--
-- TOC entry 5253 (class 0 OID 0)
-- Dependencies: 278
-- Name: COLUMN finm203.zc_kraj; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm203.zc_kraj IS 'NUTS kraje /regionu';


--
-- TOC entry 5254 (class 0 OID 0)
-- Dependencies: 278
-- Name: COLUMN finm203.zc_nuts; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm203.zc_nuts IS 'NUTS účetní jednotky';


--
-- TOC entry 5255 (class 0 OID 0)
-- Dependencies: 278
-- Name: COLUMN finm203.zc_polvyk; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm203.zc_polvyk IS 'Položka výkazu';


--
-- TOC entry 5256 (class 0 OID 0)
-- Dependencies: 278
-- Name: COLUMN finm203.zu_rozsch; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm203.zu_rozsch IS 'Schválený rozpočet';


--
-- TOC entry 5257 (class 0 OID 0)
-- Dependencies: 278
-- Name: COLUMN finm203.zu_rozpzm; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm203.zu_rozpzm IS 'Rozpočet po změnách';


--
-- TOC entry 5258 (class 0 OID 0)
-- Dependencies: 278
-- Name: COLUMN finm203.zu_rozkz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm203.zu_rozkz IS 'Výsledek od počátku roku';


--
-- TOC entry 279 (class 1259 OID 18317)
-- Name: finm204; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.finm204 (
    year smallint NOT NULL,
    month smallint NOT NULL,
    zc_vykaz character varying NOT NULL,
    zc_vtab character varying NOT NULL,
    fiscper character varying NOT NULL,
    zc_ucjed character varying NOT NULL,
    zc_ico character varying NOT NULL,
    zc_kraj character varying NOT NULL,
    zc_nuts character varying NOT NULL,
    zc_buce character varying NOT NULL,
    zu_pz numeric(14,2),
    zu_aktz numeric(14,2),
    zu_zmest numeric(14,2)
);


--
-- TOC entry 5259 (class 0 OID 0)
-- Dependencies: 279
-- Name: TABLE finm204; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.finm204 IS 'FIN 2-12 M - Plnění rozpočtu MŘO - FINM204';


--
-- TOC entry 5260 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN finm204.zc_vykaz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm204.zc_vykaz IS 'Výkaz';


--
-- TOC entry 5261 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN finm204.zc_vtab; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm204.zc_vtab IS 'Tabulka výkazu - část VI. výkazu';


--
-- TOC entry 5262 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN finm204.fiscper; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm204.fiscper IS 'Fiskál.rok/období';


--
-- TOC entry 5263 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN finm204.zc_ucjed; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm204.zc_ucjed IS 'Číslo účetní jednotky';


--
-- TOC entry 5264 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN finm204.zc_ico; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm204.zc_ico IS 'IČ';


--
-- TOC entry 5265 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN finm204.zc_kraj; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm204.zc_kraj IS 'NUTS kraje /regionu';


--
-- TOC entry 5266 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN finm204.zc_nuts; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm204.zc_nuts IS 'NUTS účetní jednotky';


--
-- TOC entry 5267 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN finm204.zc_buce; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm204.zc_buce IS 'Bankovní účet (číslo řádku)';


--
-- TOC entry 5268 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN finm204.zu_pz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm204.zu_pz IS 'Počáteční stav k 1.1.';


--
-- TOC entry 5269 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN finm204.zu_aktz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm204.zu_aktz IS 'Stav ke konci vykazovaného období';


--
-- TOC entry 5270 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN finm204.zu_zmest; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm204.zu_zmest IS 'Změna stavu BÚ';


--
-- TOC entry 280 (class 1259 OID 18325)
-- Name: finm205; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.finm205 (
    year smallint NOT NULL,
    month smallint NOT NULL,
    zc_vykaz character varying NOT NULL,
    zc_vtab character varying NOT NULL,
    fiscper character varying NOT NULL,
    zc_ucjed character varying NOT NULL,
    zc_ico character varying NOT NULL,
    zc_kraj character varying NOT NULL,
    zc_nuts character varying NOT NULL,
    zc_polvyk character varying NOT NULL,
    zu_rozsch numeric(14,2),
    zu_rozpzm numeric(14,2),
    zu_rozkz numeric(14,2)
);


--
-- TOC entry 5271 (class 0 OID 0)
-- Dependencies: 280
-- Name: TABLE finm205; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.finm205 IS 'FIN 2-12 M - Plnění rozpočtu MŘO - FINM205';


--
-- TOC entry 5272 (class 0 OID 0)
-- Dependencies: 280
-- Name: COLUMN finm205.zc_vykaz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm205.zc_vykaz IS 'Výkaz';


--
-- TOC entry 5273 (class 0 OID 0)
-- Dependencies: 280
-- Name: COLUMN finm205.zc_vtab; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm205.zc_vtab IS 'Tabulka výkazu - část VII. výkazu';


--
-- TOC entry 5274 (class 0 OID 0)
-- Dependencies: 280
-- Name: COLUMN finm205.fiscper; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm205.fiscper IS 'Fiskál.rok/období';


--
-- TOC entry 5275 (class 0 OID 0)
-- Dependencies: 280
-- Name: COLUMN finm205.zc_ucjed; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm205.zc_ucjed IS 'Číslo účetní jednotky';


--
-- TOC entry 5276 (class 0 OID 0)
-- Dependencies: 280
-- Name: COLUMN finm205.zc_ico; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm205.zc_ico IS 'IČ';


--
-- TOC entry 5277 (class 0 OID 0)
-- Dependencies: 280
-- Name: COLUMN finm205.zc_kraj; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm205.zc_kraj IS 'NUTS kraje /regionu';


--
-- TOC entry 5278 (class 0 OID 0)
-- Dependencies: 280
-- Name: COLUMN finm205.zc_nuts; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm205.zc_nuts IS 'NUTS účetní jednotky';


--
-- TOC entry 5279 (class 0 OID 0)
-- Dependencies: 280
-- Name: COLUMN finm205.zc_polvyk; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm205.zc_polvyk IS 'Položka výkazu';


--
-- TOC entry 5280 (class 0 OID 0)
-- Dependencies: 280
-- Name: COLUMN finm205.zu_rozsch; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm205.zu_rozsch IS 'Schválený rozpočet';


--
-- TOC entry 5281 (class 0 OID 0)
-- Dependencies: 280
-- Name: COLUMN finm205.zu_rozpzm; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm205.zu_rozpzm IS 'Rozpočet po změnách';


--
-- TOC entry 5282 (class 0 OID 0)
-- Dependencies: 280
-- Name: COLUMN finm205.zu_rozkz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm205.zu_rozkz IS 'Výsledek od počátku roku';


--
-- TOC entry 281 (class 1259 OID 18333)
-- Name: finm207; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.finm207 (
    year smallint NOT NULL,
    month smallint NOT NULL,
    zc_vykaz character varying NOT NULL,
    zc_vtab character varying NOT NULL,
    fiscper character varying NOT NULL,
    zc_ucjed character varying NOT NULL,
    zc_ico character varying NOT NULL,
    zc_kraj character varying NOT NULL,
    zc_nuts character varying NOT NULL,
    zc_zreuz character varying NOT NULL,
    zc_lau character varying NOT NULL,
    zcmmt_itm character varying NOT NULL,
    zu_rozkzm numeric(14,2)
);


--
-- TOC entry 5283 (class 0 OID 0)
-- Dependencies: 281
-- Name: TABLE finm207; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.finm207 IS 'FIN 2-12 M - Plnění rozpočtu MŘO - FINM207';


--
-- TOC entry 5284 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN finm207.zc_vykaz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm207.zc_vykaz IS 'Výkaz';


--
-- TOC entry 5285 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN finm207.zc_vtab; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm207.zc_vtab IS 'Tabulka výkazu - část IX. a X.. výkazu';


--
-- TOC entry 5286 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN finm207.fiscper; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm207.fiscper IS 'Fiskál.rok/období';


--
-- TOC entry 5287 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN finm207.zc_ucjed; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm207.zc_ucjed IS 'Číslo účetní jednotky';


--
-- TOC entry 5288 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN finm207.zc_ico; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm207.zc_ico IS 'IČ';


--
-- TOC entry 5289 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN finm207.zc_kraj; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm207.zc_kraj IS 'NUTS kraje /regionu';


--
-- TOC entry 5290 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN finm207.zc_nuts; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm207.zc_nuts IS 'NUTS účetní jednotky';


--
-- TOC entry 5291 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN finm207.zc_zreuz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm207.zc_zreuz IS 'Účelový znak';


--
-- TOC entry 5292 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN finm207.zc_lau; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm207.zc_lau IS 'Územní jednotka příjemce dotace ';


--
-- TOC entry 5293 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN finm207.zcmmt_itm; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm207.zcmmt_itm IS 'Položka';


--
-- TOC entry 5294 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN finm207.zu_rozkzm; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finm207.zu_rozkzm IS 'Výsledek od počátku roku';


--
-- TOC entry 290 (class 1259 OID 18405)
-- Name: finsf01; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.finsf01 (
    year smallint NOT NULL,
    month smallint NOT NULL,
    zc_vykaz character varying NOT NULL,
    zc_vtab character varying NOT NULL,
    fiscper character varying NOT NULL,
    zc_ucjed character varying NOT NULL,
    zc_ico character varying NOT NULL,
    fm_area character varying NOT NULL,
    ci_type character varying NOT NULL,
    func_area character varying NOT NULL,
    zcmmt_itm character varying NOT NULL,
    zu_rozsch numeric(14,2),
    zu_rozpzm numeric(14,2),
    zu_rozkz numeric(14,2)
);


--
-- TOC entry 5295 (class 0 OID 0)
-- Dependencies: 290
-- Name: TABLE finsf01; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.finsf01 IS 'FIN 1-12 SF - Plnění rozpočtu SF - Část I a II';


--
-- TOC entry 5296 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN finsf01.zc_vykaz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf01.zc_vykaz IS 'Výkaz';


--
-- TOC entry 5297 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN finsf01.zc_vtab; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf01.zc_vtab IS 'Tabulka výkazu - část I. a II. výkazu';


--
-- TOC entry 5298 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN finsf01.fiscper; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf01.fiscper IS 'Fiskál.rok/období';


--
-- TOC entry 5299 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN finsf01.zc_ucjed; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf01.zc_ucjed IS 'Číslo účetní jednotky';


--
-- TOC entry 5300 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN finsf01.zc_ico; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf01.zc_ico IS 'IČ';


--
-- TOC entry 5301 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN finsf01.fm_area; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf01.fm_area IS 'Kapitola';


--
-- TOC entry 5302 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN finsf01.ci_type; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf01.ci_type IS 'Typ rozpočtové položky';


--
-- TOC entry 5303 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN finsf01.func_area; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf01.func_area IS 'Paragraf';


--
-- TOC entry 5304 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN finsf01.zcmmt_itm; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf01.zcmmt_itm IS 'Položka';


--
-- TOC entry 5305 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN finsf01.zu_rozsch; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf01.zu_rozsch IS 'Schválený rozpočet';


--
-- TOC entry 5306 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN finsf01.zu_rozpzm; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf01.zu_rozpzm IS 'Rozpočet po změnách';


--
-- TOC entry 5307 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN finsf01.zu_rozkz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf01.zu_rozkz IS 'Výsledek od počátku roku';


--
-- TOC entry 291 (class 1259 OID 18413)
-- Name: finsf02; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.finsf02 (
    year smallint NOT NULL,
    month smallint NOT NULL,
    zc_vykaz character varying NOT NULL,
    zc_vtab character varying NOT NULL,
    fiscper character varying NOT NULL,
    zc_ucjed character varying NOT NULL,
    zc_ico character varying NOT NULL,
    fm_area character varying NOT NULL,
    zc_polvyk character varying NOT NULL,
    zu_rozsch numeric(14,2),
    zu_rozpzm numeric(14,2),
    zu_rozkz numeric(14,2)
);


--
-- TOC entry 5308 (class 0 OID 0)
-- Dependencies: 291
-- Name: TABLE finsf02; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.finsf02 IS 'FIN 1-12 SF - Plnění rozpočtu SF - Část III';


--
-- TOC entry 5309 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN finsf02.zc_vykaz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf02.zc_vykaz IS 'Výkaz';


--
-- TOC entry 5310 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN finsf02.zc_vtab; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf02.zc_vtab IS 'Tabulka výkazu - část III. výkazu';


--
-- TOC entry 5311 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN finsf02.fiscper; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf02.fiscper IS 'Fiskál.rok/období';


--
-- TOC entry 5312 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN finsf02.zc_ucjed; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf02.zc_ucjed IS 'Číslo účetní jednotky';


--
-- TOC entry 5313 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN finsf02.zc_ico; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf02.zc_ico IS 'IČ';


--
-- TOC entry 5314 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN finsf02.fm_area; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf02.fm_area IS 'Kapitola';


--
-- TOC entry 5315 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN finsf02.zc_polvyk; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf02.zc_polvyk IS 'Položka výkazu';


--
-- TOC entry 5316 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN finsf02.zu_rozsch; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf02.zu_rozsch IS 'Schválený rozpočet';


--
-- TOC entry 5317 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN finsf02.zu_rozpzm; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf02.zu_rozpzm IS 'Rozpočet po změnách';


--
-- TOC entry 5318 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN finsf02.zu_rozkz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf02.zu_rozkz IS 'Výsledek od počátku roku';


--
-- TOC entry 292 (class 1259 OID 18421)
-- Name: finsf03; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.finsf03 (
    year smallint NOT NULL,
    month smallint NOT NULL,
    zc_vykaz character varying NOT NULL,
    zc_vtab character varying NOT NULL,
    fiscper character varying NOT NULL,
    zc_ucjed character varying NOT NULL,
    zc_ico character varying NOT NULL,
    fm_area character varying NOT NULL,
    zc_buce character varying NOT NULL,
    zu_pz numeric(14,2),
    zu_akzt numeric(14,2),
    zu_zmest numeric(14,2)
);


--
-- TOC entry 5319 (class 0 OID 0)
-- Dependencies: 292
-- Name: TABLE finsf03; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.finsf03 IS 'FIN 1-12 SF - Plnění rozpočtu SF - Část IV';


--
-- TOC entry 5320 (class 0 OID 0)
-- Dependencies: 292
-- Name: COLUMN finsf03.zc_vykaz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf03.zc_vykaz IS 'Výkaz';


--
-- TOC entry 5321 (class 0 OID 0)
-- Dependencies: 292
-- Name: COLUMN finsf03.zc_vtab; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf03.zc_vtab IS 'Tabulka výkazu - část IV. výkazu';


--
-- TOC entry 5322 (class 0 OID 0)
-- Dependencies: 292
-- Name: COLUMN finsf03.fiscper; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf03.fiscper IS 'Fiskál.rok/období';


--
-- TOC entry 5323 (class 0 OID 0)
-- Dependencies: 292
-- Name: COLUMN finsf03.zc_ucjed; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf03.zc_ucjed IS 'Číslo účetní jednotky';


--
-- TOC entry 5324 (class 0 OID 0)
-- Dependencies: 292
-- Name: COLUMN finsf03.zc_ico; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf03.zc_ico IS 'IČ';


--
-- TOC entry 5325 (class 0 OID 0)
-- Dependencies: 292
-- Name: COLUMN finsf03.fm_area; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf03.fm_area IS 'Kapitola';


--
-- TOC entry 5326 (class 0 OID 0)
-- Dependencies: 292
-- Name: COLUMN finsf03.zc_buce; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf03.zc_buce IS 'Bankovní účet (číslo řádku)';


--
-- TOC entry 5327 (class 0 OID 0)
-- Dependencies: 292
-- Name: COLUMN finsf03.zu_pz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf03.zu_pz IS 'Počáteční stav k 1.1.';


--
-- TOC entry 5328 (class 0 OID 0)
-- Dependencies: 292
-- Name: COLUMN finsf03.zu_akzt; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf03.zu_akzt IS 'Stav ke konci vykazovaného období';


--
-- TOC entry 5329 (class 0 OID 0)
-- Dependencies: 292
-- Name: COLUMN finsf03.zu_zmest; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf03.zu_zmest IS 'Změna stavu BÚ';


--
-- TOC entry 295 (class 1259 OID 18508)
-- Name: finsf04; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.finsf04 (
    year smallint NOT NULL,
    month smallint NOT NULL,
    zc_vykaz character varying NOT NULL,
    zc_vtab character varying NOT NULL,
    fiscper character varying NOT NULL,
    zc_ucjed character varying NOT NULL,
    zc_ico character varying NOT NULL,
    fm_area character varying NOT NULL,
    zc_zreuz character varying NOT NULL,
    zc_lau character varying NOT NULL,
    zcmmt_itm character varying NOT NULL,
    zu_rozkz numeric(14,2)
);


--
-- TOC entry 5330 (class 0 OID 0)
-- Dependencies: 295
-- Name: TABLE finsf04; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.finsf04 IS 'FIN 1-12 SF - Plnění rozpočtu SF - Část IX';


--
-- TOC entry 5331 (class 0 OID 0)
-- Dependencies: 295
-- Name: COLUMN finsf04.zc_vykaz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf04.zc_vykaz IS 'Výkaz';


--
-- TOC entry 5332 (class 0 OID 0)
-- Dependencies: 295
-- Name: COLUMN finsf04.zc_vtab; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf04.zc_vtab IS 'Tabulka výkazu - část IX. výkazu';


--
-- TOC entry 5333 (class 0 OID 0)
-- Dependencies: 295
-- Name: COLUMN finsf04.fiscper; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf04.fiscper IS 'Fiskál.rok/období';


--
-- TOC entry 5334 (class 0 OID 0)
-- Dependencies: 295
-- Name: COLUMN finsf04.zc_ucjed; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf04.zc_ucjed IS 'Číslo účetní jednotky';


--
-- TOC entry 5335 (class 0 OID 0)
-- Dependencies: 295
-- Name: COLUMN finsf04.zc_ico; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf04.zc_ico IS 'IČ';


--
-- TOC entry 5336 (class 0 OID 0)
-- Dependencies: 295
-- Name: COLUMN finsf04.fm_area; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf04.fm_area IS 'Kapitola';


--
-- TOC entry 5337 (class 0 OID 0)
-- Dependencies: 295
-- Name: COLUMN finsf04.zc_zreuz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf04.zc_zreuz IS 'Účelový znak';


--
-- TOC entry 5338 (class 0 OID 0)
-- Dependencies: 295
-- Name: COLUMN finsf04.zc_lau; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf04.zc_lau IS 'Územní jednotka příjemce dotace';


--
-- TOC entry 5339 (class 0 OID 0)
-- Dependencies: 295
-- Name: COLUMN finsf04.zcmmt_itm; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf04.zcmmt_itm IS 'Položka';


--
-- TOC entry 5340 (class 0 OID 0)
-- Dependencies: 295
-- Name: COLUMN finsf04.zu_rozkz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finsf04.zu_rozkz IS 'Výsledek od počátku roku';


--
-- TOC entry 282 (class 1259 OID 18341)
-- Name: finu101; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.finu101 (
    year smallint NOT NULL,
    month smallint NOT NULL,
    zc_vykaz character varying NOT NULL,
    zc_vtab character varying NOT NULL,
    fiscper character varying NOT NULL,
    zc_ucjed character varying NOT NULL,
    zc_ico character varying NOT NULL,
    fm_area character varying NOT NULL,
    ci_type character varying NOT NULL,
    func_area character varying NOT NULL,
    zcmmt_itm character varying NOT NULL,
    zu_rozsch numeric(14,2),
    zu_rozpzm numeric(14,2),
    zu_krozp numeric(14,2),
    zu_rozkz numeric(14,2)
);


--
-- TOC entry 5341 (class 0 OID 0)
-- Dependencies: 282
-- Name: TABLE finu101; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.finu101 IS 'FIN 2-04 U - Plnění rozpočtu KAP, OSS a SF (2010 - 2014) - FINU101';


--
-- TOC entry 5342 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN finu101.zc_vykaz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu101.zc_vykaz IS 'Výkaz';


--
-- TOC entry 5343 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN finu101.zc_vtab; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu101.zc_vtab IS 'Tabulka výkazu - část I. a II. výkazu';


--
-- TOC entry 5344 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN finu101.fiscper; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu101.fiscper IS 'Fiskál.rok/období';


--
-- TOC entry 5345 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN finu101.zc_ucjed; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu101.zc_ucjed IS 'Číslo účetní jednotky';


--
-- TOC entry 5346 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN finu101.zc_ico; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu101.zc_ico IS 'IČ';


--
-- TOC entry 5347 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN finu101.fm_area; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu101.fm_area IS 'Kapitola';


--
-- TOC entry 5348 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN finu101.ci_type; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu101.ci_type IS 'Typ rozpočtové položky';


--
-- TOC entry 5349 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN finu101.func_area; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu101.func_area IS 'Paragraf';


--
-- TOC entry 5350 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN finu101.zcmmt_itm; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu101.zcmmt_itm IS 'Položka';


--
-- TOC entry 5351 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN finu101.zu_rozsch; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu101.zu_rozsch IS 'Schválený rozpočet';


--
-- TOC entry 5352 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN finu101.zu_rozpzm; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu101.zu_rozpzm IS 'Rozpočet po změnách';


--
-- TOC entry 5353 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN finu101.zu_krozp; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu101.zu_krozp IS 'Konečný rozpočet';


--
-- TOC entry 5354 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN finu101.zu_rozkz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu101.zu_rozkz IS 'Výsledek od počátku roku';


--
-- TOC entry 283 (class 1259 OID 18349)
-- Name: finu102; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.finu102 (
    year smallint NOT NULL,
    month smallint NOT NULL,
    zc_vykaz character varying NOT NULL,
    zc_vtab character varying NOT NULL,
    fiscper character varying NOT NULL,
    zc_ucjed character varying NOT NULL,
    zc_ico character varying NOT NULL,
    fm_area character varying NOT NULL,
    zc_polvyk character varying NOT NULL,
    zu_rozsch numeric(14,2),
    zu_rozpzm numeric(14,2),
    zu_krozp numeric(14,2),
    zu_rozkz numeric(14,2)
);


--
-- TOC entry 5355 (class 0 OID 0)
-- Dependencies: 283
-- Name: TABLE finu102; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.finu102 IS 'FIN 2-04 U - Plnění rozpočtu KAP, OSS a SF (2010 - 2014) - FINU102';


--
-- TOC entry 5356 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN finu102.zc_vykaz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu102.zc_vykaz IS 'Výkaz';


--
-- TOC entry 5357 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN finu102.zc_vtab; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu102.zc_vtab IS 'Tabulka výkazu - část III. výkazu';


--
-- TOC entry 5358 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN finu102.fiscper; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu102.fiscper IS 'Fiskál.rok/období';


--
-- TOC entry 5359 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN finu102.zc_ucjed; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu102.zc_ucjed IS 'Číslo účetní jednotky';


--
-- TOC entry 5360 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN finu102.zc_ico; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu102.zc_ico IS 'IČ';


--
-- TOC entry 5361 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN finu102.fm_area; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu102.fm_area IS 'Kapitola';


--
-- TOC entry 5362 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN finu102.zc_polvyk; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu102.zc_polvyk IS 'Položka výkazu';


--
-- TOC entry 5363 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN finu102.zu_rozsch; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu102.zu_rozsch IS 'Schválený rozpočet';


--
-- TOC entry 5364 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN finu102.zu_rozpzm; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu102.zu_rozpzm IS 'Rozpočet po změnách';


--
-- TOC entry 5365 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN finu102.zu_krozp; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu102.zu_krozp IS 'Konečný rozpočet';


--
-- TOC entry 5366 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN finu102.zu_rozkz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu102.zu_rozkz IS 'Výsledek od počátku roku';


--
-- TOC entry 284 (class 1259 OID 18357)
-- Name: finu103; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.finu103 (
    year smallint NOT NULL,
    month smallint NOT NULL,
    zc_vykaz character varying NOT NULL,
    zc_vtab character varying NOT NULL,
    fiscper character varying NOT NULL,
    zc_ucjed character varying NOT NULL,
    zc_ico character varying NOT NULL,
    fm_area character varying NOT NULL,
    zc_buce character varying NOT NULL,
    zu_pz numeric(14,2),
    zu_akzt numeric(14,2),
    zu_zmest numeric(14,2)
);


--
-- TOC entry 5367 (class 0 OID 0)
-- Dependencies: 284
-- Name: TABLE finu103; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.finu103 IS 'FIN 2-04 U - Plnění rozpočtu KAP, OSS a SF (2010 - 2014) - FINU103';


--
-- TOC entry 5368 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN finu103.zc_vykaz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu103.zc_vykaz IS 'Výkaz';


--
-- TOC entry 5369 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN finu103.zc_vtab; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu103.zc_vtab IS 'Tabulka výkazu - část IV. výkazu';


--
-- TOC entry 5370 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN finu103.fiscper; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu103.fiscper IS 'Fiskál.rok/období';


--
-- TOC entry 5371 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN finu103.zc_ucjed; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu103.zc_ucjed IS 'Číslo účetní jednotky';


--
-- TOC entry 5372 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN finu103.zc_ico; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu103.zc_ico IS 'IČ';


--
-- TOC entry 5373 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN finu103.fm_area; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu103.fm_area IS 'Kapitola';


--
-- TOC entry 5374 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN finu103.zc_buce; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu103.zc_buce IS 'Bankovní účet (číslo řádku)';


--
-- TOC entry 5375 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN finu103.zu_pz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu103.zu_pz IS 'Počáteční stav k 1.1.';


--
-- TOC entry 5376 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN finu103.zu_akzt; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu103.zu_akzt IS 'Stav ke konci vykazovaného období';


--
-- TOC entry 5377 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN finu103.zu_zmest; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu103.zu_zmest IS 'Změna stavu BÚ';


--
-- TOC entry 285 (class 1259 OID 18365)
-- Name: finu104; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.finu104 (
    year smallint NOT NULL,
    month smallint NOT NULL,
    zc_vykaz character varying NOT NULL,
    zc_vtab character varying NOT NULL,
    fiscper character varying NOT NULL,
    zc_ucjed character varying NOT NULL,
    zc_ico character varying NOT NULL,
    fm_area character varying NOT NULL,
    func_area character varying NOT NULL,
    zc_polvyk character varying NOT NULL,
    zc_pomv character varying NOT NULL,
    zu_rozkz numeric(14,2)
);


--
-- TOC entry 5378 (class 0 OID 0)
-- Dependencies: 285
-- Name: TABLE finu104; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.finu104 IS 'FIN 2-04 U - Plnění rozpočtu KAP, OSS a SF (2010 - 2014) - FINU104';


--
-- TOC entry 5379 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN finu104.zc_vykaz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu104.zc_vykaz IS 'Výkaz';


--
-- TOC entry 5380 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN finu104.zc_vtab; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu104.zc_vtab IS 'Tabulka výkazu - část V. výkazu';


--
-- TOC entry 5381 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN finu104.fiscper; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu104.fiscper IS 'Fiskál.rok/období';


--
-- TOC entry 5382 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN finu104.zc_ucjed; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu104.zc_ucjed IS 'Číslo účetní jednotky';


--
-- TOC entry 5383 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN finu104.zc_ico; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu104.zc_ico IS 'IČ';


--
-- TOC entry 5384 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN finu104.fm_area; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu104.fm_area IS 'Kapitola';


--
-- TOC entry 5385 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN finu104.func_area; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu104.func_area IS 'Paragraf';


--
-- TOC entry 5386 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN finu104.zc_polvyk; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu104.zc_polvyk IS 'Položka výkazu';


--
-- TOC entry 5387 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN finu104.zc_pomv; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu104.zc_pomv IS 'Číslo řádku s názvem - pomocný údaj';


--
-- TOC entry 5388 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN finu104.zu_rozkz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu104.zu_rozkz IS 'Výsledek od počátku roku';


--
-- TOC entry 286 (class 1259 OID 18373)
-- Name: finu105; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.finu105 (
    year smallint NOT NULL,
    month smallint NOT NULL,
    zc_vykaz character varying NOT NULL,
    zc_vtab character varying NOT NULL,
    fiscper character varying NOT NULL,
    zc_ucjed character varying NOT NULL,
    zc_ico character varying NOT NULL,
    fm_area character varying NOT NULL,
    zc_polvyk character varying NOT NULL,
    zu_rozkz numeric(14,2)
);


--
-- TOC entry 5389 (class 0 OID 0)
-- Dependencies: 286
-- Name: TABLE finu105; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.finu105 IS 'FIN 2-04 U - Plnění rozpočtu KAP, OSS a SF (2010 - 2014) - FINU105';


--
-- TOC entry 5390 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN finu105.zc_vykaz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu105.zc_vykaz IS 'Výkaz';


--
-- TOC entry 5391 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN finu105.zc_vtab; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu105.zc_vtab IS 'Tabulka výkazu - část VI. výkazu';


--
-- TOC entry 5392 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN finu105.fiscper; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu105.fiscper IS 'Fiskál.rok/období';


--
-- TOC entry 5393 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN finu105.zc_ucjed; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu105.zc_ucjed IS 'Číslo účetní jednotky';


--
-- TOC entry 5394 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN finu105.zc_ico; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu105.zc_ico IS 'IČ';


--
-- TOC entry 5395 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN finu105.fm_area; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu105.fm_area IS 'Kapitola';


--
-- TOC entry 5396 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN finu105.zc_polvyk; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu105.zc_polvyk IS 'Položka výkazu';


--
-- TOC entry 5397 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN finu105.zu_rozkz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu105.zu_rozkz IS 'Výsledek od počátku roku';


--
-- TOC entry 287 (class 1259 OID 18381)
-- Name: finu106; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.finu106 (
    year smallint NOT NULL,
    month smallint NOT NULL,
    zc_vykaz character varying NOT NULL,
    zc_vtab character varying NOT NULL,
    fiscper character varying NOT NULL,
    zc_ucjed character varying NOT NULL,
    zc_ico character varying NOT NULL,
    fm_area character varying NOT NULL,
    zc_polvkk character varying NOT NULL,
    zu_rozsch numeric(14,2),
    zu_rozpzm numeric(14,2),
    zu_krozp numeric(14,2),
    zu_rozkz numeric(14,2),
    zu_rozmr numeric(14,2),
    zu_pouzna numeric(14,2),
    zu_prevpr numeric(14,2)
);


--
-- TOC entry 5398 (class 0 OID 0)
-- Dependencies: 287
-- Name: TABLE finu106; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.finu106 IS 'FIN 2-04 U - Plnění rozpočtu KAP, OSS a SF (2010 - 2014) - FINU106';


--
-- TOC entry 5399 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN finu106.zc_vykaz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu106.zc_vykaz IS 'Výkaz';


--
-- TOC entry 5400 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN finu106.zc_vtab; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu106.zc_vtab IS 'Tabulka výkazu - část VII. výkazu';


--
-- TOC entry 5401 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN finu106.fiscper; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu106.fiscper IS 'Fiskál.rok/období';


--
-- TOC entry 5402 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN finu106.zc_ucjed; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu106.zc_ucjed IS 'Číslo účetní jednotky';


--
-- TOC entry 5403 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN finu106.zc_ico; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu106.zc_ico IS 'IČ';


--
-- TOC entry 5404 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN finu106.fm_area; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu106.fm_area IS 'Kapitola';


--
-- TOC entry 5405 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN finu106.zc_polvkk; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu106.zc_polvkk IS 'Položka výkazu';


--
-- TOC entry 5406 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN finu106.zu_rozsch; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu106.zu_rozsch IS 'Schválený rozpočet';


--
-- TOC entry 5407 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN finu106.zu_rozpzm; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu106.zu_rozpzm IS 'Rozpočet po změnách';


--
-- TOC entry 5408 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN finu106.zu_krozp; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu106.zu_krozp IS 'Konečný rozpočet';


--
-- TOC entry 5409 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN finu106.zu_rozkz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu106.zu_rozkz IS 'Výsledek od počátku roku';


--
-- TOC entry 5410 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN finu106.zu_rozmr; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu106.zu_rozmr IS 'Mimorozpočtové prostředky';


--
-- TOC entry 5411 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN finu106.zu_pouzna; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu106.zu_pouzna IS 'Použití nároků ';


--
-- TOC entry 5412 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN finu106.zu_prevpr; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu106.zu_prevpr IS 'Převod prostředků do rezervního fondu';


--
-- TOC entry 288 (class 1259 OID 18389)
-- Name: finu107; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.finu107 (
    year smallint NOT NULL,
    month smallint NOT NULL,
    zc_vykaz character varying NOT NULL,
    zc_vtab character varying NOT NULL,
    fiscper character varying NOT NULL,
    zc_ucjed character varying NOT NULL,
    zc_ico character varying NOT NULL,
    fm_area character varying NOT NULL,
    pu_measure character varying NOT NULL,
    zcmmt_itm character varying NOT NULL,
    zu_rozsch numeric(14,2),
    zu_rozpzm numeric(14,2),
    zu_krozp numeric(14,2),
    zu_rozkz numeric(14,2)
);


--
-- TOC entry 5413 (class 0 OID 0)
-- Dependencies: 288
-- Name: TABLE finu107; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.finu107 IS 'FIN 2-04 U - Plnění rozpočtu KAP, OSS a SF (2010 - 2014) - FINU107';


--
-- TOC entry 5414 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN finu107.zc_vykaz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu107.zc_vykaz IS 'Výkaz';


--
-- TOC entry 5415 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN finu107.zc_vtab; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu107.zc_vtab IS 'Tabulka výkazu - část VIII. výkazu';


--
-- TOC entry 5416 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN finu107.fiscper; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu107.fiscper IS 'Fiskál.rok/období';


--
-- TOC entry 5417 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN finu107.zc_ucjed; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu107.zc_ucjed IS 'Číslo účetní jednotky';


--
-- TOC entry 5418 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN finu107.zc_ico; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu107.zc_ico IS 'IČ';


--
-- TOC entry 5419 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN finu107.fm_area; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu107.fm_area IS 'Kapitola';


--
-- TOC entry 5420 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN finu107.pu_measure; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu107.pu_measure IS 'Rozpočtový program';


--
-- TOC entry 5421 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN finu107.zcmmt_itm; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu107.zcmmt_itm IS 'Položka';


--
-- TOC entry 5422 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN finu107.zu_rozsch; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu107.zu_rozsch IS 'Schválený rozpočet';


--
-- TOC entry 5423 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN finu107.zu_rozpzm; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu107.zu_rozpzm IS 'Rozpočet po změnách';


--
-- TOC entry 5424 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN finu107.zu_krozp; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu107.zu_krozp IS 'Konečný rozpočet';


--
-- TOC entry 5425 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN finu107.zu_rozkz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu107.zu_rozkz IS 'Výsledek od počátku roku';


--
-- TOC entry 289 (class 1259 OID 18397)
-- Name: finu108; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.finu108 (
    year smallint NOT NULL,
    month smallint NOT NULL,
    zc_vykaz character varying NOT NULL,
    zc_vtab character varying NOT NULL,
    fiscper character varying NOT NULL,
    zc_ucjed character varying NOT NULL,
    zc_ico character varying NOT NULL,
    fm_area character varying NOT NULL,
    zc_zreuz character varying NOT NULL,
    zc_lau character varying NOT NULL,
    zcmmt_itm character varying NOT NULL,
    zu_rozkz numeric(14,2)
);


--
-- TOC entry 5426 (class 0 OID 0)
-- Dependencies: 289
-- Name: TABLE finu108; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.finu108 IS 'FIN 2-04 U - Plnění rozpočtu KAP, OSS a SF (2010 - 2014) - FINU108';


--
-- TOC entry 5427 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN finu108.zc_vykaz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu108.zc_vykaz IS 'Výkaz';


--
-- TOC entry 5428 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN finu108.zc_vtab; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu108.zc_vtab IS 'Tabulka výkazu - část IX. výkazu';


--
-- TOC entry 5429 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN finu108.fiscper; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu108.fiscper IS 'Fiskál.rok/období';


--
-- TOC entry 5430 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN finu108.zc_ucjed; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu108.zc_ucjed IS 'Číslo účetní jednotky';


--
-- TOC entry 5431 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN finu108.zc_ico; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu108.zc_ico IS 'IČ';


--
-- TOC entry 5432 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN finu108.fm_area; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu108.fm_area IS 'Kapitola';


--
-- TOC entry 5433 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN finu108.zc_zreuz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu108.zc_zreuz IS 'Účelový znak';


--
-- TOC entry 5434 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN finu108.zc_lau; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu108.zc_lau IS 'Územní jednotka příjemce dotace';


--
-- TOC entry 5435 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN finu108.zcmmt_itm; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu108.zcmmt_itm IS 'Položka';


--
-- TOC entry 5436 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN finu108.zu_rozkz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.finu108.zu_rozkz IS 'Výsledek od počátku roku';


--
-- TOC entry 293 (class 1259 OID 18429)
-- Name: mis_ris; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.mis_ris (
    year smallint NOT NULL,
    month smallint NOT NULL,
    fiscper character varying NOT NULL,
    zc_ucjed character varying NOT NULL,
    zc_ico character varying NOT NULL,
    fm_area character varying NOT NULL,
    zfunds_ct character varying NOT NULL,
    zcmmt_itm character varying NOT NULL,
    func_area character varying NOT NULL,
    zc_fund character varying NOT NULL,
    zc_eds character varying NOT NULL,
    zc_ucris character varying NOT NULL,
    zc_pvs character varying NOT NULL,
    zu_rozsch numeric(14,2),
    zu_rozpzm numeric(14,2),
    zu_krozp numeric(14,2),
    zu_oblig numeric(14,2),
    zu_rozkz numeric(14,2)
);


--
-- TOC entry 5437 (class 0 OID 0)
-- Dependencies: 293
-- Name: TABLE mis_ris; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.mis_ris IS 'FIN 1-12 OSS - Plnění rozpočtu KAP a OSS - MIS_RIS';


--
-- TOC entry 5438 (class 0 OID 0)
-- Dependencies: 293
-- Name: COLUMN mis_ris.fiscper; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris.fiscper IS 'Fiskál.rok/období';


--
-- TOC entry 5439 (class 0 OID 0)
-- Dependencies: 293
-- Name: COLUMN mis_ris.zc_ucjed; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris.zc_ucjed IS 'Číslo účetní jednotky';


--
-- TOC entry 5440 (class 0 OID 0)
-- Dependencies: 293
-- Name: COLUMN mis_ris.zc_ico; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris.zc_ico IS 'IČ';


--
-- TOC entry 5441 (class 0 OID 0)
-- Dependencies: 293
-- Name: COLUMN mis_ris.fm_area; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris.fm_area IS 'Kapitola';


--
-- TOC entry 5442 (class 0 OID 0)
-- Dependencies: 293
-- Name: COLUMN mis_ris.zfunds_ct; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris.zfunds_ct IS 'Finanční místo';


--
-- TOC entry 5443 (class 0 OID 0)
-- Dependencies: 293
-- Name: COLUMN mis_ris.zcmmt_itm; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris.zcmmt_itm IS 'Položka';


--
-- TOC entry 5444 (class 0 OID 0)
-- Dependencies: 293
-- Name: COLUMN mis_ris.func_area; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris.func_area IS 'Paragraf';


--
-- TOC entry 5445 (class 0 OID 0)
-- Dependencies: 293
-- Name: COLUMN mis_ris.zc_fund; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris.zc_fund IS 'Zdroj';


--
-- TOC entry 5446 (class 0 OID 0)
-- Dependencies: 293
-- Name: COLUMN mis_ris.zc_eds; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris.zc_eds IS 'EDS/SMVS';


--
-- TOC entry 5447 (class 0 OID 0)
-- Dependencies: 293
-- Name: COLUMN mis_ris.zc_ucris; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris.zc_ucris IS 'Účel';


--
-- TOC entry 5448 (class 0 OID 0)
-- Dependencies: 293
-- Name: COLUMN mis_ris.zc_pvs; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris.zc_pvs IS 'PVS';


--
-- TOC entry 5449 (class 0 OID 0)
-- Dependencies: 293
-- Name: COLUMN mis_ris.zu_rozsch; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris.zu_rozsch IS 'Schválený rozpočet';


--
-- TOC entry 5450 (class 0 OID 0)
-- Dependencies: 293
-- Name: COLUMN mis_ris.zu_rozpzm; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris.zu_rozpzm IS 'Rozpočet po změnách';


--
-- TOC entry 5451 (class 0 OID 0)
-- Dependencies: 293
-- Name: COLUMN mis_ris.zu_krozp; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris.zu_krozp IS 'Schválený rozpočet';


--
-- TOC entry 5452 (class 0 OID 0)
-- Dependencies: 293
-- Name: COLUMN mis_ris.zu_oblig; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris.zu_oblig IS 'Rozpočet po změnách';


--
-- TOC entry 5453 (class 0 OID 0)
-- Dependencies: 293
-- Name: COLUMN mis_ris.zu_rozkz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris.zu_rozkz IS 'Výsledek od počátku roku';


--
-- TOC entry 294 (class 1259 OID 18437)
-- Name: mis_ris_zu; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.mis_ris_zu (
    year smallint NOT NULL,
    month smallint NOT NULL,
    fiscper character varying NOT NULL,
    zc_ucjed character varying NOT NULL,
    zc_ico character varying NOT NULL,
    fm_area character varying NOT NULL,
    zfunds_ct character varying NOT NULL,
    zc_psuk character varying NOT NULL,
    zc_polvk2 character varying NOT NULL,
    zu_rozsch numeric(14,2),
    zu_rozpzm numeric(14,2),
    zu_krozp numeric(14,2),
    zu_oblig numeric(14,2),
    zu_rozkz numeric(14,2)
);


--
-- TOC entry 5454 (class 0 OID 0)
-- Dependencies: 294
-- Name: TABLE mis_ris_zu; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.mis_ris_zu IS 'FIN 1-12 OSS - Plnění rozpočtu KAP a OSS - MIS_RIS_ZU';


--
-- TOC entry 5455 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN mis_ris_zu.fiscper; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris_zu.fiscper IS 'Fiskál.rok/období';


--
-- TOC entry 5456 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN mis_ris_zu.zc_ucjed; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris_zu.zc_ucjed IS 'Číslo účetní jednotky';


--
-- TOC entry 5457 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN mis_ris_zu.zc_ico; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris_zu.zc_ico IS 'IČ';


--
-- TOC entry 5458 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN mis_ris_zu.fm_area; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris_zu.fm_area IS 'Kapitola';


--
-- TOC entry 5459 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN mis_ris_zu.zfunds_ct; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris_zu.zfunds_ct IS 'Finanční místo';


--
-- TOC entry 5460 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN mis_ris_zu.zc_psuk; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris_zu.zc_psuk IS 'Pruřezový a specifický ukazatel';


--
-- TOC entry 5461 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN mis_ris_zu.zc_polvk2; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris_zu.zc_polvk2 IS 'Kapitola - položka';


--
-- TOC entry 5462 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN mis_ris_zu.zu_rozsch; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris_zu.zu_rozsch IS 'Schválený rozpočet';


--
-- TOC entry 5463 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN mis_ris_zu.zu_rozpzm; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris_zu.zu_rozpzm IS 'Rozpočet po změnách';


--
-- TOC entry 5464 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN mis_ris_zu.zu_krozp; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris_zu.zu_krozp IS 'Schválený rozpočet';


--
-- TOC entry 5465 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN mis_ris_zu.zu_oblig; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris_zu.zu_oblig IS 'Rozpočet po změnách';


--
-- TOC entry 5466 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN mis_ris_zu.zu_rozkz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.mis_ris_zu.zu_rozkz IS 'Výsledek od počátku roku';


--
-- TOC entry 419 (class 1259 OID 31523)
-- Name: c_polozka; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.c_polozka (
    polozka character varying,
    start_date date,
    end_date date,
    trida character varying,
    seskupeni character varying,
    podseskupeni character varying,
    nazev character varying
);


--
-- TOC entry 369 (class 1259 OID 24588)
-- Name: rozv; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.rozv (
    year smallint NOT NULL,
    month smallint NOT NULL,
    zc_vykaz character varying NOT NULL,
    zc_vtab character varying NOT NULL,
    fiscper character varying NOT NULL,
    zc_ucjed character varying NOT NULL,
    zc_ico character varying NOT NULL,
    fm_area character varying NOT NULL,
    zc_kraj character varying NOT NULL,
    zc_nuts character varying NOT NULL,
    zc_polvyk character varying NOT NULL,
    zc_synuc character varying NOT NULL,
    zu_aobtto numeric(17,2),
    zu_aokorr numeric(17,2),
    zu_aonet numeric(17,2),
    zu_monet numeric(17,2)
);


--
-- TOC entry 5467 (class 0 OID 0)
-- Dependencies: 369
-- Name: TABLE rozv; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.rozv IS 'Rozvaha do roku 2013';


--
-- TOC entry 5468 (class 0 OID 0)
-- Dependencies: 369
-- Name: COLUMN rozv.year; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.rozv.year IS 'Rok datové sady';


--
-- TOC entry 5469 (class 0 OID 0)
-- Dependencies: 369
-- Name: COLUMN rozv.month; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.rozv.month IS 'Měsíc datové sady';


--
-- TOC entry 5470 (class 0 OID 0)
-- Dependencies: 369
-- Name: COLUMN rozv.zc_vykaz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.rozv.zc_vykaz IS 'Výkaz';


--
-- TOC entry 5471 (class 0 OID 0)
-- Dependencies: 369
-- Name: COLUMN rozv.zc_vtab; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.rozv.zc_vtab IS 'Tabulka výkazu';


--
-- TOC entry 5472 (class 0 OID 0)
-- Dependencies: 369
-- Name: COLUMN rozv.fiscper; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.rozv.fiscper IS 'Fiskál.rok/období';


--
-- TOC entry 5473 (class 0 OID 0)
-- Dependencies: 369
-- Name: COLUMN rozv.zc_ucjed; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.rozv.zc_ucjed IS 'Číslo účetní jednotky';


--
-- TOC entry 5474 (class 0 OID 0)
-- Dependencies: 369
-- Name: COLUMN rozv.zc_ico; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.rozv.zc_ico IS 'IČO';


--
-- TOC entry 5475 (class 0 OID 0)
-- Dependencies: 369
-- Name: COLUMN rozv.fm_area; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.rozv.fm_area IS 'Kapitola';


--
-- TOC entry 5476 (class 0 OID 0)
-- Dependencies: 369
-- Name: COLUMN rozv.zc_kraj; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.rozv.zc_kraj IS 'Kraj';


--
-- TOC entry 5477 (class 0 OID 0)
-- Dependencies: 369
-- Name: COLUMN rozv.zc_nuts; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.rozv.zc_nuts IS 'NUTS  účetní jednotky';


--
-- TOC entry 5478 (class 0 OID 0)
-- Dependencies: 369
-- Name: COLUMN rozv.zc_polvyk; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.rozv.zc_polvyk IS 'Položka výkazu';


--
-- TOC entry 5479 (class 0 OID 0)
-- Dependencies: 369
-- Name: COLUMN rozv.zc_synuc; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.rozv.zc_synuc IS 'Syntetický účet';


--
-- TOC entry 5480 (class 0 OID 0)
-- Dependencies: 369
-- Name: COLUMN rozv.zu_aobtto; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.rozv.zu_aobtto IS 'Brutto - běžné období';


--
-- TOC entry 5481 (class 0 OID 0)
-- Dependencies: 369
-- Name: COLUMN rozv.zu_aokorr; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.rozv.zu_aokorr IS 'Korekce - běžné období';


--
-- TOC entry 5482 (class 0 OID 0)
-- Dependencies: 369
-- Name: COLUMN rozv.zu_aonet; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.rozv.zu_aonet IS 'Netto - běžné období';


--
-- TOC entry 5483 (class 0 OID 0)
-- Dependencies: 369
-- Name: COLUMN rozv.zu_monet; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.rozv.zu_monet IS 'Netto - minulé období';


--
-- TOC entry 539 (class 1259 OID 50206)
-- Name: vykzz; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.vykzz (
    year integer,
    month integer,
    zc_vykaz character varying,
    zc_vtab character varying,
    fiscper character varying,
    zc_ucjed character varying,
    zc_ico character varying,
    fm_area character varying,
    zc_kraj character varying,
    zc_nuts character varying,
    zc_polvyk character varying,
    zc_synuc character varying,
    zu_hlcibo numeric(17,2),
    zu_hcinbo numeric(17,2),
    zu_hlcin numeric(17,2),
    zu_hoscin numeric(17,2)
);


--
-- TOC entry 5484 (class 0 OID 0)
-- Dependencies: 539
-- Name: TABLE vykzz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON TABLE src_monitor.vykzz IS 'Výkaz zisku a ztráty';


--
-- TOC entry 5485 (class 0 OID 0)
-- Dependencies: 539
-- Name: COLUMN vykzz.zc_vykaz; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.vykzz.zc_vykaz IS 'Výkaz';


--
-- TOC entry 5486 (class 0 OID 0)
-- Dependencies: 539
-- Name: COLUMN vykzz.zc_vtab; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.vykzz.zc_vtab IS 'Tabulka výkazu';


--
-- TOC entry 5487 (class 0 OID 0)
-- Dependencies: 539
-- Name: COLUMN vykzz.fiscper; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.vykzz.fiscper IS 'Fiskál.rok/období';


--
-- TOC entry 5488 (class 0 OID 0)
-- Dependencies: 539
-- Name: COLUMN vykzz.zc_ucjed; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.vykzz.zc_ucjed IS 'Číslo účetní jednotky';


--
-- TOC entry 5489 (class 0 OID 0)
-- Dependencies: 539
-- Name: COLUMN vykzz.zc_ico; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.vykzz.zc_ico IS 'IČO';


--
-- TOC entry 5490 (class 0 OID 0)
-- Dependencies: 539
-- Name: COLUMN vykzz.fm_area; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.vykzz.fm_area IS 'Kapitola';


--
-- TOC entry 5491 (class 0 OID 0)
-- Dependencies: 539
-- Name: COLUMN vykzz.zc_kraj; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.vykzz.zc_kraj IS 'Kraj';


--
-- TOC entry 5492 (class 0 OID 0)
-- Dependencies: 539
-- Name: COLUMN vykzz.zc_nuts; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.vykzz.zc_nuts IS 'NUTS  účetní jednotky';


--
-- TOC entry 5493 (class 0 OID 0)
-- Dependencies: 539
-- Name: COLUMN vykzz.zc_polvyk; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.vykzz.zc_polvyk IS 'Položka výkazu';


--
-- TOC entry 5494 (class 0 OID 0)
-- Dependencies: 539
-- Name: COLUMN vykzz.zc_synuc; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.vykzz.zc_synuc IS 'Syntetický účet';


--
-- TOC entry 5495 (class 0 OID 0)
-- Dependencies: 539
-- Name: COLUMN vykzz.zu_hlcibo; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.vykzz.zu_hlcibo IS 'Hlavní činnost - běžné období';


--
-- TOC entry 5496 (class 0 OID 0)
-- Dependencies: 539
-- Name: COLUMN vykzz.zu_hcinbo; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.vykzz.zu_hcinbo IS 'Hospodářská činnost - běžné období';


--
-- TOC entry 5497 (class 0 OID 0)
-- Dependencies: 539
-- Name: COLUMN vykzz.zu_hlcin; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.vykzz.zu_hlcin IS 'Hlavní činnost - minulé období';


--
-- TOC entry 5498 (class 0 OID 0)
-- Dependencies: 539
-- Name: COLUMN vykzz.zu_hoscin; Type: COMMENT; Schema: src_monitor; Owner: -
--

COMMENT ON COLUMN src_monitor.vykzz.zu_hoscin IS 'Hospodářská činnost - minulé období';


--
-- TOC entry 520 (class 1259 OID 35727)
-- Name: etl; Type: TABLE; Schema: src_monitor; Owner: -
--

CREATE TABLE src_monitor.etl (
    name character varying NOT NULL,
    etag character varying
);


--
-- TOC entry 4916 (class 2606 OID 35734)
-- Name: etl etl_pkey; Type: CONSTRAINT; Schema: src_monitor; Owner: -
--

ALTER TABLE ONLY src_monitor.etl
    ADD CONSTRAINT etl_pkey PRIMARY KEY (name);


--
-- TOC entry 4884 (class 2606 OID 18324)
-- Name: finm204 finm204_pkey; Type: CONSTRAINT; Schema: src_monitor; Owner: -
--

ALTER TABLE ONLY src_monitor.finm204
    ADD CONSTRAINT finm204_pkey PRIMARY KEY (year, month, zc_vykaz, zc_vtab, fiscper, zc_ucjed, zc_ico, zc_kraj, zc_nuts, zc_buce);


--
-- TOC entry 4886 (class 2606 OID 18340)
-- Name: finm207 finm207_pkey; Type: CONSTRAINT; Schema: src_monitor; Owner: -
--

ALTER TABLE ONLY src_monitor.finm207
    ADD CONSTRAINT finm207_pkey PRIMARY KEY (year, month, zc_vykaz, zc_vtab, fiscper, zc_ucjed, zc_ico, zc_kraj, zc_nuts, zc_zreuz, zc_lau, zcmmt_itm);


--
-- TOC entry 4904 (class 2606 OID 18412)
-- Name: finsf01 finsf01_pkey; Type: CONSTRAINT; Schema: src_monitor; Owner: -
--

ALTER TABLE ONLY src_monitor.finsf01
    ADD CONSTRAINT finsf01_pkey PRIMARY KEY (year, month, zc_vykaz, zc_vtab, fiscper, zc_ucjed, zc_ico, fm_area, ci_type, func_area, zcmmt_itm);


--
-- TOC entry 4906 (class 2606 OID 18420)
-- Name: finsf02 finsf02_pkey; Type: CONSTRAINT; Schema: src_monitor; Owner: -
--

ALTER TABLE ONLY src_monitor.finsf02
    ADD CONSTRAINT finsf02_pkey PRIMARY KEY (year, month, zc_vykaz, zc_vtab, fiscper, zc_ucjed, zc_ico, fm_area, zc_polvyk);


--
-- TOC entry 4908 (class 2606 OID 18428)
-- Name: finsf03 finsf03_pkey; Type: CONSTRAINT; Schema: src_monitor; Owner: -
--

ALTER TABLE ONLY src_monitor.finsf03
    ADD CONSTRAINT finsf03_pkey PRIMARY KEY (year, month, zc_vykaz, zc_vtab, fiscper, zc_ucjed, zc_ico, fm_area, zc_buce);


--
-- TOC entry 4912 (class 2606 OID 18515)
-- Name: finsf04 finsf04_pkey; Type: CONSTRAINT; Schema: src_monitor; Owner: -
--

ALTER TABLE ONLY src_monitor.finsf04
    ADD CONSTRAINT finsf04_pkey PRIMARY KEY (year, month, zc_vykaz, zc_vtab, fiscper, zc_ucjed, zc_ico, fm_area, zc_zreuz, zc_lau, zcmmt_itm);


--
-- TOC entry 4888 (class 2606 OID 18348)
-- Name: finu101 finu101_pkey; Type: CONSTRAINT; Schema: src_monitor; Owner: -
--

ALTER TABLE ONLY src_monitor.finu101
    ADD CONSTRAINT finu101_pkey PRIMARY KEY (year, month, zc_vykaz, zc_vtab, fiscper, zc_ucjed, zc_ico, fm_area, ci_type, func_area, zcmmt_itm);


--
-- TOC entry 4890 (class 2606 OID 18356)
-- Name: finu102 finu102_pkey; Type: CONSTRAINT; Schema: src_monitor; Owner: -
--

ALTER TABLE ONLY src_monitor.finu102
    ADD CONSTRAINT finu102_pkey PRIMARY KEY (year, month, zc_vykaz, zc_vtab, fiscper, zc_ucjed, zc_ico, fm_area, zc_polvyk);


--
-- TOC entry 4892 (class 2606 OID 18364)
-- Name: finu103 finu103_pkey; Type: CONSTRAINT; Schema: src_monitor; Owner: -
--

ALTER TABLE ONLY src_monitor.finu103
    ADD CONSTRAINT finu103_pkey PRIMARY KEY (year, month, zc_vykaz, zc_vtab, fiscper, zc_ucjed, zc_ico, fm_area, zc_buce);


--
-- TOC entry 4894 (class 2606 OID 18372)
-- Name: finu104 finu104_pkey; Type: CONSTRAINT; Schema: src_monitor; Owner: -
--

ALTER TABLE ONLY src_monitor.finu104
    ADD CONSTRAINT finu104_pkey PRIMARY KEY (year, month, zc_vykaz, zc_vtab, fiscper, zc_ucjed, zc_ico, fm_area, func_area, zc_polvyk, zc_pomv);


--
-- TOC entry 4896 (class 2606 OID 18380)
-- Name: finu105 finu105_pkey; Type: CONSTRAINT; Schema: src_monitor; Owner: -
--

ALTER TABLE ONLY src_monitor.finu105
    ADD CONSTRAINT finu105_pkey PRIMARY KEY (year, month, zc_vykaz, zc_vtab, fiscper, zc_ucjed, zc_ico, fm_area, zc_polvyk);


--
-- TOC entry 4898 (class 2606 OID 18388)
-- Name: finu106 finu106_pkey; Type: CONSTRAINT; Schema: src_monitor; Owner: -
--

ALTER TABLE ONLY src_monitor.finu106
    ADD CONSTRAINT finu106_pkey PRIMARY KEY (year, month, zc_vykaz, zc_vtab, fiscper, zc_ucjed, zc_ico, fm_area, zc_polvkk);


--
-- TOC entry 4900 (class 2606 OID 18396)
-- Name: finu107 finu107_pkey; Type: CONSTRAINT; Schema: src_monitor; Owner: -
--

ALTER TABLE ONLY src_monitor.finu107
    ADD CONSTRAINT finu107_pkey PRIMARY KEY (year, month, zc_vykaz, zc_vtab, fiscper, zc_ucjed, zc_ico, fm_area, pu_measure, zcmmt_itm);


--
-- TOC entry 4902 (class 2606 OID 18404)
-- Name: finu108 finu108_pkey; Type: CONSTRAINT; Schema: src_monitor; Owner: -
--

ALTER TABLE ONLY src_monitor.finu108
    ADD CONSTRAINT finu108_pkey PRIMARY KEY (year, month, zc_vykaz, zc_vtab, fiscper, zc_ucjed, zc_ico, fm_area, zc_zreuz, zc_lau, zcmmt_itm);


--
-- TOC entry 4910 (class 2606 OID 18444)
-- Name: mis_ris_zu mis_ris_zu_pkey; Type: CONSTRAINT; Schema: src_monitor; Owner: -
--

ALTER TABLE ONLY src_monitor.mis_ris_zu
    ADD CONSTRAINT mis_ris_zu_pkey PRIMARY KEY (year, month, fiscper, zc_ucjed, zc_ico, fm_area, zfunds_ct, zc_psuk, zc_polvk2);


--
-- TOC entry 4913 (class 1259 OID 24597)
-- Name: ico_rozv; Type: INDEX; Schema: src_monitor; Owner: -
--

CREATE INDEX ico_rozv ON src_monitor.rozv USING btree (zc_ico);


--
-- TOC entry 4917 (class 1259 OID 50214)
-- Name: vykzz_year_month_idx; Type: INDEX; Schema: src_monitor; Owner: -
--

CREATE INDEX vykzz_year_month_idx ON src_monitor.vykzz USING btree (year, month);


--
-- TOC entry 4918 (class 1259 OID 50213)
-- Name: vykzz_zc_ico_idx; Type: INDEX; Schema: src_monitor; Owner: -
--

CREATE INDEX vykzz_zc_ico_idx ON src_monitor.vykzz USING btree (zc_ico);


--
-- TOC entry 4882 (class 1259 OID 18516)
-- Name: year; Type: INDEX; Schema: src_monitor; Owner: -
--

CREATE INDEX year ON src_monitor.finm201 USING btree (year DESC NULLS LAST, month);


--
-- TOC entry 4914 (class 1259 OID 32279)
-- Name: year_month; Type: INDEX; Schema: src_monitor; Owner: -
--

CREATE INDEX year_month ON src_monitor.rozv USING btree (year, month);


-- Completed on 2020-08-27 11:48:13 UTC

--
-- PostgreSQL database dump complete
--

