--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-02-04 20:56:01

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 228 (class 1259 OID 16484)
-- Name: gerbang_laporan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gerbang_laporan (
    id_gerbang integer NOT NULL,
    kode_ruas integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying(255),
    updated_by character varying(255)
);


ALTER TABLE public.gerbang_laporan OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16465)
-- Name: gerbang_operasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gerbang_operasi (
    id_gerbang integer NOT NULL,
    kode_ruas integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying(255),
    updated_by character varying(255)
);


ALTER TABLE public.gerbang_operasi OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16538)
-- Name: m_apjt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_apjt (
    id integer NOT NULL,
    id_regional integer NOT NULL,
    kode_ruas integer NOT NULL,
    tipe_operasi character varying(100) NOT NULL,
    nama_apjt character varying(100) NOT NULL,
    presentase_kepemilikan integer,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying(255),
    updated_by character varying(255),
    CONSTRAINT m_apjt_presentase_kepemilikan_check CHECK (((presentase_kepemilikan >= 0) AND (presentase_kepemilikan <= 100)))
);


ALTER TABLE public.m_apjt OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16537)
-- Name: m_apjt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.m_apjt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.m_apjt_id_seq OWNER TO postgres;

--
-- TOC entry 5092 (class 0 OID 0)
-- Dependencies: 233
-- Name: m_apjt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.m_apjt_id_seq OWNED BY public.m_apjt.id;


--
-- TOC entry 244 (class 1259 OID 16616)
-- Name: m_cuaca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_cuaca (
    id integer NOT NULL,
    id_kecamatan integer NOT NULL,
    icon_cuaca bytea,
    jenis_cuaca integer NOT NULL,
    deskripsi character varying(100),
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    latitude character varying(255),
    longitude character varying(255),
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying(255),
    updated_by character varying(255)
);


ALTER TABLE public.m_cuaca OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16615)
-- Name: m_cuaca_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.m_cuaca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.m_cuaca_id_seq OWNER TO postgres;

--
-- TOC entry 5093 (class 0 OID 0)
-- Dependencies: 243
-- Name: m_cuaca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.m_cuaca_id_seq OWNED BY public.m_cuaca.id;


--
-- TOC entry 232 (class 1259 OID 16516)
-- Name: m_gardu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_gardu (
    id integer NOT NULL,
    id_gerbang integer NOT NULL,
    id_tipe_gardu integer NOT NULL,
    latitude character varying(255),
    longitude character varying(255),
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying(255),
    updated_by character varying(255)
);


ALTER TABLE public.m_gardu OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16515)
-- Name: m_gardu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.m_gardu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.m_gardu_id_seq OWNER TO postgres;

--
-- TOC entry 5094 (class 0 OID 0)
-- Dependencies: 231
-- Name: m_gardu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.m_gardu_id_seq OWNED BY public.m_gardu.id;


--
-- TOC entry 226 (class 1259 OID 16449)
-- Name: m_gerbang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_gerbang (
    id integer NOT NULL,
    nama_gerbang character varying(100) NOT NULL,
    id_jenis_gerbang integer NOT NULL,
    is_jm boolean NOT NULL,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying(255),
    updated_by character varying(255)
);


ALTER TABLE public.m_gerbang OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16448)
-- Name: m_gerbang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.m_gerbang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.m_gerbang_id_seq OWNER TO postgres;

--
-- TOC entry 5095 (class 0 OID 0)
-- Dependencies: 225
-- Name: m_gerbang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.m_gerbang_id_seq OWNED BY public.m_gerbang.id;


--
-- TOC entry 240 (class 1259 OID 16592)
-- Name: m_golongan_kendaraan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_golongan_kendaraan (
    id integer NOT NULL,
    nama character varying(100) NOT NULL,
    deskripsi character varying(100),
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying(255),
    updated_by character varying(255)
);


ALTER TABLE public.m_golongan_kendaraan OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16591)
-- Name: m_golongan_kendaraan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.m_golongan_kendaraan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.m_golongan_kendaraan_id_seq OWNER TO postgres;

--
-- TOC entry 5096 (class 0 OID 0)
-- Dependencies: 239
-- Name: m_golongan_kendaraan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.m_golongan_kendaraan_id_seq OWNED BY public.m_golongan_kendaraan.id;


--
-- TOC entry 238 (class 1259 OID 16578)
-- Name: m_integrator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_integrator (
    id integer NOT NULL,
    kode_integrator character varying(10) NOT NULL,
    nama_integrator character varying(100) NOT NULL,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying(255),
    updated_by character varying(255)
);


ALTER TABLE public.m_integrator OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16577)
-- Name: m_integrator_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.m_integrator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.m_integrator_id_seq OWNER TO postgres;

--
-- TOC entry 5097 (class 0 OID 0)
-- Dependencies: 237
-- Name: m_integrator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.m_integrator_id_seq OWNED BY public.m_integrator.id;


--
-- TOC entry 222 (class 1259 OID 16415)
-- Name: m_inventaris_transaksi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_inventaris_transaksi (
    id integer NOT NULL,
    id_regional integer NOT NULL,
    kode_ruas integer NOT NULL,
    id_gerbang integer NOT NULL,
    tipe_gerbang character varying(100) NOT NULL,
    jenis_gerbang character varying(100) NOT NULL,
    jumlah_multi integer NOT NULL,
    jumlah_single integer NOT NULL,
    jumlah_oab integer NOT NULL,
    jumlah_mr integer NOT NULL,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying(255),
    updated_by character varying(255)
);


ALTER TABLE public.m_inventaris_transaksi OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16414)
-- Name: m_inventaris_transaksi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.m_inventaris_transaksi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.m_inventaris_transaksi_id_seq OWNER TO postgres;

--
-- TOC entry 5098 (class 0 OID 0)
-- Dependencies: 221
-- Name: m_inventaris_transaksi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.m_inventaris_transaksi_id_seq OWNED BY public.m_inventaris_transaksi.id;


--
-- TOC entry 224 (class 1259 OID 16437)
-- Name: m_jenis_gerbang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_jenis_gerbang (
    id integer NOT NULL,
    jenis_gerbang character varying(100) NOT NULL,
    sistem_transaksi character varying(100) NOT NULL,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying(255),
    updated_by character varying(255)
);


ALTER TABLE public.m_jenis_gerbang OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16436)
-- Name: m_jenis_gerbang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.m_jenis_gerbang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.m_jenis_gerbang_id_seq OWNER TO postgres;

--
-- TOC entry 5099 (class 0 OID 0)
-- Dependencies: 223
-- Name: m_jenis_gerbang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.m_jenis_gerbang_id_seq OWNED BY public.m_jenis_gerbang.id;


--
-- TOC entry 242 (class 1259 OID 16604)
-- Name: m_kecamatan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_kecamatan (
    id integer NOT NULL,
    nama_kecamatan character varying(100) NOT NULL,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying(255),
    updated_by character varying(255)
);


ALTER TABLE public.m_kecamatan OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16603)
-- Name: m_kecamatan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.m_kecamatan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.m_kecamatan_id_seq OWNER TO postgres;

--
-- TOC entry 5100 (class 0 OID 0)
-- Dependencies: 241
-- Name: m_kecamatan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.m_kecamatan_id_seq OWNED BY public.m_kecamatan.id;


--
-- TOC entry 218 (class 1259 OID 16386)
-- Name: m_regional; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_regional (
    id integer NOT NULL,
    nama_regional character varying(50) NOT NULL,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying(255),
    updated_by character varying(255)
);


ALTER TABLE public.m_regional OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16385)
-- Name: m_regional_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.m_regional_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.m_regional_id_seq OWNER TO postgres;

--
-- TOC entry 5101 (class 0 OID 0)
-- Dependencies: 217
-- Name: m_regional_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.m_regional_id_seq OWNED BY public.m_regional.id;


--
-- TOC entry 236 (class 1259 OID 16561)
-- Name: m_representative_officer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_representative_officer (
    id integer NOT NULL,
    id_regional integer NOT NULL,
    nama_representative_officer character varying(100) NOT NULL,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying(255),
    updated_by character varying(255)
);


ALTER TABLE public.m_representative_officer OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16560)
-- Name: m_representative_officer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.m_representative_officer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.m_representative_officer_id_seq OWNER TO postgres;

--
-- TOC entry 5102 (class 0 OID 0)
-- Dependencies: 235
-- Name: m_representative_officer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.m_representative_officer_id_seq OWNED BY public.m_representative_officer.id;


--
-- TOC entry 220 (class 1259 OID 16398)
-- Name: m_ruas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_ruas (
    kode_ruas integer NOT NULL,
    id_regional integer,
    nama_ruas character varying(100) NOT NULL,
    singkatan character varying(100),
    is_jm boolean NOT NULL,
    kepemilikan character varying(100),
    jenis_ruas character varying(100),
    panjang_ruas real,
    km_awal character varying(255),
    km_akhir character varying(255),
    jumlah_golongan integer,
    tanggal_mulai_operasi timestamp without time zone,
    waktu_konsesi timestamp without time zone,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying(255),
    updated_by character varying(255)
);


ALTER TABLE public.m_ruas OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16397)
-- Name: m_ruas_kode_ruas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.m_ruas_kode_ruas_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.m_ruas_kode_ruas_seq OWNER TO postgres;

--
-- TOC entry 5103 (class 0 OID 0)
-- Dependencies: 219
-- Name: m_ruas_kode_ruas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.m_ruas_kode_ruas_seq OWNED BY public.m_ruas.kode_ruas;


--
-- TOC entry 230 (class 1259 OID 16504)
-- Name: m_tipe_gardu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_tipe_gardu (
    id integer NOT NULL,
    tipe_gardu character varying(25) NOT NULL,
    deskripsi character varying(255),
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying(255),
    updated_by character varying(255)
);


ALTER TABLE public.m_tipe_gardu OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16503)
-- Name: m_tipe_gardu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.m_tipe_gardu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.m_tipe_gardu_id_seq OWNER TO postgres;

--
-- TOC entry 5104 (class 0 OID 0)
-- Dependencies: 229
-- Name: m_tipe_gardu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.m_tipe_gardu_id_seq OWNED BY public.m_tipe_gardu.id;


--
-- TOC entry 4842 (class 2604 OID 16541)
-- Name: m_apjt id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_apjt ALTER COLUMN id SET DEFAULT nextval('public.m_apjt_id_seq'::regclass);


--
-- TOC entry 4862 (class 2604 OID 16619)
-- Name: m_cuaca id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_cuaca ALTER COLUMN id SET DEFAULT nextval('public.m_cuaca_id_seq'::regclass);


--
-- TOC entry 4838 (class 2604 OID 16519)
-- Name: m_gardu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_gardu ALTER COLUMN id SET DEFAULT nextval('public.m_gardu_id_seq'::regclass);


--
-- TOC entry 4826 (class 2604 OID 16452)
-- Name: m_gerbang id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_gerbang ALTER COLUMN id SET DEFAULT nextval('public.m_gerbang_id_seq'::regclass);


--
-- TOC entry 4854 (class 2604 OID 16595)
-- Name: m_golongan_kendaraan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_golongan_kendaraan ALTER COLUMN id SET DEFAULT nextval('public.m_golongan_kendaraan_id_seq'::regclass);


--
-- TOC entry 4850 (class 2604 OID 16581)
-- Name: m_integrator id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_integrator ALTER COLUMN id SET DEFAULT nextval('public.m_integrator_id_seq'::regclass);


--
-- TOC entry 4818 (class 2604 OID 16418)
-- Name: m_inventaris_transaksi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_inventaris_transaksi ALTER COLUMN id SET DEFAULT nextval('public.m_inventaris_transaksi_id_seq'::regclass);


--
-- TOC entry 4822 (class 2604 OID 16440)
-- Name: m_jenis_gerbang id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_jenis_gerbang ALTER COLUMN id SET DEFAULT nextval('public.m_jenis_gerbang_id_seq'::regclass);


--
-- TOC entry 4858 (class 2604 OID 16607)
-- Name: m_kecamatan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_kecamatan ALTER COLUMN id SET DEFAULT nextval('public.m_kecamatan_id_seq'::regclass);


--
-- TOC entry 4810 (class 2604 OID 16389)
-- Name: m_regional id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_regional ALTER COLUMN id SET DEFAULT nextval('public.m_regional_id_seq'::regclass);


--
-- TOC entry 4846 (class 2604 OID 16564)
-- Name: m_representative_officer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_representative_officer ALTER COLUMN id SET DEFAULT nextval('public.m_representative_officer_id_seq'::regclass);


--
-- TOC entry 4814 (class 2604 OID 16401)
-- Name: m_ruas kode_ruas; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_ruas ALTER COLUMN kode_ruas SET DEFAULT nextval('public.m_ruas_kode_ruas_seq'::regclass);


--
-- TOC entry 4834 (class 2604 OID 16507)
-- Name: m_tipe_gardu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_tipe_gardu ALTER COLUMN id SET DEFAULT nextval('public.m_tipe_gardu_id_seq'::regclass);


--
-- TOC entry 5070 (class 0 OID 16484)
-- Dependencies: 228
-- Data for Name: gerbang_laporan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gerbang_laporan (id_gerbang, kode_ruas, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- TOC entry 5069 (class 0 OID 16465)
-- Dependencies: 227
-- Data for Name: gerbang_operasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gerbang_operasi (id_gerbang, kode_ruas, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- TOC entry 5076 (class 0 OID 16538)
-- Dependencies: 234
-- Data for Name: m_apjt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.m_apjt (id, id_regional, kode_ruas, tipe_operasi, nama_apjt, presentase_kepemilikan, is_active, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- TOC entry 5086 (class 0 OID 16616)
-- Dependencies: 244
-- Data for Name: m_cuaca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.m_cuaca (id, id_kecamatan, icon_cuaca, jenis_cuaca, deskripsi, "timestamp", latitude, longitude, is_active, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- TOC entry 5074 (class 0 OID 16516)
-- Dependencies: 232
-- Data for Name: m_gardu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.m_gardu (id, id_gerbang, id_tipe_gardu, latitude, longitude, is_active, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- TOC entry 5068 (class 0 OID 16449)
-- Dependencies: 226
-- Data for Name: m_gerbang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.m_gerbang (id, nama_gerbang, id_jenis_gerbang, is_jm, is_active, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- TOC entry 5082 (class 0 OID 16592)
-- Dependencies: 240
-- Data for Name: m_golongan_kendaraan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.m_golongan_kendaraan (id, nama, deskripsi, is_active, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- TOC entry 5080 (class 0 OID 16578)
-- Dependencies: 238
-- Data for Name: m_integrator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.m_integrator (id, kode_integrator, nama_integrator, is_active, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- TOC entry 5064 (class 0 OID 16415)
-- Dependencies: 222
-- Data for Name: m_inventaris_transaksi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.m_inventaris_transaksi (id, id_regional, kode_ruas, id_gerbang, tipe_gerbang, jenis_gerbang, jumlah_multi, jumlah_single, jumlah_oab, jumlah_mr, is_active, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- TOC entry 5066 (class 0 OID 16437)
-- Dependencies: 224
-- Data for Name: m_jenis_gerbang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.m_jenis_gerbang (id, jenis_gerbang, sistem_transaksi, is_active, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- TOC entry 5084 (class 0 OID 16604)
-- Dependencies: 242
-- Data for Name: m_kecamatan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.m_kecamatan (id, nama_kecamatan, is_active, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- TOC entry 5060 (class 0 OID 16386)
-- Dependencies: 218
-- Data for Name: m_regional; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.m_regional (id, nama_regional, is_active, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- TOC entry 5078 (class 0 OID 16561)
-- Dependencies: 236
-- Data for Name: m_representative_officer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.m_representative_officer (id, id_regional, nama_representative_officer, is_active, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- TOC entry 5062 (class 0 OID 16398)
-- Dependencies: 220
-- Data for Name: m_ruas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.m_ruas (kode_ruas, id_regional, nama_ruas, singkatan, is_jm, kepemilikan, jenis_ruas, panjang_ruas, km_awal, km_akhir, jumlah_golongan, tanggal_mulai_operasi, waktu_konsesi, is_active, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- TOC entry 5072 (class 0 OID 16504)
-- Dependencies: 230
-- Data for Name: m_tipe_gardu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.m_tipe_gardu (id, tipe_gardu, deskripsi, is_active, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 233
-- Name: m_apjt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.m_apjt_id_seq', 1, false);


--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 243
-- Name: m_cuaca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.m_cuaca_id_seq', 1, false);


--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 231
-- Name: m_gardu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.m_gardu_id_seq', 1, false);


--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 225
-- Name: m_gerbang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.m_gerbang_id_seq', 1, false);


--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 239
-- Name: m_golongan_kendaraan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.m_golongan_kendaraan_id_seq', 1, false);


--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 237
-- Name: m_integrator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.m_integrator_id_seq', 1, false);


--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 221
-- Name: m_inventaris_transaksi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.m_inventaris_transaksi_id_seq', 1, false);


--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 223
-- Name: m_jenis_gerbang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.m_jenis_gerbang_id_seq', 1, false);


--
-- TOC entry 5113 (class 0 OID 0)
-- Dependencies: 241
-- Name: m_kecamatan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.m_kecamatan_id_seq', 1, false);


--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 217
-- Name: m_regional_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.m_regional_id_seq', 1, false);


--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 235
-- Name: m_representative_officer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.m_representative_officer_id_seq', 1, false);


--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 219
-- Name: m_ruas_kode_ruas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.m_ruas_kode_ruas_seq', 1, false);


--
-- TOC entry 5117 (class 0 OID 0)
-- Dependencies: 229
-- Name: m_tipe_gardu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.m_tipe_gardu_id_seq', 1, false);


--
-- TOC entry 4887 (class 2606 OID 16549)
-- Name: m_apjt m_apjt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_apjt
    ADD CONSTRAINT m_apjt_pkey PRIMARY KEY (id);


--
-- TOC entry 4899 (class 2606 OID 16627)
-- Name: m_cuaca m_cuaca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_cuaca
    ADD CONSTRAINT m_cuaca_pkey PRIMARY KEY (id);


--
-- TOC entry 4885 (class 2606 OID 16526)
-- Name: m_gardu m_gardu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_gardu
    ADD CONSTRAINT m_gardu_pkey PRIMARY KEY (id);


--
-- TOC entry 4877 (class 2606 OID 16459)
-- Name: m_gerbang m_gerbang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_gerbang
    ADD CONSTRAINT m_gerbang_pkey PRIMARY KEY (id);


--
-- TOC entry 4895 (class 2606 OID 16602)
-- Name: m_golongan_kendaraan m_golongan_kendaraan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_golongan_kendaraan
    ADD CONSTRAINT m_golongan_kendaraan_pkey PRIMARY KEY (id);


--
-- TOC entry 4891 (class 2606 OID 16590)
-- Name: m_integrator m_integrator_kode_integrator_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_integrator
    ADD CONSTRAINT m_integrator_kode_integrator_key UNIQUE (kode_integrator);


--
-- TOC entry 4893 (class 2606 OID 16588)
-- Name: m_integrator m_integrator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_integrator
    ADD CONSTRAINT m_integrator_pkey PRIMARY KEY (id);


--
-- TOC entry 4873 (class 2606 OID 16425)
-- Name: m_inventaris_transaksi m_inventaris_transaksi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_inventaris_transaksi
    ADD CONSTRAINT m_inventaris_transaksi_pkey PRIMARY KEY (id);


--
-- TOC entry 4875 (class 2606 OID 16447)
-- Name: m_jenis_gerbang m_jenis_gerbang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_jenis_gerbang
    ADD CONSTRAINT m_jenis_gerbang_pkey PRIMARY KEY (id);


--
-- TOC entry 4897 (class 2606 OID 16614)
-- Name: m_kecamatan m_kecamatan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_kecamatan
    ADD CONSTRAINT m_kecamatan_pkey PRIMARY KEY (id);


--
-- TOC entry 4869 (class 2606 OID 16396)
-- Name: m_regional m_regional_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_regional
    ADD CONSTRAINT m_regional_pkey PRIMARY KEY (id);


--
-- TOC entry 4889 (class 2606 OID 16571)
-- Name: m_representative_officer m_representative_officer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_representative_officer
    ADD CONSTRAINT m_representative_officer_pkey PRIMARY KEY (id);


--
-- TOC entry 4871 (class 2606 OID 16408)
-- Name: m_ruas m_ruas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_ruas
    ADD CONSTRAINT m_ruas_pkey PRIMARY KEY (kode_ruas);


--
-- TOC entry 4883 (class 2606 OID 16514)
-- Name: m_tipe_gardu m_tipe_gardu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_tipe_gardu
    ADD CONSTRAINT m_tipe_gardu_pkey PRIMARY KEY (id);


--
-- TOC entry 4881 (class 2606 OID 16492)
-- Name: gerbang_laporan pk_gerbang_laporan; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gerbang_laporan
    ADD CONSTRAINT pk_gerbang_laporan PRIMARY KEY (id_gerbang, kode_ruas);


--
-- TOC entry 4879 (class 2606 OID 16473)
-- Name: gerbang_operasi pk_gerbang_operasi; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gerbang_operasi
    ADD CONSTRAINT pk_gerbang_operasi PRIMARY KEY (id_gerbang, kode_ruas);


--
-- TOC entry 4906 (class 2606 OID 16493)
-- Name: gerbang_laporan fk_gerbang_laporan_gerbang; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gerbang_laporan
    ADD CONSTRAINT fk_gerbang_laporan_gerbang FOREIGN KEY (id_gerbang) REFERENCES public.m_gerbang(id) ON DELETE CASCADE;


--
-- TOC entry 4907 (class 2606 OID 16498)
-- Name: gerbang_laporan fk_gerbang_laporan_ruas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gerbang_laporan
    ADD CONSTRAINT fk_gerbang_laporan_ruas FOREIGN KEY (kode_ruas) REFERENCES public.m_ruas(kode_ruas) ON DELETE CASCADE;


--
-- TOC entry 4904 (class 2606 OID 16474)
-- Name: gerbang_operasi fk_gerbang_operasi_gerbang; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gerbang_operasi
    ADD CONSTRAINT fk_gerbang_operasi_gerbang FOREIGN KEY (id_gerbang) REFERENCES public.m_gerbang(id) ON DELETE CASCADE;


--
-- TOC entry 4905 (class 2606 OID 16479)
-- Name: gerbang_operasi fk_gerbang_operasi_ruas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gerbang_operasi
    ADD CONSTRAINT fk_gerbang_operasi_ruas FOREIGN KEY (kode_ruas) REFERENCES public.m_ruas(kode_ruas) ON DELETE CASCADE;


--
-- TOC entry 4910 (class 2606 OID 16550)
-- Name: m_apjt fk_m_apjt_regional; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_apjt
    ADD CONSTRAINT fk_m_apjt_regional FOREIGN KEY (id_regional) REFERENCES public.m_regional(id) ON DELETE CASCADE;


--
-- TOC entry 4911 (class 2606 OID 16555)
-- Name: m_apjt fk_m_apjt_ruas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_apjt
    ADD CONSTRAINT fk_m_apjt_ruas FOREIGN KEY (kode_ruas) REFERENCES public.m_ruas(kode_ruas) ON DELETE CASCADE;


--
-- TOC entry 4913 (class 2606 OID 16628)
-- Name: m_cuaca fk_m_cuaca_kecamatan; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_cuaca
    ADD CONSTRAINT fk_m_cuaca_kecamatan FOREIGN KEY (id_kecamatan) REFERENCES public.m_kecamatan(id) ON DELETE CASCADE;


--
-- TOC entry 4908 (class 2606 OID 16527)
-- Name: m_gardu fk_m_gardu_gerbang; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_gardu
    ADD CONSTRAINT fk_m_gardu_gerbang FOREIGN KEY (id_gerbang) REFERENCES public.m_gerbang(id) ON DELETE CASCADE;


--
-- TOC entry 4909 (class 2606 OID 16532)
-- Name: m_gardu fk_m_gardu_tipe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_gardu
    ADD CONSTRAINT fk_m_gardu_tipe FOREIGN KEY (id_tipe_gardu) REFERENCES public.m_tipe_gardu(id) ON DELETE CASCADE;


--
-- TOC entry 4903 (class 2606 OID 16460)
-- Name: m_gerbang fk_m_gerbang_jenis; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_gerbang
    ADD CONSTRAINT fk_m_gerbang_jenis FOREIGN KEY (id_jenis_gerbang) REFERENCES public.m_jenis_gerbang(id) ON DELETE CASCADE;


--
-- TOC entry 4901 (class 2606 OID 16426)
-- Name: m_inventaris_transaksi fk_m_inventaris_transaksi_regional; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_inventaris_transaksi
    ADD CONSTRAINT fk_m_inventaris_transaksi_regional FOREIGN KEY (id_regional) REFERENCES public.m_regional(id) ON DELETE CASCADE;


--
-- TOC entry 4902 (class 2606 OID 16431)
-- Name: m_inventaris_transaksi fk_m_inventaris_transaksi_ruas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_inventaris_transaksi
    ADD CONSTRAINT fk_m_inventaris_transaksi_ruas FOREIGN KEY (kode_ruas) REFERENCES public.m_ruas(kode_ruas) ON DELETE CASCADE;


--
-- TOC entry 4912 (class 2606 OID 16572)
-- Name: m_representative_officer fk_m_representative_officer_regional; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_representative_officer
    ADD CONSTRAINT fk_m_representative_officer_regional FOREIGN KEY (id_regional) REFERENCES public.m_regional(id) ON DELETE CASCADE;


--
-- TOC entry 4900 (class 2606 OID 16409)
-- Name: m_ruas fk_m_ruas_regional; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_ruas
    ADD CONSTRAINT fk_m_ruas_regional FOREIGN KEY (id_regional) REFERENCES public.m_regional(id) ON DELETE SET NULL;


-- Completed on 2025-02-04 20:56:02

--
-- PostgreSQL database dump complete
--

