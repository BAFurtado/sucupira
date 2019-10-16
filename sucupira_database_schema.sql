--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2019-10-16 18:24:07

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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 17034)
-- Name: instituicoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instituicoes (
    id integer NOT NULL,
    codigo character varying(200),
    nome text
);


ALTER TABLE public.instituicoes OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 17032)
-- Name: instituicoes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instituicoes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instituicoes_id_seq OWNER TO postgres;

--
-- TOC entry 2840 (class 0 OID 0)
-- Dependencies: 198
-- Name: instituicoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instituicoes_id_seq OWNED BY public.instituicoes.id;


--
-- TOC entry 197 (class 1259 OID 16437)
-- Name: producoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producoes (
    id integer NOT NULL,
    sigla text,
    nome_inst_ensino character varying(255),
    codigo_programa character varying(100),
    ano character varying(10),
    titulo text,
    producao_glosada character varying(10),
    ordem character varying(10),
    autor character varying(255),
    categoria character varying(255),
    tipo character varying(255),
    subtipo character varying(255),
    nome_detalhamento text,
    valor_detalhamento text,
    area_concentracao text,
    linha_pesquisa text,
    projeto_pesquisa character varying(255),
    vinculo_tcc character varying(10),
    programa text
);


ALTER TABLE public.producoes OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16435)
-- Name: producoes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producoes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producoes_id_seq OWNER TO postgres;

--
-- TOC entry 2841 (class 0 OID 0)
-- Dependencies: 196
-- Name: producoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producoes_id_seq OWNED BY public.producoes.id;


--
-- TOC entry 201 (class 1259 OID 17050)
-- Name: programas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programas (
    id integer NOT NULL,
    codigo_instituicao character varying(200),
    nome text,
    codigo_programa character varying(200)
);


ALTER TABLE public.programas OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 17048)
-- Name: programas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.programas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programas_id_seq OWNER TO postgres;

--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 200
-- Name: programas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.programas_id_seq OWNED BY public.programas.id;


--
-- TOC entry 202 (class 1259 OID 17071)
-- Name: tmp_programas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tmp_programas (
    id integer,
    codigo_instituicao character varying(200),
    nome text,
    codigo_programa character varying(200)
);


ALTER TABLE public.tmp_programas OWNER TO postgres;

--
-- TOC entry 2706 (class 2604 OID 17037)
-- Name: instituicoes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instituicoes ALTER COLUMN id SET DEFAULT nextval('public.instituicoes_id_seq'::regclass);


--
-- TOC entry 2705 (class 2604 OID 16440)
-- Name: producoes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producoes ALTER COLUMN id SET DEFAULT nextval('public.producoes_id_seq'::regclass);


--
-- TOC entry 2707 (class 2604 OID 17053)
-- Name: programas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programas ALTER COLUMN id SET DEFAULT nextval('public.programas_id_seq'::regclass);


--
-- TOC entry 2711 (class 2606 OID 17042)
-- Name: instituicoes instituicoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instituicoes
    ADD CONSTRAINT instituicoes_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 16445)
-- Name: producoes pk_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producoes
    ADD CONSTRAINT pk_id PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 17058)
-- Name: programas programas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programas
    ADD CONSTRAINT programas_pkey PRIMARY KEY (id);


-- Completed on 2019-10-16 18:24:07

--
-- PostgreSQL database dump complete
--

