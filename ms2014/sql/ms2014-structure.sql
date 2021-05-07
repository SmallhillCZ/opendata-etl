--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3
-- Dumped by pg_dump version 13.2

-- Started on 2021-05-07 14:10:35 UTC

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
-- TOC entry 9 (class 2615 OID 130516)
-- Name: src_ms2014; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA src_ms2014;


--
-- TOC entry 630 (class 1259 OID 130517)
-- Name: etl; Type: TABLE; Schema: src_ms2014; Owner: -
--

CREATE TABLE src_ms2014.etl (
    url character varying NOT NULL,
    etag character varying,
    modified timestamp with time zone,
    checked timestamp with time zone
);


--
-- TOC entry 631 (class 1259 OID 130525)
-- Name: projekty; Type: TABLE; Schema: src_ms2014; Owner: -
--

CREATE TABLE src_ms2014.projekty (
    id character varying,
    id_vyzva character varying,
    kod character varying,
    naz text,
    popis text,
    problem text,
    cil text,
    dzrskut timestamp without time zone,
    durpred timestamp without time zone,
    durskut timestamp without time zone,
    suk character varying
);


--
-- TOC entry 4887 (class 2606 OID 130524)
-- Name: etl etl_pkey; Type: CONSTRAINT; Schema: src_ms2014; Owner: -
--

ALTER TABLE ONLY src_ms2014.etl
    ADD CONSTRAINT etl_pkey PRIMARY KEY (url);


-- Completed on 2021-05-07 14:10:35 UTC

--
-- PostgreSQL database dump complete
--

