--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3
-- Dumped by pg_dump version 12.0

-- Started on 2020-01-31 17:02:24 UTC

--
-- TOC entry 54 (class 2615 OID 33001)
-- Name: src_smlouvy; Type: SCHEMA; Schema: -; Owner: data04
--

CREATE SCHEMA src_smlouvy;

SET default_tablespace = '';

--
-- TOC entry 491 (class 1259 OID 33140)
-- Name: index; Type: TABLE; Schema: src_smlouvy; Owner: data04
--

CREATE TABLE src_smlouvy.etl (
    id_dumpu character(7) NOT NULL,
    mesic smallint,
    rok smallint,
    hash_dumpu character varying NOT NULL,
    cas_generovani timestamp without time zone NOT NULL,
    dokonceny_mesic boolean NOT NULL,
    velikost_dumpu integer NOT NULL,
    odkaz character varying NOT NULL
);

--
-- TOC entry 493 (class 1259 OID 33306)
-- Name: priloha; Type: TABLE; Schema: src_smlouvy; Owner: data04
--

CREATE TABLE src_smlouvy.priloha (
    id_dumpu character(7) NOT NULL,
    id_verze integer NOT NULL,
    nazev_souboru character varying NOT NULL,
    hash character varying,
    odkaz character varying
);

--
-- TOC entry 494 (class 1259 OID 33313)
-- Name: smlouva; Type: TABLE; Schema: src_smlouvy; Owner: data04
--

CREATE TABLE src_smlouvy.smlouva (
    id_dumpu character(7) NOT NULL,
    id_verze integer NOT NULL,
    id_smlouvy integer NOT NULL,
    odkaz character varying NOT NULL,
    cas_zverejneni timestamp without time zone,
    predmet character varying NOT NULL,
    datum_uzavreni date NOT NULL,
    cislo_smlouvy character varying,
    schvalil character varying,
    hodnota_bez_dph numeric(18,2) DEFAULT NULL::numeric,
    hodnota_vcetne_dph numeric(18,2) DEFAULT NULL::numeric,
    cizi_mena character varying,
    cizi_mena_hodnota numeric(18,2) DEFAULT NULL::numeric,
    navazany_zaznam integer,
    platny_zaznam boolean DEFAULT false NOT NULL
);

--
-- TOC entry 492 (class 1259 OID 33283)
-- Name: smluvni_strana; Type: TABLE; Schema: src_smlouvy; Owner: data04
--

CREATE TABLE src_smlouvy.smluvni_strana (
    id_dumpu character(7) NOT NULL,
    id_verze integer NOT NULL,
    subjekt boolean NOT NULL,
    datova_schranka character varying,
    nazev character varying,
    ico character varying,
    adresa character varying,
    utvar character varying,
    platce boolean,
    prijemce boolean
);

--
-- TOC entry 4504 (class 2606 OID 33149)
-- Name: index index_pkey; Type: CONSTRAINT; Schema: src_smlouvy; Owner: data04
--

ALTER TABLE ONLY src_smlouvy.index
    ADD CONSTRAINT etl_pkey PRIMARY KEY (id_dumpu);


--
-- TOC entry 4512 (class 2606 OID 33324)
-- Name: smlouva smlouva_pkey; Type: CONSTRAINT; Schema: src_smlouvy; Owner: data04
--

ALTER TABLE ONLY src_smlouvy.smlouva
    ADD CONSTRAINT smlouva_pkey PRIMARY KEY (id_verze);


--
-- TOC entry 4509 (class 1259 OID 33312)
-- Name: priloha_id_verze_idx; Type: INDEX; Schema: src_smlouvy; Owner: data04
--

CREATE INDEX priloha_id_verze_idx ON src_smlouvy.priloha USING btree (id_verze);


--
-- TOC entry 4510 (class 1259 OID 33325)
-- Name: smlouva_dumpu_idx; Type: INDEX; Schema: src_smlouvy; Owner: data04
--

CREATE INDEX smlouva_dumpu_idx ON src_smlouvy.smlouva USING btree (id_dumpu);


--
-- TOC entry 4505 (class 1259 OID 33305)
-- Name: smlouva_id_dumpu_idx; Type: INDEX; Schema: src_smlouvy; Owner: data04
--

CREATE INDEX smlouva_id_dumpu_idx ON src_smlouvy.smluvni_strana USING btree (id_dumpu);


--
-- TOC entry 4506 (class 1259 OID 33291)
-- Name: smluvni_strana_ico_idx; Type: INDEX; Schema: src_smlouvy; Owner: data04
--

CREATE INDEX smluvni_strana_ico_idx ON src_smlouvy.smluvni_strana USING btree (ico);


--
-- TOC entry 4507 (class 1259 OID 33289)
-- Name: smluvni_strana_id_dumpu_idx; Type: INDEX; Schema: src_smlouvy; Owner: data04
--

CREATE INDEX smluvni_strana_id_dumpu_idx ON src_smlouvy.smluvni_strana USING btree (id_dumpu);


--
-- TOC entry 4508 (class 1259 OID 33290)
-- Name: smluvni_strana_id_verze_idx; Type: INDEX; Schema: src_smlouvy; Owner: data04
--

CREATE INDEX smluvni_strana_id_verze_idx ON src_smlouvy.smluvni_strana USING btree (id_verze);


-- Completed on 2020-01-31 17:02:24 UTC

--
-- PostgreSQL database dump complete
--

