--
-- PostgreSQL database dump
--

-- Dumped from database version 12.20 (Ubuntu 12.20-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.20 (Ubuntu 12.20-0ubuntu0.20.04.1)

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

SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: loris01
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO loris01;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: loris01
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO loris01;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: loris01
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: loris01
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO loris01;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: loris01
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO loris01;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: loris01
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: loris01
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO loris01;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: loris01
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_variant_records_id_seq OWNER TO loris01;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: loris01
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: administrators; Type: TABLE; Schema: public; Owner: loris01
--

CREATE TABLE public.administrators (
    id bigint NOT NULL,
    email character varying,
    name character varying,
    surname character varying,
    password character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    password_digest character varying,
    remember_digest character varying,
    root boolean DEFAULT false
);


ALTER TABLE public.administrators OWNER TO loris01;

--
-- Name: administrators_id_seq; Type: SEQUENCE; Schema: public; Owner: loris01
--

CREATE SEQUENCE public.administrators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.administrators_id_seq OWNER TO loris01;

--
-- Name: administrators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: loris01
--

ALTER SEQUENCE public.administrators_id_seq OWNED BY public.administrators.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: loris01
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO loris01;

--
-- Name: bookings; Type: TABLE; Schema: public; Owner: loris01
--

CREATE TABLE public.bookings (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    slot_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    payment_intent_id character varying
);


ALTER TABLE public.bookings OWNER TO loris01;

--
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: loris01
--

CREATE SEQUENCE public.bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bookings_id_seq OWNER TO loris01;

--
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: loris01
--

ALTER SEQUENCE public.bookings_id_seq OWNED BY public.bookings.id;


--
-- Name: fields; Type: TABLE; Schema: public; Owner: loris01
--

CREATE TABLE public.fields (
    id bigint NOT NULL,
    nome character varying,
    descrizione text,
    sport character varying,
    prezzo numeric,
    latitudine numeric,
    longitudine numeric,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    "interval" integer,
    exclude_days character varying,
    indirizzo character varying
);


ALTER TABLE public.fields OWNER TO loris01;

--
-- Name: fields_id_seq; Type: SEQUENCE; Schema: public; Owner: loris01
--

CREATE SEQUENCE public.fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fields_id_seq OWNER TO loris01;

--
-- Name: fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: loris01
--

ALTER SEQUENCE public.fields_id_seq OWNED BY public.fields.id;


--
-- Name: partners; Type: TABLE; Schema: public; Owner: loris01
--

CREATE TABLE public.partners (
    id bigint NOT NULL,
    email character varying,
    name character varying,
    surname character varying,
    gender character varying,
    birthday character varying,
    mobile character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    password_digest character varying
);


ALTER TABLE public.partners OWNER TO loris01;

--
-- Name: partners_id_seq; Type: SEQUENCE; Schema: public; Owner: loris01
--

CREATE SEQUENCE public.partners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partners_id_seq OWNER TO loris01;

--
-- Name: partners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: loris01
--

ALTER SEQUENCE public.partners_id_seq OWNED BY public.partners.id;


--
-- Name: reports; Type: TABLE; Schema: public; Owner: loris01
--

CREATE TABLE public.reports (
    id bigint NOT NULL,
    reportable_type character varying,
    reportable_id bigint,
    reporter_type character varying,
    reporter_id bigint,
    status integer DEFAULT 0,
    details text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.reports OWNER TO loris01;

--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: loris01
--

CREATE SEQUENCE public.reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_id_seq OWNER TO loris01;

--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: loris01
--

ALTER SEQUENCE public.reports_id_seq OWNED BY public.reports.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: loris01
--

CREATE TABLE public.reviews (
    id bigint NOT NULL,
    titolo character varying,
    valutazione integer,
    testo text,
    field_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.reviews OWNER TO loris01;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: loris01
--

CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO loris01;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: loris01
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: loris01
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO loris01;

--
-- Name: slots; Type: TABLE; Schema: public; Owner: loris01
--

CREATE TABLE public.slots (
    id bigint NOT NULL,
    field_id bigint NOT NULL,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    booked boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.slots OWNER TO loris01;

--
-- Name: slots_id_seq; Type: SEQUENCE; Schema: public; Owner: loris01
--

CREATE SEQUENCE public.slots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slots_id_seq OWNER TO loris01;

--
-- Name: slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: loris01
--

ALTER SEQUENCE public.slots_id_seq OWNED BY public.slots.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: loris01
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying,
    password_digest character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    uid character varying,
    provider character varying,
    confirmed_at timestamp without time zone,
    confirmation_token character varying,
    confirmation_sent_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO loris01;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: loris01
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO loris01;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: loris01
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: administrators id; Type: DEFAULT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.administrators ALTER COLUMN id SET DEFAULT nextval('public.administrators_id_seq'::regclass);


--
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);


--
-- Name: fields id; Type: DEFAULT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.fields ALTER COLUMN id SET DEFAULT nextval('public.fields_id_seq'::regclass);


--
-- Name: partners id; Type: DEFAULT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.partners ALTER COLUMN id SET DEFAULT nextval('public.partners_id_seq'::regclass);


--
-- Name: reports id; Type: DEFAULT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.reports ALTER COLUMN id SET DEFAULT nextval('public.reports_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: slots id; Type: DEFAULT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.slots ALTER COLUMN id SET DEFAULT nextval('public.slots_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: loris01
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
17	image	Field	22	17	2024-10-22 21:30:18.570827
18	image	Field	23	18	2024-10-22 22:35:37.440457
20	image	Field	25	20	2024-10-23 23:44:38.893736
21	image	Field	26	21	2024-10-23 23:58:01.861542
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: loris01
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
21	675kd3qu0ld25zkv9dzc8dys3ceg	calcio_a_5_maschile_header.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	981500	+WcbX4dSbkwyw6ttaN0vMA==	2024-10-23 23:58:01.85816
17	8niczyjlwkovwu6jqf02g76rrzh8	CalcettoProva.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	301860	9l98iyuquzRKGoIHeFjT/Q==	2024-10-22 21:30:18.567073
18	um1m1ytmkzmu6jhzxmth8lpzapiu	courts123_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	82077	uEOjlsXdG8/UXQhNzjP9sw==	2024-10-22 22:35:37.437967
20	j0af797p9glrswpgu6jo18fu3h5w	campo-calcetto-1024x678.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	113297	P/XM4pFWRLzYPg5sJYmrnA==	2024-10-23 23:44:38.889315
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: loris01
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: administrators; Type: TABLE DATA; Schema: public; Owner: loris01
--

COPY public.administrators (id, email, name, surname, password, created_at, updated_at, password_digest, remember_digest, root) FROM stdin;
2	adminprova@gmail.com	admin	admin	\N	2024-10-23 19:13:26.211615	2024-10-23 19:13:26.211615	$2a$12$5Q1z481cPgYYe2KqoNvTL.CpIZXZzZHVZQbxTQD2w7wp1f4/5Wvuq	\N	f
3	wow@gmail.com	wow	wowo	\N	2024-10-23 19:14:48.238273	2024-10-23 19:14:48.238273	$2a$12$r6smL6txUJqt65OHmwXyt.MvKMUWAYGbKL/6/rG.rFHNC/PM6Gt3G	\N	f
1	prova2@gmail.com	loris	abbruzzo	\N	2024-10-23 18:14:25.857625	2024-10-24 21:40:51.169124	$2a$12$3zqMP8Z97U3GUYRd.CgIL.Sz4e5X8Lq6l0XHF2Cdknf0qDFDYRp1S	\N	f
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: loris01
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-10-04 21:33:16.800667	2024-10-04 21:33:16.800667
schema_sha1	4616ba95b6c9d945eb16613a68ad15b68a0e9a61	2024-10-04 21:33:16.806854	2024-10-04 21:33:16.806854
\.


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: loris01
--

COPY public.bookings (id, user_id, slot_id, created_at, updated_at, payment_intent_id) FROM stdin;
50	1	55310	2024-10-23 15:21:16.730589	2024-10-23 15:21:16.730589	pi_3QD4UiRuwVkX58TH1nldSX7X
51	1	55344	2024-10-24 16:09:26.992729	2024-10-24 16:09:26.992729	pi_3QDRisRuwVkX58TH0tAUNFFL
52	11	55379	2024-10-24 17:53:03.215349	2024-10-24 17:53:03.215349	pi_3QDTKgRuwVkX58TH15iE5osq
55	1	55400	2024-10-24 20:17:38.2073	2024-10-24 20:17:38.2073	pi_3QDVb5RuwVkX58TH0wMxxZor
56	11	55331	2024-10-24 20:27:14.420897	2024-10-24 20:27:14.420897	pi_3QDVkSRuwVkX58TH164DQDsT
57	11	55331	2024-10-24 20:43:10.013497	2024-10-24 20:43:10.013497	pi_3QDVkSRuwVkX58TH164DQDsT
58	11	55331	2024-10-24 20:43:11.998984	2024-10-24 20:43:11.998984	pi_3QDVkSRuwVkX58TH164DQDsT
59	1	55332	2024-10-24 21:25:38.271133	2024-10-24 21:25:38.271133	pi_3QDWeuRuwVkX58TH0OUuq6OE
\.


--
-- Data for Name: fields; Type: TABLE DATA; Schema: public; Owner: loris01
--

COPY public.fields (id, nome, descrizione, sport, prezzo, latitudine, longitudine, created_at, updated_at, start_time, end_time, "interval", exclude_days, indirizzo) FROM stdin;
25	Calcetto Milano	3456yghjkl	Calcetto	55.0	45.4639102	9.1906426	2024-10-23 23:44:35.96821	2024-10-23 23:44:38.896486	2024-10-23 11:00:00	2024-10-23 19:00:00	60	["", "0"]	Piazza del Duomo, 20121 Milano MI, Italia
26	Calcetto cemento	asdasfna	Calcetto	45.0	41.8766198	12.5577829	2024-10-23 23:57:57.747376	2024-10-23 23:58:01.863697	2024-10-23 10:00:00	2024-10-23 21:00:00	60	["", "0"]	Viale della Primavera, 64, 00172 Roma RM
22	Anzio Calcetto	sedfsdf	Calcetto	50.0	41.4636064	12.613191	2024-10-22 21:30:18.554676	2024-10-22 21:30:18.572856	2024-10-22 17:29:00	2024-10-22 21:29:00	60	["", "0"]	Viale Marconi, 31, 00042 Anzio RM
23	Tennis Colosseo	O vinci o muori	Tennis	30.0	41.8899551	12.4942704	2024-10-22 22:35:33.918653	2024-10-22 22:35:37.443238	2024-10-22 09:00:00	2024-10-22 21:00:00	60	["", "0"]	Piazza del Colosseo, 1, 00184 Roma RM, Italia
\.


--
-- Data for Name: partners; Type: TABLE DATA; Schema: public; Owner: loris01
--

COPY public.partners (id, email, name, surname, gender, birthday, mobile, created_at, updated_at, password_digest) FROM stdin;
\.


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: loris01
--

COPY public.reports (id, reportable_type, reportable_id, reporter_type, reporter_id, status, details, created_at, updated_at) FROM stdin;
1	Booking	51	User	1	1	DIocanee	2024-10-24 17:08:04.484781	2024-10-24 17:08:51.808195
2	Booking	50	User	1	2	AIuto mi hanno inculato	2024-10-24 17:42:25.516217	2024-10-24 17:42:40.289324
3	Booking	52	User	11	1	aaaaaaaaaaaaaaaa	2024-10-24 17:53:14.860368	2024-10-24 17:56:33.344875
4	Booking	53	User	1	2	lalala	2024-10-24 20:15:43.111801	2024-10-24 20:19:06.623242
5	Booking	54	User	1	1	sdfghj	2024-10-24 20:17:55.253413	2024-10-24 20:19:18.267279
7	Booking	56	User	11	0	Campo fa cagare	2024-10-24 20:27:37.624894	2024-10-24 20:27:37.624894
8	Booking	59	User	1	0	provaprova	2024-10-24 21:26:00.250383	2024-10-24 21:26:00.250383
6	Booking	55	User	1	1	asd	2024-10-24 20:23:11.15555	2024-10-24 21:27:07.678906
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: loris01
--

COPY public.reviews (id, titolo, valutazione, testo, field_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: loris01
--

COPY public.schema_migrations (version) FROM stdin;
20241002131617
20240930214925
20241008170831
20241007131824
20241013214624
20241014171957
20241014172434
20241017190610
20241017192940
20241017193151
20241018124234
20241018124242
20241018132735
20241019125043
20241022152644
20241020161234
20241020171413
20241020171655
20241022110342
20241023110906
20241024121959
\.


--
-- Data for Name: slots; Type: TABLE DATA; Schema: public; Owner: loris01
--

COPY public.slots (id, field_id, start_time, end_time, booked, created_at, updated_at) FROM stdin;
55303	23	2024-10-23 09:00:00	2024-10-23 10:00:00	f	2024-10-22 22:35:33.927837	2024-10-22 22:35:33.927837
55304	23	2024-10-23 10:00:00	2024-10-23 11:00:00	f	2024-10-22 22:35:33.935038	2024-10-22 22:35:33.935038
55305	23	2024-10-23 11:00:00	2024-10-23 12:00:00	f	2024-10-22 22:35:33.937831	2024-10-22 22:35:33.937831
55306	23	2024-10-23 12:00:00	2024-10-23 13:00:00	f	2024-10-22 22:35:33.939786	2024-10-22 22:35:33.939786
55307	23	2024-10-23 13:00:00	2024-10-23 14:00:00	f	2024-10-22 22:35:33.942963	2024-10-22 22:35:33.942963
55308	23	2024-10-23 14:00:00	2024-10-23 15:00:00	f	2024-10-22 22:35:33.946482	2024-10-22 22:35:33.946482
55309	23	2024-10-23 15:00:00	2024-10-23 16:00:00	f	2024-10-22 22:35:33.949277	2024-10-22 22:35:33.949277
57487	25	2024-10-24 11:00:00	2024-10-24 12:00:00	f	2024-10-23 23:44:35.972227	2024-10-23 23:44:35.972227
55311	23	2024-10-23 17:00:00	2024-10-23 18:00:00	f	2024-10-22 22:35:33.955621	2024-10-22 22:35:33.955621
55312	23	2024-10-23 18:00:00	2024-10-23 19:00:00	f	2024-10-22 22:35:33.959258	2024-10-22 22:35:33.959258
55313	23	2024-10-23 19:00:00	2024-10-23 20:00:00	f	2024-10-22 22:35:33.961762	2024-10-22 22:35:33.961762
55314	23	2024-10-23 20:00:00	2024-10-23 21:00:00	f	2024-10-22 22:35:33.965047	2024-10-22 22:35:33.965047
55315	23	2024-10-24 09:00:00	2024-10-24 10:00:00	f	2024-10-22 22:35:33.967661	2024-10-22 22:35:33.967661
55316	23	2024-10-24 10:00:00	2024-10-24 11:00:00	f	2024-10-22 22:35:33.970269	2024-10-22 22:35:33.970269
55317	23	2024-10-24 11:00:00	2024-10-24 12:00:00	f	2024-10-22 22:35:33.97358	2024-10-22 22:35:33.97358
55318	23	2024-10-24 12:00:00	2024-10-24 13:00:00	f	2024-10-22 22:35:33.976075	2024-10-22 22:35:33.976075
55319	23	2024-10-24 13:00:00	2024-10-24 14:00:00	f	2024-10-22 22:35:33.979682	2024-10-22 22:35:33.979682
55320	23	2024-10-24 14:00:00	2024-10-24 15:00:00	f	2024-10-22 22:35:33.982163	2024-10-22 22:35:33.982163
55321	23	2024-10-24 15:00:00	2024-10-24 16:00:00	f	2024-10-22 22:35:33.985202	2024-10-22 22:35:33.985202
55322	23	2024-10-24 16:00:00	2024-10-24 17:00:00	f	2024-10-22 22:35:33.987469	2024-10-22 22:35:33.987469
55323	23	2024-10-24 17:00:00	2024-10-24 18:00:00	f	2024-10-22 22:35:33.98963	2024-10-22 22:35:33.98963
55324	23	2024-10-24 18:00:00	2024-10-24 19:00:00	f	2024-10-22 22:35:33.99239	2024-10-22 22:35:33.99239
55325	23	2024-10-24 19:00:00	2024-10-24 20:00:00	f	2024-10-22 22:35:33.994887	2024-10-22 22:35:33.994887
55326	23	2024-10-24 20:00:00	2024-10-24 21:00:00	f	2024-10-22 22:35:33.997865	2024-10-22 22:35:33.997865
55327	23	2024-10-25 09:00:00	2024-10-25 10:00:00	f	2024-10-22 22:35:34.001149	2024-10-22 22:35:34.001149
55328	23	2024-10-25 10:00:00	2024-10-25 11:00:00	f	2024-10-22 22:35:34.003867	2024-10-22 22:35:34.003867
55329	23	2024-10-25 11:00:00	2024-10-25 12:00:00	f	2024-10-22 22:35:34.007023	2024-10-22 22:35:34.007023
55330	23	2024-10-25 12:00:00	2024-10-25 13:00:00	f	2024-10-22 22:35:34.009085	2024-10-22 22:35:34.009085
55333	23	2024-10-25 15:00:00	2024-10-25 16:00:00	f	2024-10-22 22:35:34.016346	2024-10-22 22:35:34.016346
55334	23	2024-10-25 16:00:00	2024-10-25 17:00:00	f	2024-10-22 22:35:34.018721	2024-10-22 22:35:34.018721
55335	23	2024-10-25 17:00:00	2024-10-25 18:00:00	f	2024-10-22 22:35:34.02146	2024-10-22 22:35:34.02146
55336	23	2024-10-25 18:00:00	2024-10-25 19:00:00	f	2024-10-22 22:35:34.023539	2024-10-22 22:35:34.023539
55337	23	2024-10-25 19:00:00	2024-10-25 20:00:00	f	2024-10-22 22:35:34.025972	2024-10-22 22:35:34.025972
55338	23	2024-10-25 20:00:00	2024-10-25 21:00:00	f	2024-10-22 22:35:34.029269	2024-10-22 22:35:34.029269
55339	23	2024-10-26 09:00:00	2024-10-26 10:00:00	f	2024-10-22 22:35:34.032387	2024-10-22 22:35:34.032387
55340	23	2024-10-26 10:00:00	2024-10-26 11:00:00	f	2024-10-22 22:35:34.036415	2024-10-22 22:35:34.036415
55341	23	2024-10-26 11:00:00	2024-10-26 12:00:00	f	2024-10-22 22:35:34.03886	2024-10-22 22:35:34.03886
55342	23	2024-10-26 12:00:00	2024-10-26 13:00:00	f	2024-10-22 22:35:34.04195	2024-10-22 22:35:34.04195
55343	23	2024-10-26 13:00:00	2024-10-26 14:00:00	f	2024-10-22 22:35:34.044663	2024-10-22 22:35:34.044663
55345	23	2024-10-26 15:00:00	2024-10-26 16:00:00	f	2024-10-22 22:35:34.050123	2024-10-22 22:35:34.050123
55346	23	2024-10-26 16:00:00	2024-10-26 17:00:00	f	2024-10-22 22:35:34.052145	2024-10-22 22:35:34.052145
55347	23	2024-10-26 17:00:00	2024-10-26 18:00:00	f	2024-10-22 22:35:34.055338	2024-10-22 22:35:34.055338
55348	23	2024-10-26 18:00:00	2024-10-26 19:00:00	f	2024-10-22 22:35:34.058435	2024-10-22 22:35:34.058435
55349	23	2024-10-26 19:00:00	2024-10-26 20:00:00	f	2024-10-22 22:35:34.062445	2024-10-22 22:35:34.062445
55350	23	2024-10-26 20:00:00	2024-10-26 21:00:00	f	2024-10-22 22:35:34.065228	2024-10-22 22:35:34.065228
55351	23	2024-10-28 09:00:00	2024-10-28 10:00:00	f	2024-10-22 22:35:34.067974	2024-10-22 22:35:34.067974
55352	23	2024-10-28 10:00:00	2024-10-28 11:00:00	f	2024-10-22 22:35:34.070469	2024-10-22 22:35:34.070469
55353	23	2024-10-28 11:00:00	2024-10-28 12:00:00	f	2024-10-22 22:35:34.072646	2024-10-22 22:35:34.072646
55354	23	2024-10-28 12:00:00	2024-10-28 13:00:00	f	2024-10-22 22:35:34.075453	2024-10-22 22:35:34.075453
55355	23	2024-10-28 13:00:00	2024-10-28 14:00:00	f	2024-10-22 22:35:34.077887	2024-10-22 22:35:34.077887
55356	23	2024-10-28 14:00:00	2024-10-28 15:00:00	f	2024-10-22 22:35:34.079925	2024-10-22 22:35:34.079925
55357	23	2024-10-28 15:00:00	2024-10-28 16:00:00	f	2024-10-22 22:35:34.082958	2024-10-22 22:35:34.082958
55358	23	2024-10-28 16:00:00	2024-10-28 17:00:00	f	2024-10-22 22:35:34.085121	2024-10-22 22:35:34.085121
55359	23	2024-10-28 17:00:00	2024-10-28 18:00:00	f	2024-10-22 22:35:34.087115	2024-10-22 22:35:34.087115
55360	23	2024-10-28 18:00:00	2024-10-28 19:00:00	f	2024-10-22 22:35:34.091523	2024-10-22 22:35:34.091523
55361	23	2024-10-28 19:00:00	2024-10-28 20:00:00	f	2024-10-22 22:35:34.09477	2024-10-22 22:35:34.09477
55362	23	2024-10-28 20:00:00	2024-10-28 21:00:00	f	2024-10-22 22:35:34.098251	2024-10-22 22:35:34.098251
55363	23	2024-10-29 09:00:00	2024-10-29 10:00:00	f	2024-10-22 22:35:34.100516	2024-10-22 22:35:34.100516
55364	23	2024-10-29 10:00:00	2024-10-29 11:00:00	f	2024-10-22 22:35:34.103662	2024-10-22 22:35:34.103662
55365	23	2024-10-29 11:00:00	2024-10-29 12:00:00	f	2024-10-22 22:35:34.106146	2024-10-22 22:35:34.106146
55366	23	2024-10-29 12:00:00	2024-10-29 13:00:00	f	2024-10-22 22:35:34.108445	2024-10-22 22:35:34.108445
55367	23	2024-10-29 13:00:00	2024-10-29 14:00:00	f	2024-10-22 22:35:34.111673	2024-10-22 22:35:34.111673
55368	23	2024-10-29 14:00:00	2024-10-29 15:00:00	f	2024-10-22 22:35:34.113775	2024-10-22 22:35:34.113775
55369	23	2024-10-29 15:00:00	2024-10-29 16:00:00	f	2024-10-22 22:35:34.116253	2024-10-22 22:35:34.116253
55370	23	2024-10-29 16:00:00	2024-10-29 17:00:00	f	2024-10-22 22:35:34.120889	2024-10-22 22:35:34.120889
55371	23	2024-10-29 17:00:00	2024-10-29 18:00:00	f	2024-10-22 22:35:34.125637	2024-10-22 22:35:34.125637
55372	23	2024-10-29 18:00:00	2024-10-29 19:00:00	f	2024-10-22 22:35:34.12862	2024-10-22 22:35:34.12862
55373	23	2024-10-29 19:00:00	2024-10-29 20:00:00	f	2024-10-22 22:35:34.132101	2024-10-22 22:35:34.132101
55374	23	2024-10-29 20:00:00	2024-10-29 21:00:00	f	2024-10-22 22:35:34.139991	2024-10-22 22:35:34.139991
55375	23	2024-10-30 09:00:00	2024-10-30 10:00:00	f	2024-10-22 22:35:34.142315	2024-10-22 22:35:34.142315
55376	23	2024-10-30 10:00:00	2024-10-30 11:00:00	f	2024-10-22 22:35:34.145063	2024-10-22 22:35:34.145063
55377	23	2024-10-30 11:00:00	2024-10-30 12:00:00	f	2024-10-22 22:35:34.147473	2024-10-22 22:35:34.147473
55378	23	2024-10-30 12:00:00	2024-10-30 13:00:00	f	2024-10-22 22:35:34.149652	2024-10-22 22:35:34.149652
55380	23	2024-10-30 14:00:00	2024-10-30 15:00:00	f	2024-10-22 22:35:34.155196	2024-10-22 22:35:34.155196
55381	23	2024-10-30 15:00:00	2024-10-30 16:00:00	f	2024-10-22 22:35:34.158089	2024-10-22 22:35:34.158089
55382	23	2024-10-30 16:00:00	2024-10-30 17:00:00	f	2024-10-22 22:35:34.161023	2024-10-22 22:35:34.161023
55383	23	2024-10-30 17:00:00	2024-10-30 18:00:00	f	2024-10-22 22:35:34.163535	2024-10-22 22:35:34.163535
55384	23	2024-10-30 18:00:00	2024-10-30 19:00:00	f	2024-10-22 22:35:34.16689	2024-10-22 22:35:34.16689
55385	23	2024-10-30 19:00:00	2024-10-30 20:00:00	f	2024-10-22 22:35:34.169126	2024-10-22 22:35:34.169126
55386	23	2024-10-30 20:00:00	2024-10-30 21:00:00	f	2024-10-22 22:35:34.172749	2024-10-22 22:35:34.172749
55387	23	2024-10-31 09:00:00	2024-10-31 10:00:00	f	2024-10-22 22:35:34.175015	2024-10-22 22:35:34.175015
55388	23	2024-10-31 10:00:00	2024-10-31 11:00:00	f	2024-10-22 22:35:34.177133	2024-10-22 22:35:34.177133
55389	23	2024-10-31 11:00:00	2024-10-31 12:00:00	f	2024-10-22 22:35:34.180432	2024-10-22 22:35:34.180432
55390	23	2024-10-31 12:00:00	2024-10-31 13:00:00	f	2024-10-22 22:35:34.182772	2024-10-22 22:35:34.182772
55391	23	2024-10-31 13:00:00	2024-10-31 14:00:00	f	2024-10-22 22:35:34.185055	2024-10-22 22:35:34.185055
55392	23	2024-10-31 14:00:00	2024-10-31 15:00:00	f	2024-10-22 22:35:34.189029	2024-10-22 22:35:34.189029
55393	23	2024-10-31 15:00:00	2024-10-31 16:00:00	f	2024-10-22 22:35:34.192012	2024-10-22 22:35:34.192012
55394	23	2024-10-31 16:00:00	2024-10-31 17:00:00	f	2024-10-22 22:35:34.195974	2024-10-22 22:35:34.195974
55395	23	2024-10-31 17:00:00	2024-10-31 18:00:00	f	2024-10-22 22:35:34.198271	2024-10-22 22:35:34.198271
55396	23	2024-10-31 18:00:00	2024-10-31 19:00:00	f	2024-10-22 22:35:34.201141	2024-10-22 22:35:34.201141
55397	23	2024-10-31 19:00:00	2024-10-31 20:00:00	f	2024-10-22 22:35:34.203582	2024-10-22 22:35:34.203582
55398	23	2024-10-31 20:00:00	2024-10-31 21:00:00	f	2024-10-22 22:35:34.206096	2024-10-22 22:35:34.206096
55379	23	2024-10-30 13:00:00	2024-10-30 14:00:00	t	2024-10-22 22:35:34.152433	2024-10-24 17:53:03.19003
55331	23	2024-10-25 13:00:00	2024-10-25 14:00:00	t	2024-10-22 22:35:34.011569	2024-10-24 20:27:14.411517
55399	23	2024-11-01 09:00:00	2024-11-01 10:00:00	f	2024-10-22 22:35:34.208808	2024-10-24 20:19:50.984783
55332	23	2024-10-25 14:00:00	2024-10-25 15:00:00	t	2024-10-22 22:35:34.014272	2024-10-24 21:25:38.25061
55401	23	2024-11-01 11:00:00	2024-11-01 12:00:00	f	2024-10-22 22:35:34.213312	2024-10-22 22:35:34.213312
55402	23	2024-11-01 12:00:00	2024-11-01 13:00:00	f	2024-10-22 22:35:34.215967	2024-10-22 22:35:34.215967
55403	23	2024-11-01 13:00:00	2024-11-01 14:00:00	f	2024-10-22 22:35:34.218425	2024-10-22 22:35:34.218425
55404	23	2024-11-01 14:00:00	2024-11-01 15:00:00	f	2024-10-22 22:35:34.222045	2024-10-22 22:35:34.222045
55405	23	2024-11-01 15:00:00	2024-11-01 16:00:00	f	2024-10-22 22:35:34.224625	2024-10-22 22:35:34.224625
55406	23	2024-11-01 16:00:00	2024-11-01 17:00:00	f	2024-10-22 22:35:34.227309	2024-10-22 22:35:34.227309
55407	23	2024-11-01 17:00:00	2024-11-01 18:00:00	f	2024-10-22 22:35:34.229798	2024-10-22 22:35:34.229798
55408	23	2024-11-01 18:00:00	2024-11-01 19:00:00	f	2024-10-22 22:35:34.231798	2024-10-22 22:35:34.231798
55409	23	2024-11-01 19:00:00	2024-11-01 20:00:00	f	2024-10-22 22:35:34.234189	2024-10-22 22:35:34.234189
55410	23	2024-11-01 20:00:00	2024-11-01 21:00:00	f	2024-10-22 22:35:34.236935	2024-10-22 22:35:34.236935
55411	23	2024-11-02 09:00:00	2024-11-02 10:00:00	f	2024-10-22 22:35:34.238997	2024-10-22 22:35:34.238997
55412	23	2024-11-02 10:00:00	2024-11-02 11:00:00	f	2024-10-22 22:35:34.241412	2024-10-22 22:35:34.241412
55413	23	2024-11-02 11:00:00	2024-11-02 12:00:00	f	2024-10-22 22:35:34.24413	2024-10-22 22:35:34.24413
55414	23	2024-11-02 12:00:00	2024-11-02 13:00:00	f	2024-10-22 22:35:34.246577	2024-10-22 22:35:34.246577
55415	23	2024-11-02 13:00:00	2024-11-02 14:00:00	f	2024-10-22 22:35:34.250381	2024-10-22 22:35:34.250381
55416	23	2024-11-02 14:00:00	2024-11-02 15:00:00	f	2024-10-22 22:35:34.252605	2024-10-22 22:35:34.252605
55417	23	2024-11-02 15:00:00	2024-11-02 16:00:00	f	2024-10-22 22:35:34.255183	2024-10-22 22:35:34.255183
55418	23	2024-11-02 16:00:00	2024-11-02 17:00:00	f	2024-10-22 22:35:34.257802	2024-10-22 22:35:34.257802
55419	23	2024-11-02 17:00:00	2024-11-02 18:00:00	f	2024-10-22 22:35:34.259916	2024-10-22 22:35:34.259916
55420	23	2024-11-02 18:00:00	2024-11-02 19:00:00	f	2024-10-22 22:35:34.262682	2024-10-22 22:35:34.262682
55421	23	2024-11-02 19:00:00	2024-11-02 20:00:00	f	2024-10-22 22:35:34.26514	2024-10-22 22:35:34.26514
55422	23	2024-11-02 20:00:00	2024-11-02 21:00:00	f	2024-10-22 22:35:34.267073	2024-10-22 22:35:34.267073
55423	23	2024-11-04 09:00:00	2024-11-04 10:00:00	f	2024-10-22 22:35:34.27011	2024-10-22 22:35:34.27011
55424	23	2024-11-04 10:00:00	2024-11-04 11:00:00	f	2024-10-22 22:35:34.272554	2024-10-22 22:35:34.272554
55425	23	2024-11-04 11:00:00	2024-11-04 12:00:00	f	2024-10-22 22:35:34.274647	2024-10-22 22:35:34.274647
55426	23	2024-11-04 12:00:00	2024-11-04 13:00:00	f	2024-10-22 22:35:34.27768	2024-10-22 22:35:34.27768
55427	23	2024-11-04 13:00:00	2024-11-04 14:00:00	f	2024-10-22 22:35:34.280259	2024-10-22 22:35:34.280259
55428	23	2024-11-04 14:00:00	2024-11-04 15:00:00	f	2024-10-22 22:35:34.282977	2024-10-22 22:35:34.282977
55429	23	2024-11-04 15:00:00	2024-11-04 16:00:00	f	2024-10-22 22:35:34.285602	2024-10-22 22:35:34.285602
55430	23	2024-11-04 16:00:00	2024-11-04 17:00:00	f	2024-10-22 22:35:34.288448	2024-10-22 22:35:34.288448
55431	23	2024-11-04 17:00:00	2024-11-04 18:00:00	f	2024-10-22 22:35:34.291955	2024-10-22 22:35:34.291955
55432	23	2024-11-04 18:00:00	2024-11-04 19:00:00	f	2024-10-22 22:35:34.294008	2024-10-22 22:35:34.294008
55433	23	2024-11-04 19:00:00	2024-11-04 20:00:00	f	2024-10-22 22:35:34.296272	2024-10-22 22:35:34.296272
55434	23	2024-11-04 20:00:00	2024-11-04 21:00:00	f	2024-10-22 22:35:34.299719	2024-10-22 22:35:34.299719
55435	23	2024-11-05 09:00:00	2024-11-05 10:00:00	f	2024-10-22 22:35:34.301849	2024-10-22 22:35:34.301849
55436	23	2024-11-05 10:00:00	2024-11-05 11:00:00	f	2024-10-22 22:35:34.304687	2024-10-22 22:35:34.304687
55437	23	2024-11-05 11:00:00	2024-11-05 12:00:00	f	2024-10-22 22:35:34.306961	2024-10-22 22:35:34.306961
55438	23	2024-11-05 12:00:00	2024-11-05 13:00:00	f	2024-10-22 22:35:34.309271	2024-10-22 22:35:34.309271
55439	23	2024-11-05 13:00:00	2024-11-05 14:00:00	f	2024-10-22 22:35:34.312287	2024-10-22 22:35:34.312287
55440	23	2024-11-05 14:00:00	2024-11-05 15:00:00	f	2024-10-22 22:35:34.31431	2024-10-22 22:35:34.31431
55441	23	2024-11-05 15:00:00	2024-11-05 16:00:00	f	2024-10-22 22:35:34.316407	2024-10-22 22:35:34.316407
55442	23	2024-11-05 16:00:00	2024-11-05 17:00:00	f	2024-10-22 22:35:34.319998	2024-10-22 22:35:34.319998
55443	23	2024-11-05 17:00:00	2024-11-05 18:00:00	f	2024-10-22 22:35:34.322566	2024-10-22 22:35:34.322566
55444	23	2024-11-05 18:00:00	2024-11-05 19:00:00	f	2024-10-22 22:35:34.325585	2024-10-22 22:35:34.325585
55445	23	2024-11-05 19:00:00	2024-11-05 20:00:00	f	2024-10-22 22:35:34.327987	2024-10-22 22:35:34.327987
55446	23	2024-11-05 20:00:00	2024-11-05 21:00:00	f	2024-10-22 22:35:34.330128	2024-10-22 22:35:34.330128
55447	23	2024-11-06 09:00:00	2024-11-06 10:00:00	f	2024-10-22 22:35:34.332984	2024-10-22 22:35:34.332984
55448	23	2024-11-06 10:00:00	2024-11-06 11:00:00	f	2024-10-22 22:35:34.335711	2024-10-22 22:35:34.335711
55449	23	2024-11-06 11:00:00	2024-11-06 12:00:00	f	2024-10-22 22:35:34.338537	2024-10-22 22:35:34.338537
55450	23	2024-11-06 12:00:00	2024-11-06 13:00:00	f	2024-10-22 22:35:34.341322	2024-10-22 22:35:34.341322
55451	23	2024-11-06 13:00:00	2024-11-06 14:00:00	f	2024-10-22 22:35:34.343339	2024-10-22 22:35:34.343339
55452	23	2024-11-06 14:00:00	2024-11-06 15:00:00	f	2024-10-22 22:35:34.34702	2024-10-22 22:35:34.34702
55453	23	2024-11-06 15:00:00	2024-11-06 16:00:00	f	2024-10-22 22:35:34.351341	2024-10-22 22:35:34.351341
55454	23	2024-11-06 16:00:00	2024-11-06 17:00:00	f	2024-10-22 22:35:34.35518	2024-10-22 22:35:34.35518
55455	23	2024-11-06 17:00:00	2024-11-06 18:00:00	f	2024-10-22 22:35:34.358391	2024-10-22 22:35:34.358391
55456	23	2024-11-06 18:00:00	2024-11-06 19:00:00	f	2024-10-22 22:35:34.362132	2024-10-22 22:35:34.362132
55457	23	2024-11-06 19:00:00	2024-11-06 20:00:00	f	2024-10-22 22:35:34.365241	2024-10-22 22:35:34.365241
55458	23	2024-11-06 20:00:00	2024-11-06 21:00:00	f	2024-10-22 22:35:34.368448	2024-10-22 22:35:34.368448
55459	23	2024-11-07 09:00:00	2024-11-07 10:00:00	f	2024-10-22 22:35:34.370765	2024-10-22 22:35:34.370765
55460	23	2024-11-07 10:00:00	2024-11-07 11:00:00	f	2024-10-22 22:35:34.373594	2024-10-22 22:35:34.373594
55461	23	2024-11-07 11:00:00	2024-11-07 12:00:00	f	2024-10-22 22:35:34.376345	2024-10-22 22:35:34.376345
55462	23	2024-11-07 12:00:00	2024-11-07 13:00:00	f	2024-10-22 22:35:34.378195	2024-10-22 22:35:34.378195
55463	23	2024-11-07 13:00:00	2024-11-07 14:00:00	f	2024-10-22 22:35:34.380931	2024-10-22 22:35:34.380931
55464	23	2024-11-07 14:00:00	2024-11-07 15:00:00	f	2024-10-22 22:35:34.38368	2024-10-22 22:35:34.38368
55465	23	2024-11-07 15:00:00	2024-11-07 16:00:00	f	2024-10-22 22:35:34.38629	2024-10-22 22:35:34.38629
55466	23	2024-11-07 16:00:00	2024-11-07 17:00:00	f	2024-10-22 22:35:34.389163	2024-10-22 22:35:34.389163
55467	23	2024-11-07 17:00:00	2024-11-07 18:00:00	f	2024-10-22 22:35:34.39156	2024-10-22 22:35:34.39156
55468	23	2024-11-07 18:00:00	2024-11-07 19:00:00	f	2024-10-22 22:35:34.394076	2024-10-22 22:35:34.394076
55469	23	2024-11-07 19:00:00	2024-11-07 20:00:00	f	2024-10-22 22:35:34.39707	2024-10-22 22:35:34.39707
55470	23	2024-11-07 20:00:00	2024-11-07 21:00:00	f	2024-10-22 22:35:34.39976	2024-10-22 22:35:34.39976
55471	23	2024-11-08 09:00:00	2024-11-08 10:00:00	f	2024-10-22 22:35:34.402904	2024-10-22 22:35:34.402904
55472	23	2024-11-08 10:00:00	2024-11-08 11:00:00	f	2024-10-22 22:35:34.405086	2024-10-22 22:35:34.405086
55473	23	2024-11-08 11:00:00	2024-11-08 12:00:00	f	2024-10-22 22:35:34.407612	2024-10-22 22:35:34.407612
55474	23	2024-11-08 12:00:00	2024-11-08 13:00:00	f	2024-10-22 22:35:34.410151	2024-10-22 22:35:34.410151
55475	23	2024-11-08 13:00:00	2024-11-08 14:00:00	f	2024-10-22 22:35:34.4129	2024-10-22 22:35:34.4129
55476	23	2024-11-08 14:00:00	2024-11-08 15:00:00	f	2024-10-22 22:35:34.416178	2024-10-22 22:35:34.416178
55477	23	2024-11-08 15:00:00	2024-11-08 16:00:00	f	2024-10-22 22:35:34.418631	2024-10-22 22:35:34.418631
55478	23	2024-11-08 16:00:00	2024-11-08 17:00:00	f	2024-10-22 22:35:34.42123	2024-10-22 22:35:34.42123
55479	23	2024-11-08 17:00:00	2024-11-08 18:00:00	f	2024-10-22 22:35:34.427286	2024-10-22 22:35:34.427286
55480	23	2024-11-08 18:00:00	2024-11-08 19:00:00	f	2024-10-22 22:35:34.430626	2024-10-22 22:35:34.430626
55481	23	2024-11-08 19:00:00	2024-11-08 20:00:00	f	2024-10-22 22:35:34.432785	2024-10-22 22:35:34.432785
55482	23	2024-11-08 20:00:00	2024-11-08 21:00:00	f	2024-10-22 22:35:34.434711	2024-10-22 22:35:34.434711
55483	23	2024-11-09 09:00:00	2024-11-09 10:00:00	f	2024-10-22 22:35:34.437179	2024-10-22 22:35:34.437179
55484	23	2024-11-09 10:00:00	2024-11-09 11:00:00	f	2024-10-22 22:35:34.4394	2024-10-22 22:35:34.4394
55485	23	2024-11-09 11:00:00	2024-11-09 12:00:00	f	2024-10-22 22:35:34.441333	2024-10-22 22:35:34.441333
55486	23	2024-11-09 12:00:00	2024-11-09 13:00:00	f	2024-10-22 22:35:34.444898	2024-10-22 22:35:34.444898
55487	23	2024-11-09 13:00:00	2024-11-09 14:00:00	f	2024-10-22 22:35:34.447097	2024-10-22 22:35:34.447097
55488	23	2024-11-09 14:00:00	2024-11-09 15:00:00	f	2024-10-22 22:35:34.449754	2024-10-22 22:35:34.449754
55489	23	2024-11-09 15:00:00	2024-11-09 16:00:00	f	2024-10-22 22:35:34.45251	2024-10-22 22:35:34.45251
55490	23	2024-11-09 16:00:00	2024-11-09 17:00:00	f	2024-10-22 22:35:34.454611	2024-10-22 22:35:34.454611
55491	23	2024-11-09 17:00:00	2024-11-09 18:00:00	f	2024-10-22 22:35:34.458115	2024-10-22 22:35:34.458115
55492	23	2024-11-09 18:00:00	2024-11-09 19:00:00	f	2024-10-22 22:35:34.460606	2024-10-22 22:35:34.460606
55493	23	2024-11-09 19:00:00	2024-11-09 20:00:00	f	2024-10-22 22:35:34.462951	2024-10-22 22:35:34.462951
55494	23	2024-11-09 20:00:00	2024-11-09 21:00:00	f	2024-10-22 22:35:34.465668	2024-10-22 22:35:34.465668
55495	23	2024-11-11 09:00:00	2024-11-11 10:00:00	f	2024-10-22 22:35:34.467674	2024-10-22 22:35:34.467674
55496	23	2024-11-11 10:00:00	2024-11-11 11:00:00	f	2024-10-22 22:35:34.469783	2024-10-22 22:35:34.469783
55497	23	2024-11-11 11:00:00	2024-11-11 12:00:00	f	2024-10-22 22:35:34.47294	2024-10-22 22:35:34.47294
55498	23	2024-11-11 12:00:00	2024-11-11 13:00:00	f	2024-10-22 22:35:34.476222	2024-10-22 22:35:34.476222
55499	23	2024-11-11 13:00:00	2024-11-11 14:00:00	f	2024-10-22 22:35:34.479529	2024-10-22 22:35:34.479529
55500	23	2024-11-11 14:00:00	2024-11-11 15:00:00	f	2024-10-22 22:35:34.481583	2024-10-22 22:35:34.481583
55501	23	2024-11-11 15:00:00	2024-11-11 16:00:00	f	2024-10-22 22:35:34.484333	2024-10-22 22:35:34.484333
55502	23	2024-11-11 16:00:00	2024-11-11 17:00:00	f	2024-10-22 22:35:34.486876	2024-10-22 22:35:34.486876
55503	23	2024-11-11 17:00:00	2024-11-11 18:00:00	f	2024-10-22 22:35:34.489486	2024-10-22 22:35:34.489486
55504	23	2024-11-11 18:00:00	2024-11-11 19:00:00	f	2024-10-22 22:35:34.492883	2024-10-22 22:35:34.492883
55505	23	2024-11-11 19:00:00	2024-11-11 20:00:00	f	2024-10-22 22:35:34.495188	2024-10-22 22:35:34.495188
55506	23	2024-11-11 20:00:00	2024-11-11 21:00:00	f	2024-10-22 22:35:34.49756	2024-10-22 22:35:34.49756
55507	23	2024-11-12 09:00:00	2024-11-12 10:00:00	f	2024-10-22 22:35:34.500641	2024-10-22 22:35:34.500641
55508	23	2024-11-12 10:00:00	2024-11-12 11:00:00	f	2024-10-22 22:35:34.502673	2024-10-22 22:35:34.502673
55509	23	2024-11-12 11:00:00	2024-11-12 12:00:00	f	2024-10-22 22:35:34.505222	2024-10-22 22:35:34.505222
55510	23	2024-11-12 12:00:00	2024-11-12 13:00:00	f	2024-10-22 22:35:34.507901	2024-10-22 22:35:34.507901
55511	23	2024-11-12 13:00:00	2024-11-12 14:00:00	f	2024-10-22 22:35:34.510021	2024-10-22 22:35:34.510021
55512	23	2024-11-12 14:00:00	2024-11-12 15:00:00	f	2024-10-22 22:35:34.512655	2024-10-22 22:35:34.512655
55513	23	2024-11-12 15:00:00	2024-11-12 16:00:00	f	2024-10-22 22:35:34.515097	2024-10-22 22:35:34.515097
55514	23	2024-11-12 16:00:00	2024-11-12 17:00:00	f	2024-10-22 22:35:34.518414	2024-10-22 22:35:34.518414
55515	23	2024-11-12 17:00:00	2024-11-12 18:00:00	f	2024-10-22 22:35:34.521656	2024-10-22 22:35:34.521656
55516	23	2024-11-12 18:00:00	2024-11-12 19:00:00	f	2024-10-22 22:35:34.523649	2024-10-22 22:35:34.523649
55517	23	2024-11-12 19:00:00	2024-11-12 20:00:00	f	2024-10-22 22:35:34.526375	2024-10-22 22:35:34.526375
55518	23	2024-11-12 20:00:00	2024-11-12 21:00:00	f	2024-10-22 22:35:34.529174	2024-10-22 22:35:34.529174
55519	23	2024-11-13 09:00:00	2024-11-13 10:00:00	f	2024-10-22 22:35:34.531735	2024-10-22 22:35:34.531735
55520	23	2024-11-13 10:00:00	2024-11-13 11:00:00	f	2024-10-22 22:35:34.534476	2024-10-22 22:35:34.534476
55521	23	2024-11-13 11:00:00	2024-11-13 12:00:00	f	2024-10-22 22:35:34.536669	2024-10-22 22:35:34.536669
55522	23	2024-11-13 12:00:00	2024-11-13 13:00:00	f	2024-10-22 22:35:34.539098	2024-10-22 22:35:34.539098
55523	23	2024-11-13 13:00:00	2024-11-13 14:00:00	f	2024-10-22 22:35:34.541906	2024-10-22 22:35:34.541906
55524	23	2024-11-13 14:00:00	2024-11-13 15:00:00	f	2024-10-22 22:35:34.54425	2024-10-22 22:35:34.54425
55525	23	2024-11-13 15:00:00	2024-11-13 16:00:00	f	2024-10-22 22:35:34.547329	2024-10-22 22:35:34.547329
55526	23	2024-11-13 16:00:00	2024-11-13 17:00:00	f	2024-10-22 22:35:34.550422	2024-10-22 22:35:34.550422
55527	23	2024-11-13 17:00:00	2024-11-13 18:00:00	f	2024-10-22 22:35:34.55254	2024-10-22 22:35:34.55254
55528	23	2024-11-13 18:00:00	2024-11-13 19:00:00	f	2024-10-22 22:35:34.555817	2024-10-22 22:35:34.555817
55529	23	2024-11-13 19:00:00	2024-11-13 20:00:00	f	2024-10-22 22:35:34.557881	2024-10-22 22:35:34.557881
55530	23	2024-11-13 20:00:00	2024-11-13 21:00:00	f	2024-10-22 22:35:34.560031	2024-10-22 22:35:34.560031
55531	23	2024-11-14 09:00:00	2024-11-14 10:00:00	f	2024-10-22 22:35:34.562981	2024-10-22 22:35:34.562981
55532	23	2024-11-14 10:00:00	2024-11-14 11:00:00	f	2024-10-22 22:35:34.564981	2024-10-22 22:35:34.564981
55533	23	2024-11-14 11:00:00	2024-11-14 12:00:00	f	2024-10-22 22:35:34.567382	2024-10-22 22:35:34.567382
55534	23	2024-11-14 12:00:00	2024-11-14 13:00:00	f	2024-10-22 22:35:34.569822	2024-10-22 22:35:34.569822
55535	23	2024-11-14 13:00:00	2024-11-14 14:00:00	f	2024-10-22 22:35:34.571727	2024-10-22 22:35:34.571727
55536	23	2024-11-14 14:00:00	2024-11-14 15:00:00	f	2024-10-22 22:35:34.574261	2024-10-22 22:35:34.574261
55537	23	2024-11-14 15:00:00	2024-11-14 16:00:00	f	2024-10-22 22:35:34.577379	2024-10-22 22:35:34.577379
55538	23	2024-11-14 16:00:00	2024-11-14 17:00:00	f	2024-10-22 22:35:34.579985	2024-10-22 22:35:34.579985
55539	23	2024-11-14 17:00:00	2024-11-14 18:00:00	f	2024-10-22 22:35:34.583157	2024-10-22 22:35:34.583157
55540	23	2024-11-14 18:00:00	2024-11-14 19:00:00	f	2024-10-22 22:35:34.58545	2024-10-22 22:35:34.58545
55541	23	2024-11-14 19:00:00	2024-11-14 20:00:00	f	2024-10-22 22:35:34.58749	2024-10-22 22:35:34.58749
55542	23	2024-11-14 20:00:00	2024-11-14 21:00:00	f	2024-10-22 22:35:34.590425	2024-10-22 22:35:34.590425
55543	23	2024-11-15 09:00:00	2024-11-15 10:00:00	f	2024-10-22 22:35:34.592508	2024-10-22 22:35:34.592508
55544	23	2024-11-15 10:00:00	2024-11-15 11:00:00	f	2024-10-22 22:35:34.594636	2024-10-22 22:35:34.594636
55545	23	2024-11-15 11:00:00	2024-11-15 12:00:00	f	2024-10-22 22:35:34.597367	2024-10-22 22:35:34.597367
55546	23	2024-11-15 12:00:00	2024-11-15 13:00:00	f	2024-10-22 22:35:34.599431	2024-10-22 22:35:34.599431
55547	23	2024-11-15 13:00:00	2024-11-15 14:00:00	f	2024-10-22 22:35:34.602285	2024-10-22 22:35:34.602285
55548	23	2024-11-15 14:00:00	2024-11-15 15:00:00	f	2024-10-22 22:35:34.605468	2024-10-22 22:35:34.605468
55549	23	2024-11-15 15:00:00	2024-11-15 16:00:00	f	2024-10-22 22:35:34.607452	2024-10-22 22:35:34.607452
55550	23	2024-11-15 16:00:00	2024-11-15 17:00:00	f	2024-10-22 22:35:34.61017	2024-10-22 22:35:34.61017
55551	23	2024-11-15 17:00:00	2024-11-15 18:00:00	f	2024-10-22 22:35:34.612798	2024-10-22 22:35:34.612798
55552	23	2024-11-15 18:00:00	2024-11-15 19:00:00	f	2024-10-22 22:35:34.615247	2024-10-22 22:35:34.615247
55553	23	2024-11-15 19:00:00	2024-11-15 20:00:00	f	2024-10-22 22:35:34.618192	2024-10-22 22:35:34.618192
55554	23	2024-11-15 20:00:00	2024-11-15 21:00:00	f	2024-10-22 22:35:34.620589	2024-10-22 22:35:34.620589
55555	23	2024-11-16 09:00:00	2024-11-16 10:00:00	f	2024-10-22 22:35:34.62311	2024-10-22 22:35:34.62311
55556	23	2024-11-16 10:00:00	2024-11-16 11:00:00	f	2024-10-22 22:35:34.626063	2024-10-22 22:35:34.626063
55557	23	2024-11-16 11:00:00	2024-11-16 12:00:00	f	2024-10-22 22:35:34.628711	2024-10-22 22:35:34.628711
55558	23	2024-11-16 12:00:00	2024-11-16 13:00:00	f	2024-10-22 22:35:34.631943	2024-10-22 22:35:34.631943
55559	23	2024-11-16 13:00:00	2024-11-16 14:00:00	f	2024-10-22 22:35:34.634031	2024-10-22 22:35:34.634031
55560	23	2024-11-16 14:00:00	2024-11-16 15:00:00	f	2024-10-22 22:35:34.636694	2024-10-22 22:35:34.636694
55561	23	2024-11-16 15:00:00	2024-11-16 16:00:00	f	2024-10-22 22:35:34.639367	2024-10-22 22:35:34.639367
55562	23	2024-11-16 16:00:00	2024-11-16 17:00:00	f	2024-10-22 22:35:34.641946	2024-10-22 22:35:34.641946
55563	23	2024-11-16 17:00:00	2024-11-16 18:00:00	f	2024-10-22 22:35:34.64502	2024-10-22 22:35:34.64502
55564	23	2024-11-16 18:00:00	2024-11-16 19:00:00	f	2024-10-22 22:35:34.647317	2024-10-22 22:35:34.647317
55565	23	2024-11-16 19:00:00	2024-11-16 20:00:00	f	2024-10-22 22:35:34.649271	2024-10-22 22:35:34.649271
55566	23	2024-11-16 20:00:00	2024-11-16 21:00:00	f	2024-10-22 22:35:34.652925	2024-10-22 22:35:34.652925
55567	23	2024-11-18 09:00:00	2024-11-18 10:00:00	f	2024-10-22 22:35:34.655225	2024-10-22 22:35:34.655225
55568	23	2024-11-18 10:00:00	2024-11-18 11:00:00	f	2024-10-22 22:35:34.658262	2024-10-22 22:35:34.658262
55569	23	2024-11-18 11:00:00	2024-11-18 12:00:00	f	2024-10-22 22:35:34.661311	2024-10-22 22:35:34.661311
55570	23	2024-11-18 12:00:00	2024-11-18 13:00:00	f	2024-10-22 22:35:34.663987	2024-10-22 22:35:34.663987
55571	23	2024-11-18 13:00:00	2024-11-18 14:00:00	f	2024-10-22 22:35:34.6668	2024-10-22 22:35:34.6668
55572	23	2024-11-18 14:00:00	2024-11-18 15:00:00	f	2024-10-22 22:35:34.668957	2024-10-22 22:35:34.668957
55573	23	2024-11-18 15:00:00	2024-11-18 16:00:00	f	2024-10-22 22:35:34.671142	2024-10-22 22:35:34.671142
55574	23	2024-11-18 16:00:00	2024-11-18 17:00:00	f	2024-10-22 22:35:34.674523	2024-10-22 22:35:34.674523
55575	23	2024-11-18 17:00:00	2024-11-18 18:00:00	f	2024-10-22 22:35:34.676662	2024-10-22 22:35:34.676662
55576	23	2024-11-18 18:00:00	2024-11-18 19:00:00	f	2024-10-22 22:35:34.679486	2024-10-22 22:35:34.679486
55577	23	2024-11-18 19:00:00	2024-11-18 20:00:00	f	2024-10-22 22:35:34.681988	2024-10-22 22:35:34.681988
55578	23	2024-11-18 20:00:00	2024-11-18 21:00:00	f	2024-10-22 22:35:34.68454	2024-10-22 22:35:34.68454
55579	23	2024-11-19 09:00:00	2024-11-19 10:00:00	f	2024-10-22 22:35:34.687849	2024-10-22 22:35:34.687849
55580	23	2024-11-19 10:00:00	2024-11-19 11:00:00	f	2024-10-22 22:35:34.69018	2024-10-22 22:35:34.69018
55581	23	2024-11-19 11:00:00	2024-11-19 12:00:00	f	2024-10-22 22:35:34.692648	2024-10-22 22:35:34.692648
55582	23	2024-11-19 12:00:00	2024-11-19 13:00:00	f	2024-10-22 22:35:34.695263	2024-10-22 22:35:34.695263
55583	23	2024-11-19 13:00:00	2024-11-19 14:00:00	f	2024-10-22 22:35:34.69725	2024-10-22 22:35:34.69725
55584	23	2024-11-19 14:00:00	2024-11-19 15:00:00	f	2024-10-22 22:35:34.700049	2024-10-22 22:35:34.700049
55585	23	2024-11-19 15:00:00	2024-11-19 16:00:00	f	2024-10-22 22:35:34.706655	2024-10-22 22:35:34.706655
55586	23	2024-11-19 16:00:00	2024-11-19 17:00:00	f	2024-10-22 22:35:34.709217	2024-10-22 22:35:34.709217
55587	23	2024-11-19 17:00:00	2024-11-19 18:00:00	f	2024-10-22 22:35:34.711041	2024-10-22 22:35:34.711041
55588	23	2024-11-19 18:00:00	2024-11-19 19:00:00	f	2024-10-22 22:35:34.713611	2024-10-22 22:35:34.713611
55589	23	2024-11-19 19:00:00	2024-11-19 20:00:00	f	2024-10-22 22:35:34.716429	2024-10-22 22:35:34.716429
55590	23	2024-11-19 20:00:00	2024-11-19 21:00:00	f	2024-10-22 22:35:34.718955	2024-10-22 22:35:34.718955
55591	23	2024-11-20 09:00:00	2024-11-20 10:00:00	f	2024-10-22 22:35:34.721965	2024-10-22 22:35:34.721965
55592	23	2024-11-20 10:00:00	2024-11-20 11:00:00	f	2024-10-22 22:35:34.72392	2024-10-22 22:35:34.72392
55593	23	2024-11-20 11:00:00	2024-11-20 12:00:00	f	2024-10-22 22:35:34.726108	2024-10-22 22:35:34.726108
55594	23	2024-11-20 12:00:00	2024-11-20 13:00:00	f	2024-10-22 22:35:34.728685	2024-10-22 22:35:34.728685
55595	23	2024-11-20 13:00:00	2024-11-20 14:00:00	f	2024-10-22 22:35:34.730831	2024-10-22 22:35:34.730831
55596	23	2024-11-20 14:00:00	2024-11-20 15:00:00	f	2024-10-22 22:35:34.732797	2024-10-22 22:35:34.732797
55597	23	2024-11-20 15:00:00	2024-11-20 16:00:00	f	2024-10-22 22:35:34.736408	2024-10-22 22:35:34.736408
55598	23	2024-11-20 16:00:00	2024-11-20 17:00:00	f	2024-10-22 22:35:34.738839	2024-10-22 22:35:34.738839
55599	23	2024-11-20 17:00:00	2024-11-20 18:00:00	f	2024-10-22 22:35:34.741291	2024-10-22 22:35:34.741291
55600	23	2024-11-20 18:00:00	2024-11-20 19:00:00	f	2024-10-22 22:35:34.744003	2024-10-22 22:35:34.744003
55601	23	2024-11-20 19:00:00	2024-11-20 20:00:00	f	2024-10-22 22:35:34.746284	2024-10-22 22:35:34.746284
55602	23	2024-11-20 20:00:00	2024-11-20 21:00:00	f	2024-10-22 22:35:34.750081	2024-10-22 22:35:34.750081
55603	23	2024-11-21 09:00:00	2024-11-21 10:00:00	f	2024-10-22 22:35:34.752392	2024-10-22 22:35:34.752392
55604	23	2024-11-21 10:00:00	2024-11-21 11:00:00	f	2024-10-22 22:35:34.754534	2024-10-22 22:35:34.754534
55605	23	2024-11-21 11:00:00	2024-11-21 12:00:00	f	2024-10-22 22:35:34.757288	2024-10-22 22:35:34.757288
55606	23	2024-11-21 12:00:00	2024-11-21 13:00:00	f	2024-10-22 22:35:34.759342	2024-10-22 22:35:34.759342
55607	23	2024-11-21 13:00:00	2024-11-21 14:00:00	f	2024-10-22 22:35:34.761539	2024-10-22 22:35:34.761539
55608	23	2024-11-21 14:00:00	2024-11-21 15:00:00	f	2024-10-22 22:35:34.764381	2024-10-22 22:35:34.764381
55609	23	2024-11-21 15:00:00	2024-11-21 16:00:00	f	2024-10-22 22:35:34.767332	2024-10-22 22:35:34.767332
55610	23	2024-11-21 16:00:00	2024-11-21 17:00:00	f	2024-10-22 22:35:34.770582	2024-10-22 22:35:34.770582
55611	23	2024-11-21 17:00:00	2024-11-21 18:00:00	f	2024-10-22 22:35:34.773068	2024-10-22 22:35:34.773068
55612	23	2024-11-21 18:00:00	2024-11-21 19:00:00	f	2024-10-22 22:35:34.775849	2024-10-22 22:35:34.775849
55613	23	2024-11-21 19:00:00	2024-11-21 20:00:00	f	2024-10-22 22:35:34.778984	2024-10-22 22:35:34.778984
55614	23	2024-11-21 20:00:00	2024-11-21 21:00:00	f	2024-10-22 22:35:34.781885	2024-10-22 22:35:34.781885
55615	23	2024-11-22 09:00:00	2024-11-22 10:00:00	f	2024-10-22 22:35:34.78503	2024-10-22 22:35:34.78503
55616	23	2024-11-22 10:00:00	2024-11-22 11:00:00	f	2024-10-22 22:35:34.787089	2024-10-22 22:35:34.787089
55617	23	2024-11-22 11:00:00	2024-11-22 12:00:00	f	2024-10-22 22:35:34.789279	2024-10-22 22:35:34.789279
55618	23	2024-11-22 12:00:00	2024-11-22 13:00:00	f	2024-10-22 22:35:34.791813	2024-10-22 22:35:34.791813
55619	23	2024-11-22 13:00:00	2024-11-22 14:00:00	f	2024-10-22 22:35:34.794016	2024-10-22 22:35:34.794016
55620	23	2024-11-22 14:00:00	2024-11-22 15:00:00	f	2024-10-22 22:35:34.796412	2024-10-22 22:35:34.796412
55621	23	2024-11-22 15:00:00	2024-11-22 16:00:00	f	2024-10-22 22:35:34.798812	2024-10-22 22:35:34.798812
55622	23	2024-11-22 16:00:00	2024-11-22 17:00:00	f	2024-10-22 22:35:34.801023	2024-10-22 22:35:34.801023
55623	23	2024-11-22 17:00:00	2024-11-22 18:00:00	f	2024-10-22 22:35:34.803856	2024-10-22 22:35:34.803856
55624	23	2024-11-22 18:00:00	2024-11-22 19:00:00	f	2024-10-22 22:35:34.807645	2024-10-22 22:35:34.807645
55625	23	2024-11-22 19:00:00	2024-11-22 20:00:00	f	2024-10-22 22:35:34.810523	2024-10-22 22:35:34.810523
55626	23	2024-11-22 20:00:00	2024-11-22 21:00:00	f	2024-10-22 22:35:34.813061	2024-10-22 22:35:34.813061
55627	23	2024-11-23 09:00:00	2024-11-23 10:00:00	f	2024-10-22 22:35:34.815204	2024-10-22 22:35:34.815204
55628	23	2024-11-23 10:00:00	2024-11-23 11:00:00	f	2024-10-22 22:35:34.817728	2024-10-22 22:35:34.817728
55629	23	2024-11-23 11:00:00	2024-11-23 12:00:00	f	2024-10-22 22:35:34.820382	2024-10-22 22:35:34.820382
55630	23	2024-11-23 12:00:00	2024-11-23 13:00:00	f	2024-10-22 22:35:34.822509	2024-10-22 22:35:34.822509
55631	23	2024-11-23 13:00:00	2024-11-23 14:00:00	f	2024-10-22 22:35:34.825446	2024-10-22 22:35:34.825446
55632	23	2024-11-23 14:00:00	2024-11-23 15:00:00	f	2024-10-22 22:35:34.827757	2024-10-22 22:35:34.827757
55633	23	2024-11-23 15:00:00	2024-11-23 16:00:00	f	2024-10-22 22:35:34.830019	2024-10-22 22:35:34.830019
55634	23	2024-11-23 16:00:00	2024-11-23 17:00:00	f	2024-10-22 22:35:34.833308	2024-10-22 22:35:34.833308
55635	23	2024-11-23 17:00:00	2024-11-23 18:00:00	f	2024-10-22 22:35:34.835633	2024-10-22 22:35:34.835633
55636	23	2024-11-23 18:00:00	2024-11-23 19:00:00	f	2024-10-22 22:35:34.838468	2024-10-22 22:35:34.838468
55637	23	2024-11-23 19:00:00	2024-11-23 20:00:00	f	2024-10-22 22:35:34.842002	2024-10-22 22:35:34.842002
55638	23	2024-11-23 20:00:00	2024-11-23 21:00:00	f	2024-10-22 22:35:34.844536	2024-10-22 22:35:34.844536
55639	23	2024-11-25 09:00:00	2024-11-25 10:00:00	f	2024-10-22 22:35:34.848637	2024-10-22 22:35:34.848637
55640	23	2024-11-25 10:00:00	2024-11-25 11:00:00	f	2024-10-22 22:35:34.853282	2024-10-22 22:35:34.853282
55641	23	2024-11-25 11:00:00	2024-11-25 12:00:00	f	2024-10-22 22:35:34.85617	2024-10-22 22:35:34.85617
55642	23	2024-11-25 12:00:00	2024-11-25 13:00:00	f	2024-10-22 22:35:34.858743	2024-10-22 22:35:34.858743
55643	23	2024-11-25 13:00:00	2024-11-25 14:00:00	f	2024-10-22 22:35:34.861712	2024-10-22 22:35:34.861712
55644	23	2024-11-25 14:00:00	2024-11-25 15:00:00	f	2024-10-22 22:35:34.863663	2024-10-22 22:35:34.863663
55645	23	2024-11-25 15:00:00	2024-11-25 16:00:00	f	2024-10-22 22:35:34.866035	2024-10-22 22:35:34.866035
55646	23	2024-11-25 16:00:00	2024-11-25 17:00:00	f	2024-10-22 22:35:34.869089	2024-10-22 22:35:34.869089
55647	23	2024-11-25 17:00:00	2024-11-25 18:00:00	f	2024-10-22 22:35:34.872219	2024-10-22 22:35:34.872219
55648	23	2024-11-25 18:00:00	2024-11-25 19:00:00	f	2024-10-22 22:35:34.875046	2024-10-22 22:35:34.875046
55649	23	2024-11-25 19:00:00	2024-11-25 20:00:00	f	2024-10-22 22:35:34.87703	2024-10-22 22:35:34.87703
55650	23	2024-11-25 20:00:00	2024-11-25 21:00:00	f	2024-10-22 22:35:34.87939	2024-10-22 22:35:34.87939
55651	23	2024-11-26 09:00:00	2024-11-26 10:00:00	f	2024-10-22 22:35:34.882279	2024-10-22 22:35:34.882279
55652	23	2024-11-26 10:00:00	2024-11-26 11:00:00	f	2024-10-22 22:35:34.884662	2024-10-22 22:35:34.884662
55653	23	2024-11-26 11:00:00	2024-11-26 12:00:00	f	2024-10-22 22:35:34.888067	2024-10-22 22:35:34.888067
55654	23	2024-11-26 12:00:00	2024-11-26 13:00:00	f	2024-10-22 22:35:34.890715	2024-10-22 22:35:34.890715
55655	23	2024-11-26 13:00:00	2024-11-26 14:00:00	f	2024-10-22 22:35:34.893222	2024-10-22 22:35:34.893222
55656	23	2024-11-26 14:00:00	2024-11-26 15:00:00	f	2024-10-22 22:35:34.89632	2024-10-22 22:35:34.89632
55657	23	2024-11-26 15:00:00	2024-11-26 16:00:00	f	2024-10-22 22:35:34.898295	2024-10-22 22:35:34.898295
55658	23	2024-11-26 16:00:00	2024-11-26 17:00:00	f	2024-10-22 22:35:34.900362	2024-10-22 22:35:34.900362
55659	23	2024-11-26 17:00:00	2024-11-26 18:00:00	f	2024-10-22 22:35:34.902957	2024-10-22 22:35:34.902957
55660	23	2024-11-26 18:00:00	2024-11-26 19:00:00	f	2024-10-22 22:35:34.905119	2024-10-22 22:35:34.905119
55661	23	2024-11-26 19:00:00	2024-11-26 20:00:00	f	2024-10-22 22:35:34.907957	2024-10-22 22:35:34.907957
55662	23	2024-11-26 20:00:00	2024-11-26 21:00:00	f	2024-10-22 22:35:34.911916	2024-10-22 22:35:34.911916
55663	23	2024-11-27 09:00:00	2024-11-27 10:00:00	f	2024-10-22 22:35:34.914753	2024-10-22 22:35:34.914753
55664	23	2024-11-27 10:00:00	2024-11-27 11:00:00	f	2024-10-22 22:35:34.917923	2024-10-22 22:35:34.917923
55665	23	2024-11-27 11:00:00	2024-11-27 12:00:00	f	2024-10-22 22:35:34.919828	2024-10-22 22:35:34.919828
55666	23	2024-11-27 12:00:00	2024-11-27 13:00:00	f	2024-10-22 22:35:34.92339	2024-10-22 22:35:34.92339
55667	23	2024-11-27 13:00:00	2024-11-27 14:00:00	f	2024-10-22 22:35:34.925749	2024-10-22 22:35:34.925749
55668	23	2024-11-27 14:00:00	2024-11-27 15:00:00	f	2024-10-22 22:35:34.928573	2024-10-22 22:35:34.928573
55669	23	2024-11-27 15:00:00	2024-11-27 16:00:00	f	2024-10-22 22:35:34.931155	2024-10-22 22:35:34.931155
55670	23	2024-11-27 16:00:00	2024-11-27 17:00:00	f	2024-10-22 22:35:34.933386	2024-10-22 22:35:34.933386
55671	23	2024-11-27 17:00:00	2024-11-27 18:00:00	f	2024-10-22 22:35:34.936249	2024-10-22 22:35:34.936249
55672	23	2024-11-27 18:00:00	2024-11-27 19:00:00	f	2024-10-22 22:35:34.939428	2024-10-22 22:35:34.939428
55673	23	2024-11-27 19:00:00	2024-11-27 20:00:00	f	2024-10-22 22:35:34.942272	2024-10-22 22:35:34.942272
55674	23	2024-11-27 20:00:00	2024-11-27 21:00:00	f	2024-10-22 22:35:34.945045	2024-10-22 22:35:34.945045
55675	23	2024-11-28 09:00:00	2024-11-28 10:00:00	f	2024-10-22 22:35:34.947238	2024-10-22 22:35:34.947238
55676	23	2024-11-28 10:00:00	2024-11-28 11:00:00	f	2024-10-22 22:35:34.949729	2024-10-22 22:35:34.949729
55677	23	2024-11-28 11:00:00	2024-11-28 12:00:00	f	2024-10-22 22:35:34.952386	2024-10-22 22:35:34.952386
55678	23	2024-11-28 12:00:00	2024-11-28 13:00:00	f	2024-10-22 22:35:34.954584	2024-10-22 22:35:34.954584
55679	23	2024-11-28 13:00:00	2024-11-28 14:00:00	f	2024-10-22 22:35:34.957743	2024-10-22 22:35:34.957743
55680	23	2024-11-28 14:00:00	2024-11-28 15:00:00	f	2024-10-22 22:35:34.959891	2024-10-22 22:35:34.959891
55681	23	2024-11-28 15:00:00	2024-11-28 16:00:00	f	2024-10-22 22:35:34.962178	2024-10-22 22:35:34.962178
55682	23	2024-11-28 16:00:00	2024-11-28 17:00:00	f	2024-10-22 22:35:34.965011	2024-10-22 22:35:34.965011
55683	23	2024-11-28 17:00:00	2024-11-28 18:00:00	f	2024-10-22 22:35:34.967134	2024-10-22 22:35:34.967134
55684	23	2024-11-28 18:00:00	2024-11-28 19:00:00	f	2024-10-22 22:35:34.969689	2024-10-22 22:35:34.969689
55685	23	2024-11-28 19:00:00	2024-11-28 20:00:00	f	2024-10-22 22:35:34.97328	2024-10-22 22:35:34.97328
55686	23	2024-11-28 20:00:00	2024-11-28 21:00:00	f	2024-10-22 22:35:34.975455	2024-10-22 22:35:34.975455
55687	23	2024-11-29 09:00:00	2024-11-29 10:00:00	f	2024-10-22 22:35:34.978615	2024-10-22 22:35:34.978615
55688	23	2024-11-29 10:00:00	2024-11-29 11:00:00	f	2024-10-22 22:35:34.981182	2024-10-22 22:35:34.981182
55689	23	2024-11-29 11:00:00	2024-11-29 12:00:00	f	2024-10-22 22:35:34.987663	2024-10-22 22:35:34.987663
55690	23	2024-11-29 12:00:00	2024-11-29 13:00:00	f	2024-10-22 22:35:34.989856	2024-10-22 22:35:34.989856
55691	23	2024-11-29 13:00:00	2024-11-29 14:00:00	f	2024-10-22 22:35:34.992569	2024-10-22 22:35:34.992569
55692	23	2024-11-29 14:00:00	2024-11-29 15:00:00	f	2024-10-22 22:35:34.994806	2024-10-22 22:35:34.994806
55693	23	2024-11-29 15:00:00	2024-11-29 16:00:00	f	2024-10-22 22:35:34.996988	2024-10-22 22:35:34.996988
55694	23	2024-11-29 16:00:00	2024-11-29 17:00:00	f	2024-10-22 22:35:35.001206	2024-10-22 22:35:35.001206
55695	23	2024-11-29 17:00:00	2024-11-29 18:00:00	f	2024-10-22 22:35:35.003883	2024-10-22 22:35:35.003883
55696	23	2024-11-29 18:00:00	2024-11-29 19:00:00	f	2024-10-22 22:35:35.007631	2024-10-22 22:35:35.007631
55697	23	2024-11-29 19:00:00	2024-11-29 20:00:00	f	2024-10-22 22:35:35.00983	2024-10-22 22:35:35.00983
55698	23	2024-11-29 20:00:00	2024-11-29 21:00:00	f	2024-10-22 22:35:35.012271	2024-10-22 22:35:35.012271
55699	23	2024-11-30 09:00:00	2024-11-30 10:00:00	f	2024-10-22 22:35:35.014838	2024-10-22 22:35:35.014838
55700	23	2024-11-30 10:00:00	2024-11-30 11:00:00	f	2024-10-22 22:35:35.01723	2024-10-22 22:35:35.01723
55701	23	2024-11-30 11:00:00	2024-11-30 12:00:00	f	2024-10-22 22:35:35.020499	2024-10-22 22:35:35.020499
55702	23	2024-11-30 12:00:00	2024-11-30 13:00:00	f	2024-10-22 22:35:35.022676	2024-10-22 22:35:35.022676
55703	23	2024-11-30 13:00:00	2024-11-30 14:00:00	f	2024-10-22 22:35:35.02469	2024-10-22 22:35:35.02469
55704	23	2024-11-30 14:00:00	2024-11-30 15:00:00	f	2024-10-22 22:35:35.027603	2024-10-22 22:35:35.027603
55705	23	2024-11-30 15:00:00	2024-11-30 16:00:00	f	2024-10-22 22:35:35.029585	2024-10-22 22:35:35.029585
55706	23	2024-11-30 16:00:00	2024-11-30 17:00:00	f	2024-10-22 22:35:35.031804	2024-10-22 22:35:35.031804
55707	23	2024-11-30 17:00:00	2024-11-30 18:00:00	f	2024-10-22 22:35:35.034511	2024-10-22 22:35:35.034511
55708	23	2024-11-30 18:00:00	2024-11-30 19:00:00	f	2024-10-22 22:35:35.037493	2024-10-22 22:35:35.037493
55709	23	2024-11-30 19:00:00	2024-11-30 20:00:00	f	2024-10-22 22:35:35.042059	2024-10-22 22:35:35.042059
55710	23	2024-11-30 20:00:00	2024-11-30 21:00:00	f	2024-10-22 22:35:35.044642	2024-10-22 22:35:35.044642
55711	23	2024-12-02 09:00:00	2024-12-02 10:00:00	f	2024-10-22 22:35:35.049294	2024-10-22 22:35:35.049294
55712	23	2024-12-02 10:00:00	2024-12-02 11:00:00	f	2024-10-22 22:35:35.051314	2024-10-22 22:35:35.051314
55713	23	2024-12-02 11:00:00	2024-12-02 12:00:00	f	2024-10-22 22:35:35.053512	2024-10-22 22:35:35.053512
55714	23	2024-12-02 12:00:00	2024-12-02 13:00:00	f	2024-10-22 22:35:35.055875	2024-10-22 22:35:35.055875
55715	23	2024-12-02 13:00:00	2024-12-02 14:00:00	f	2024-10-22 22:35:35.058031	2024-10-22 22:35:35.058031
55716	23	2024-12-02 14:00:00	2024-12-02 15:00:00	f	2024-10-22 22:35:35.060116	2024-10-22 22:35:35.060116
55717	23	2024-12-02 15:00:00	2024-12-02 16:00:00	f	2024-10-22 22:35:35.063289	2024-10-22 22:35:35.063289
55718	23	2024-12-02 16:00:00	2024-12-02 17:00:00	f	2024-10-22 22:35:35.065603	2024-10-22 22:35:35.065603
55719	23	2024-12-02 17:00:00	2024-12-02 18:00:00	f	2024-10-22 22:35:35.068526	2024-10-22 22:35:35.068526
55720	23	2024-12-02 18:00:00	2024-12-02 19:00:00	f	2024-10-22 22:35:35.071222	2024-10-22 22:35:35.071222
55721	23	2024-12-02 19:00:00	2024-12-02 20:00:00	f	2024-10-22 22:35:35.073761	2024-10-22 22:35:35.073761
55722	23	2024-12-02 20:00:00	2024-12-02 21:00:00	f	2024-10-22 22:35:35.07712	2024-10-22 22:35:35.07712
55723	23	2024-12-03 09:00:00	2024-12-03 10:00:00	f	2024-10-22 22:35:35.079786	2024-10-22 22:35:35.079786
55724	23	2024-12-03 10:00:00	2024-12-03 11:00:00	f	2024-10-22 22:35:35.083087	2024-10-22 22:35:35.083087
55725	23	2024-12-03 11:00:00	2024-12-03 12:00:00	f	2024-10-22 22:35:35.085254	2024-10-22 22:35:35.085254
55726	23	2024-12-03 12:00:00	2024-12-03 13:00:00	f	2024-10-22 22:35:35.08782	2024-10-22 22:35:35.08782
55727	23	2024-12-03 13:00:00	2024-12-03 14:00:00	f	2024-10-22 22:35:35.090425	2024-10-22 22:35:35.090425
55728	23	2024-12-03 14:00:00	2024-12-03 15:00:00	f	2024-10-22 22:35:35.092539	2024-10-22 22:35:35.092539
55729	23	2024-12-03 15:00:00	2024-12-03 16:00:00	f	2024-10-22 22:35:35.094798	2024-10-22 22:35:35.094798
55730	23	2024-12-03 16:00:00	2024-12-03 17:00:00	f	2024-10-22 22:35:35.097661	2024-10-22 22:35:35.097661
55731	23	2024-12-03 17:00:00	2024-12-03 18:00:00	f	2024-10-22 22:35:35.099993	2024-10-22 22:35:35.099993
55732	23	2024-12-03 18:00:00	2024-12-03 19:00:00	f	2024-10-22 22:35:35.102428	2024-10-22 22:35:35.102428
55733	23	2024-12-03 19:00:00	2024-12-03 20:00:00	f	2024-10-22 22:35:35.104988	2024-10-22 22:35:35.104988
55734	23	2024-12-03 20:00:00	2024-12-03 21:00:00	f	2024-10-22 22:35:35.107168	2024-10-22 22:35:35.107168
55735	23	2024-12-04 09:00:00	2024-12-04 10:00:00	f	2024-10-22 22:35:35.110125	2024-10-22 22:35:35.110125
55736	23	2024-12-04 10:00:00	2024-12-04 11:00:00	f	2024-10-22 22:35:35.11247	2024-10-22 22:35:35.11247
55737	23	2024-12-04 11:00:00	2024-12-04 12:00:00	f	2024-10-22 22:35:35.114472	2024-10-22 22:35:35.114472
55738	23	2024-12-04 12:00:00	2024-12-04 13:00:00	f	2024-10-22 22:35:35.11768	2024-10-22 22:35:35.11768
55739	23	2024-12-04 13:00:00	2024-12-04 14:00:00	f	2024-10-22 22:35:35.120145	2024-10-22 22:35:35.120145
55740	23	2024-12-04 14:00:00	2024-12-04 15:00:00	f	2024-10-22 22:35:35.122491	2024-10-22 22:35:35.122491
55741	23	2024-12-04 15:00:00	2024-12-04 16:00:00	f	2024-10-22 22:35:35.125856	2024-10-22 22:35:35.125856
55742	23	2024-12-04 16:00:00	2024-12-04 17:00:00	f	2024-10-22 22:35:35.127942	2024-10-22 22:35:35.127942
55743	23	2024-12-04 17:00:00	2024-12-04 18:00:00	f	2024-10-22 22:35:35.130959	2024-10-22 22:35:35.130959
55744	23	2024-12-04 18:00:00	2024-12-04 19:00:00	f	2024-10-22 22:35:35.133769	2024-10-22 22:35:35.133769
55745	23	2024-12-04 19:00:00	2024-12-04 20:00:00	f	2024-10-22 22:35:35.136378	2024-10-22 22:35:35.136378
55746	23	2024-12-04 20:00:00	2024-12-04 21:00:00	f	2024-10-22 22:35:35.138973	2024-10-22 22:35:35.138973
55747	23	2024-12-05 09:00:00	2024-12-05 10:00:00	f	2024-10-22 22:35:35.141219	2024-10-22 22:35:35.141219
55748	23	2024-12-05 10:00:00	2024-12-05 11:00:00	f	2024-10-22 22:35:35.143859	2024-10-22 22:35:35.143859
55749	23	2024-12-05 11:00:00	2024-12-05 12:00:00	f	2024-10-22 22:35:35.146808	2024-10-22 22:35:35.146808
55750	23	2024-12-05 12:00:00	2024-12-05 13:00:00	f	2024-10-22 22:35:35.149425	2024-10-22 22:35:35.149425
55751	23	2024-12-05 13:00:00	2024-12-05 14:00:00	f	2024-10-22 22:35:35.152851	2024-10-22 22:35:35.152851
55752	23	2024-12-05 14:00:00	2024-12-05 15:00:00	f	2024-10-22 22:35:35.155051	2024-10-22 22:35:35.155051
55753	23	2024-12-05 15:00:00	2024-12-05 16:00:00	f	2024-10-22 22:35:35.157345	2024-10-22 22:35:35.157345
55754	23	2024-12-05 16:00:00	2024-12-05 17:00:00	f	2024-10-22 22:35:35.160161	2024-10-22 22:35:35.160161
55755	23	2024-12-05 17:00:00	2024-12-05 18:00:00	f	2024-10-22 22:35:35.162424	2024-10-22 22:35:35.162424
55756	23	2024-12-05 18:00:00	2024-12-05 19:00:00	f	2024-10-22 22:35:35.165737	2024-10-22 22:35:35.165737
55757	23	2024-12-05 19:00:00	2024-12-05 20:00:00	f	2024-10-22 22:35:35.16826	2024-10-22 22:35:35.16826
55758	23	2024-12-05 20:00:00	2024-12-05 21:00:00	f	2024-10-22 22:35:35.170337	2024-10-22 22:35:35.170337
55759	23	2024-12-06 09:00:00	2024-12-06 10:00:00	f	2024-10-22 22:35:35.173326	2024-10-22 22:35:35.173326
55760	23	2024-12-06 10:00:00	2024-12-06 11:00:00	f	2024-10-22 22:35:35.175381	2024-10-22 22:35:35.175381
55761	23	2024-12-06 11:00:00	2024-12-06 12:00:00	f	2024-10-22 22:35:35.17745	2024-10-22 22:35:35.17745
55762	23	2024-12-06 12:00:00	2024-12-06 13:00:00	f	2024-10-22 22:35:35.181446	2024-10-22 22:35:35.181446
55763	23	2024-12-06 13:00:00	2024-12-06 14:00:00	f	2024-10-22 22:35:35.184236	2024-10-22 22:35:35.184236
55764	23	2024-12-06 14:00:00	2024-12-06 15:00:00	f	2024-10-22 22:35:35.187492	2024-10-22 22:35:35.187492
55765	23	2024-12-06 15:00:00	2024-12-06 16:00:00	f	2024-10-22 22:35:35.19004	2024-10-22 22:35:35.19004
55766	23	2024-12-06 16:00:00	2024-12-06 17:00:00	f	2024-10-22 22:35:35.192895	2024-10-22 22:35:35.192895
55767	23	2024-12-06 17:00:00	2024-12-06 18:00:00	f	2024-10-22 22:35:35.195684	2024-10-22 22:35:35.195684
55768	23	2024-12-06 18:00:00	2024-12-06 19:00:00	f	2024-10-22 22:35:35.197564	2024-10-22 22:35:35.197564
55769	23	2024-12-06 19:00:00	2024-12-06 20:00:00	f	2024-10-22 22:35:35.2004	2024-10-22 22:35:35.2004
55770	23	2024-12-06 20:00:00	2024-12-06 21:00:00	f	2024-10-22 22:35:35.202764	2024-10-22 22:35:35.202764
55771	23	2024-12-07 09:00:00	2024-12-07 10:00:00	f	2024-10-22 22:35:35.204817	2024-10-22 22:35:35.204817
55772	23	2024-12-07 10:00:00	2024-12-07 11:00:00	f	2024-10-22 22:35:35.207678	2024-10-22 22:35:35.207678
55773	23	2024-12-07 11:00:00	2024-12-07 12:00:00	f	2024-10-22 22:35:35.210056	2024-10-22 22:35:35.210056
55774	23	2024-12-07 12:00:00	2024-12-07 13:00:00	f	2024-10-22 22:35:35.212132	2024-10-22 22:35:35.212132
55775	23	2024-12-07 13:00:00	2024-12-07 14:00:00	f	2024-10-22 22:35:35.215103	2024-10-22 22:35:35.215103
55776	23	2024-12-07 14:00:00	2024-12-07 15:00:00	f	2024-10-22 22:35:35.217528	2024-10-22 22:35:35.217528
55777	23	2024-12-07 15:00:00	2024-12-07 16:00:00	f	2024-10-22 22:35:35.221449	2024-10-22 22:35:35.221449
55778	23	2024-12-07 16:00:00	2024-12-07 17:00:00	f	2024-10-22 22:35:35.223987	2024-10-22 22:35:35.223987
55779	23	2024-12-07 17:00:00	2024-12-07 18:00:00	f	2024-10-22 22:35:35.226063	2024-10-22 22:35:35.226063
55780	23	2024-12-07 18:00:00	2024-12-07 19:00:00	f	2024-10-22 22:35:35.230112	2024-10-22 22:35:35.230112
55781	23	2024-12-07 19:00:00	2024-12-07 20:00:00	f	2024-10-22 22:35:35.23279	2024-10-22 22:35:35.23279
55782	23	2024-12-07 20:00:00	2024-12-07 21:00:00	f	2024-10-22 22:35:35.235957	2024-10-22 22:35:35.235957
55783	23	2024-12-09 09:00:00	2024-12-09 10:00:00	f	2024-10-22 22:35:35.238081	2024-10-22 22:35:35.238081
55784	23	2024-12-09 10:00:00	2024-12-09 11:00:00	f	2024-10-22 22:35:35.240618	2024-10-22 22:35:35.240618
55785	23	2024-12-09 11:00:00	2024-12-09 12:00:00	f	2024-10-22 22:35:35.243519	2024-10-22 22:35:35.243519
55786	23	2024-12-09 12:00:00	2024-12-09 13:00:00	f	2024-10-22 22:35:35.245815	2024-10-22 22:35:35.245815
55787	23	2024-12-09 13:00:00	2024-12-09 14:00:00	f	2024-10-22 22:35:35.249307	2024-10-22 22:35:35.249307
55788	23	2024-12-09 14:00:00	2024-12-09 15:00:00	f	2024-10-22 22:35:35.251814	2024-10-22 22:35:35.251814
55789	23	2024-12-09 15:00:00	2024-12-09 16:00:00	f	2024-10-22 22:35:35.253903	2024-10-22 22:35:35.253903
55790	23	2024-12-09 16:00:00	2024-12-09 17:00:00	f	2024-10-22 22:35:35.256864	2024-10-22 22:35:35.256864
55791	23	2024-12-09 17:00:00	2024-12-09 18:00:00	f	2024-10-22 22:35:35.259585	2024-10-22 22:35:35.259585
55792	23	2024-12-09 18:00:00	2024-12-09 19:00:00	f	2024-10-22 22:35:35.262292	2024-10-22 22:35:35.262292
55793	23	2024-12-09 19:00:00	2024-12-09 20:00:00	f	2024-10-22 22:35:35.267996	2024-10-22 22:35:35.267996
55794	23	2024-12-09 20:00:00	2024-12-09 21:00:00	f	2024-10-22 22:35:35.271347	2024-10-22 22:35:35.271347
55795	23	2024-12-10 09:00:00	2024-12-10 10:00:00	f	2024-10-22 22:35:35.273376	2024-10-22 22:35:35.273376
55796	23	2024-12-10 10:00:00	2024-12-10 11:00:00	f	2024-10-22 22:35:35.275366	2024-10-22 22:35:35.275366
55797	23	2024-12-10 11:00:00	2024-12-10 12:00:00	f	2024-10-22 22:35:35.277919	2024-10-22 22:35:35.277919
55798	23	2024-12-10 12:00:00	2024-12-10 13:00:00	f	2024-10-22 22:35:35.280099	2024-10-22 22:35:35.280099
55799	23	2024-12-10 13:00:00	2024-12-10 14:00:00	f	2024-10-22 22:35:35.282794	2024-10-22 22:35:35.282794
55800	23	2024-12-10 14:00:00	2024-12-10 15:00:00	f	2024-10-22 22:35:35.285759	2024-10-22 22:35:35.285759
55801	23	2024-12-10 15:00:00	2024-12-10 16:00:00	f	2024-10-22 22:35:35.287606	2024-10-22 22:35:35.287606
55802	23	2024-12-10 16:00:00	2024-12-10 17:00:00	f	2024-10-22 22:35:35.290081	2024-10-22 22:35:35.290081
55803	23	2024-12-10 17:00:00	2024-12-10 18:00:00	f	2024-10-22 22:35:35.292742	2024-10-22 22:35:35.292742
55804	23	2024-12-10 18:00:00	2024-12-10 19:00:00	f	2024-10-22 22:35:35.29497	2024-10-22 22:35:35.29497
55805	23	2024-12-10 19:00:00	2024-12-10 20:00:00	f	2024-10-22 22:35:35.298077	2024-10-22 22:35:35.298077
55806	23	2024-12-10 20:00:00	2024-12-10 21:00:00	f	2024-10-22 22:35:35.300973	2024-10-22 22:35:35.300973
55807	23	2024-12-11 09:00:00	2024-12-11 10:00:00	f	2024-10-22 22:35:35.304545	2024-10-22 22:35:35.304545
55808	23	2024-12-11 10:00:00	2024-12-11 11:00:00	f	2024-10-22 22:35:35.307367	2024-10-22 22:35:35.307367
55809	23	2024-12-11 11:00:00	2024-12-11 12:00:00	f	2024-10-22 22:35:35.309887	2024-10-22 22:35:35.309887
55810	23	2024-12-11 12:00:00	2024-12-11 13:00:00	f	2024-10-22 22:35:35.312847	2024-10-22 22:35:35.312847
55811	23	2024-12-11 13:00:00	2024-12-11 14:00:00	f	2024-10-22 22:35:35.314746	2024-10-22 22:35:35.314746
55812	23	2024-12-11 14:00:00	2024-12-11 15:00:00	f	2024-10-22 22:35:35.317348	2024-10-22 22:35:35.317348
55813	23	2024-12-11 15:00:00	2024-12-11 16:00:00	f	2024-10-22 22:35:35.320353	2024-10-22 22:35:35.320353
55814	23	2024-12-11 16:00:00	2024-12-11 17:00:00	f	2024-10-22 22:35:35.322661	2024-10-22 22:35:35.322661
55815	23	2024-12-11 17:00:00	2024-12-11 18:00:00	f	2024-10-22 22:35:35.325607	2024-10-22 22:35:35.325607
55816	23	2024-12-11 18:00:00	2024-12-11 19:00:00	f	2024-10-22 22:35:35.328034	2024-10-22 22:35:35.328034
55817	23	2024-12-11 19:00:00	2024-12-11 20:00:00	f	2024-10-22 22:35:35.33014	2024-10-22 22:35:35.33014
55818	23	2024-12-11 20:00:00	2024-12-11 21:00:00	f	2024-10-22 22:35:35.332959	2024-10-22 22:35:35.332959
55819	23	2024-12-12 09:00:00	2024-12-12 10:00:00	f	2024-10-22 22:35:35.335283	2024-10-22 22:35:35.335283
55820	23	2024-12-12 10:00:00	2024-12-12 11:00:00	f	2024-10-22 22:35:35.338502	2024-10-22 22:35:35.338502
55821	23	2024-12-12 11:00:00	2024-12-12 12:00:00	f	2024-10-22 22:35:35.342375	2024-10-22 22:35:35.342375
55822	23	2024-12-12 12:00:00	2024-12-12 13:00:00	f	2024-10-22 22:35:35.345341	2024-10-22 22:35:35.345341
55823	23	2024-12-12 13:00:00	2024-12-12 14:00:00	f	2024-10-22 22:35:35.34913	2024-10-22 22:35:35.34913
55824	23	2024-12-12 14:00:00	2024-12-12 15:00:00	f	2024-10-22 22:35:35.352269	2024-10-22 22:35:35.352269
55825	23	2024-12-12 15:00:00	2024-12-12 16:00:00	f	2024-10-22 22:35:35.355202	2024-10-22 22:35:35.355202
55826	23	2024-12-12 16:00:00	2024-12-12 17:00:00	f	2024-10-22 22:35:35.35708	2024-10-22 22:35:35.35708
55827	23	2024-12-12 17:00:00	2024-12-12 18:00:00	f	2024-10-22 22:35:35.359795	2024-10-22 22:35:35.359795
55828	23	2024-12-12 18:00:00	2024-12-12 19:00:00	f	2024-10-22 22:35:35.365169	2024-10-22 22:35:35.365169
55829	23	2024-12-12 19:00:00	2024-12-12 20:00:00	f	2024-10-22 22:35:35.371548	2024-10-22 22:35:35.371548
55830	23	2024-12-12 20:00:00	2024-12-12 21:00:00	f	2024-10-22 22:35:35.377109	2024-10-22 22:35:35.377109
55831	23	2024-12-13 09:00:00	2024-12-13 10:00:00	f	2024-10-22 22:35:35.382878	2024-10-22 22:35:35.382878
55832	23	2024-12-13 10:00:00	2024-12-13 11:00:00	f	2024-10-22 22:35:35.386908	2024-10-22 22:35:35.386908
55833	23	2024-12-13 11:00:00	2024-12-13 12:00:00	f	2024-10-22 22:35:35.391529	2024-10-22 22:35:35.391529
55834	23	2024-12-13 12:00:00	2024-12-13 13:00:00	f	2024-10-22 22:35:35.396766	2024-10-22 22:35:35.396766
55835	23	2024-12-13 13:00:00	2024-12-13 14:00:00	f	2024-10-22 22:35:35.402016	2024-10-22 22:35:35.402016
55836	23	2024-12-13 14:00:00	2024-12-13 15:00:00	f	2024-10-22 22:35:35.405785	2024-10-22 22:35:35.405785
55837	23	2024-12-13 15:00:00	2024-12-13 16:00:00	f	2024-10-22 22:35:35.411366	2024-10-22 22:35:35.411366
55838	23	2024-12-13 16:00:00	2024-12-13 17:00:00	f	2024-10-22 22:35:35.414438	2024-10-22 22:35:35.414438
55839	23	2024-12-13 17:00:00	2024-12-13 18:00:00	f	2024-10-22 22:35:35.417692	2024-10-22 22:35:35.417692
55840	23	2024-12-13 18:00:00	2024-12-13 19:00:00	f	2024-10-22 22:35:35.423244	2024-10-22 22:35:35.423244
55841	23	2024-12-13 19:00:00	2024-12-13 20:00:00	f	2024-10-22 22:35:35.431195	2024-10-22 22:35:35.431195
55842	23	2024-12-13 20:00:00	2024-12-13 21:00:00	f	2024-10-22 22:35:35.43678	2024-10-22 22:35:35.43678
55843	23	2024-12-14 09:00:00	2024-12-14 10:00:00	f	2024-10-22 22:35:35.440957	2024-10-22 22:35:35.440957
55844	23	2024-12-14 10:00:00	2024-12-14 11:00:00	f	2024-10-22 22:35:35.446293	2024-10-22 22:35:35.446293
55845	23	2024-12-14 11:00:00	2024-12-14 12:00:00	f	2024-10-22 22:35:35.450281	2024-10-22 22:35:35.450281
55846	23	2024-12-14 12:00:00	2024-12-14 13:00:00	f	2024-10-22 22:35:35.453199	2024-10-22 22:35:35.453199
55847	23	2024-12-14 13:00:00	2024-12-14 14:00:00	f	2024-10-22 22:35:35.456217	2024-10-22 22:35:35.456217
55848	23	2024-12-14 14:00:00	2024-12-14 15:00:00	f	2024-10-22 22:35:35.458933	2024-10-22 22:35:35.458933
55849	23	2024-12-14 15:00:00	2024-12-14 16:00:00	f	2024-10-22 22:35:35.461437	2024-10-22 22:35:35.461437
55850	23	2024-12-14 16:00:00	2024-12-14 17:00:00	f	2024-10-22 22:35:35.464556	2024-10-22 22:35:35.464556
55851	23	2024-12-14 17:00:00	2024-12-14 18:00:00	f	2024-10-22 22:35:35.466886	2024-10-22 22:35:35.466886
55852	23	2024-12-14 18:00:00	2024-12-14 19:00:00	f	2024-10-22 22:35:35.470211	2024-10-22 22:35:35.470211
55853	23	2024-12-14 19:00:00	2024-12-14 20:00:00	f	2024-10-22 22:35:35.473519	2024-10-22 22:35:35.473519
55854	23	2024-12-14 20:00:00	2024-12-14 21:00:00	f	2024-10-22 22:35:35.476381	2024-10-22 22:35:35.476381
55855	23	2024-12-16 09:00:00	2024-12-16 10:00:00	f	2024-10-22 22:35:35.47974	2024-10-22 22:35:35.47974
55856	23	2024-12-16 10:00:00	2024-12-16 11:00:00	f	2024-10-22 22:35:35.481657	2024-10-22 22:35:35.481657
55857	23	2024-12-16 11:00:00	2024-12-16 12:00:00	f	2024-10-22 22:35:35.484356	2024-10-22 22:35:35.484356
55858	23	2024-12-16 12:00:00	2024-12-16 13:00:00	f	2024-10-22 22:35:35.487064	2024-10-22 22:35:35.487064
55859	23	2024-12-16 13:00:00	2024-12-16 14:00:00	f	2024-10-22 22:35:35.489563	2024-10-22 22:35:35.489563
55860	23	2024-12-16 14:00:00	2024-12-16 15:00:00	f	2024-10-22 22:35:35.492822	2024-10-22 22:35:35.492822
55861	23	2024-12-16 15:00:00	2024-12-16 16:00:00	f	2024-10-22 22:35:35.495166	2024-10-22 22:35:35.495166
55862	23	2024-12-16 16:00:00	2024-12-16 17:00:00	f	2024-10-22 22:35:35.497848	2024-10-22 22:35:35.497848
55863	23	2024-12-16 17:00:00	2024-12-16 18:00:00	f	2024-10-22 22:35:35.500624	2024-10-22 22:35:35.500624
55864	23	2024-12-16 18:00:00	2024-12-16 19:00:00	f	2024-10-22 22:35:35.502787	2024-10-22 22:35:35.502787
55865	23	2024-12-16 19:00:00	2024-12-16 20:00:00	f	2024-10-22 22:35:35.505854	2024-10-22 22:35:35.505854
55866	23	2024-12-16 20:00:00	2024-12-16 21:00:00	f	2024-10-22 22:35:35.508251	2024-10-22 22:35:35.508251
55867	23	2024-12-17 09:00:00	2024-12-17 10:00:00	f	2024-10-22 22:35:35.510401	2024-10-22 22:35:35.510401
55868	23	2024-12-17 10:00:00	2024-12-17 11:00:00	f	2024-10-22 22:35:35.513454	2024-10-22 22:35:35.513454
55869	23	2024-12-17 11:00:00	2024-12-17 12:00:00	f	2024-10-22 22:35:35.515524	2024-10-22 22:35:35.515524
55870	23	2024-12-17 12:00:00	2024-12-17 13:00:00	f	2024-10-22 22:35:35.517614	2024-10-22 22:35:35.517614
55871	23	2024-12-17 13:00:00	2024-12-17 14:00:00	f	2024-10-22 22:35:35.520668	2024-10-22 22:35:35.520668
55872	23	2024-12-17 14:00:00	2024-12-17 15:00:00	f	2024-10-22 22:35:35.52291	2024-10-22 22:35:35.52291
55873	23	2024-12-17 15:00:00	2024-12-17 16:00:00	f	2024-10-22 22:35:35.525426	2024-10-22 22:35:35.525426
55874	23	2024-12-17 16:00:00	2024-12-17 17:00:00	f	2024-10-22 22:35:35.529224	2024-10-22 22:35:35.529224
55875	23	2024-12-17 17:00:00	2024-12-17 18:00:00	f	2024-10-22 22:35:35.53243	2024-10-22 22:35:35.53243
55876	23	2024-12-17 18:00:00	2024-12-17 19:00:00	f	2024-10-22 22:35:35.535759	2024-10-22 22:35:35.535759
55877	23	2024-12-17 19:00:00	2024-12-17 20:00:00	f	2024-10-22 22:35:35.537855	2024-10-22 22:35:35.537855
55878	23	2024-12-17 20:00:00	2024-12-17 21:00:00	f	2024-10-22 22:35:35.540792	2024-10-22 22:35:35.540792
55879	23	2024-12-18 09:00:00	2024-12-18 10:00:00	f	2024-10-22 22:35:35.543697	2024-10-22 22:35:35.543697
55880	23	2024-12-18 10:00:00	2024-12-18 11:00:00	f	2024-10-22 22:35:35.546432	2024-10-22 22:35:35.546432
55881	23	2024-12-18 11:00:00	2024-12-18 12:00:00	f	2024-10-22 22:35:35.549345	2024-10-22 22:35:35.549345
55882	23	2024-12-18 12:00:00	2024-12-18 13:00:00	f	2024-10-22 22:35:35.551355	2024-10-22 22:35:35.551355
55883	23	2024-12-18 13:00:00	2024-12-18 14:00:00	f	2024-10-22 22:35:35.554561	2024-10-22 22:35:35.554561
55884	23	2024-12-18 14:00:00	2024-12-18 15:00:00	f	2024-10-22 22:35:35.557138	2024-10-22 22:35:35.557138
55885	23	2024-12-18 15:00:00	2024-12-18 16:00:00	f	2024-10-22 22:35:35.561595	2024-10-22 22:35:35.561595
55886	23	2024-12-18 16:00:00	2024-12-18 17:00:00	f	2024-10-22 22:35:35.565331	2024-10-22 22:35:35.565331
55887	23	2024-12-18 17:00:00	2024-12-18 18:00:00	f	2024-10-22 22:35:35.568777	2024-10-22 22:35:35.568777
55888	23	2024-12-18 18:00:00	2024-12-18 19:00:00	f	2024-10-22 22:35:35.571134	2024-10-22 22:35:35.571134
55889	23	2024-12-18 19:00:00	2024-12-18 20:00:00	f	2024-10-22 22:35:35.57442	2024-10-22 22:35:35.57442
55890	23	2024-12-18 20:00:00	2024-12-18 21:00:00	f	2024-10-22 22:35:35.577274	2024-10-22 22:35:35.577274
55891	23	2024-12-19 09:00:00	2024-12-19 10:00:00	f	2024-10-22 22:35:35.57944	2024-10-22 22:35:35.57944
55892	23	2024-12-19 10:00:00	2024-12-19 11:00:00	f	2024-10-22 22:35:35.582365	2024-10-22 22:35:35.582365
55893	23	2024-12-19 11:00:00	2024-12-19 12:00:00	f	2024-10-22 22:35:35.584748	2024-10-22 22:35:35.584748
55894	23	2024-12-19 12:00:00	2024-12-19 13:00:00	f	2024-10-22 22:35:35.586671	2024-10-22 22:35:35.586671
55895	23	2024-12-19 13:00:00	2024-12-19 14:00:00	f	2024-10-22 22:35:35.591103	2024-10-22 22:35:35.591103
55896	23	2024-12-19 14:00:00	2024-12-19 15:00:00	f	2024-10-22 22:35:35.593621	2024-10-22 22:35:35.593621
55897	23	2024-12-19 15:00:00	2024-12-19 16:00:00	f	2024-10-22 22:35:35.600657	2024-10-22 22:35:35.600657
55898	23	2024-12-19 16:00:00	2024-12-19 17:00:00	f	2024-10-22 22:35:35.603703	2024-10-22 22:35:35.603703
55899	23	2024-12-19 17:00:00	2024-12-19 18:00:00	f	2024-10-22 22:35:35.605811	2024-10-22 22:35:35.605811
55900	23	2024-12-19 18:00:00	2024-12-19 19:00:00	f	2024-10-22 22:35:35.608064	2024-10-22 22:35:35.608064
55901	23	2024-12-19 19:00:00	2024-12-19 20:00:00	f	2024-10-22 22:35:35.611103	2024-10-22 22:35:35.611103
55902	23	2024-12-19 20:00:00	2024-12-19 21:00:00	f	2024-10-22 22:35:35.613694	2024-10-22 22:35:35.613694
55903	23	2024-12-20 09:00:00	2024-12-20 10:00:00	f	2024-10-22 22:35:35.61656	2024-10-22 22:35:35.61656
55904	23	2024-12-20 10:00:00	2024-12-20 11:00:00	f	2024-10-22 22:35:35.618727	2024-10-22 22:35:35.618727
55905	23	2024-12-20 11:00:00	2024-12-20 12:00:00	f	2024-10-22 22:35:35.620785	2024-10-22 22:35:35.620785
55906	23	2024-12-20 12:00:00	2024-12-20 13:00:00	f	2024-10-22 22:35:35.623723	2024-10-22 22:35:35.623723
55907	23	2024-12-20 13:00:00	2024-12-20 14:00:00	f	2024-10-22 22:35:35.625934	2024-10-22 22:35:35.625934
55908	23	2024-12-20 14:00:00	2024-12-20 15:00:00	f	2024-10-22 22:35:35.629123	2024-10-22 22:35:35.629123
55909	23	2024-12-20 15:00:00	2024-12-20 16:00:00	f	2024-10-22 22:35:35.632864	2024-10-22 22:35:35.632864
55910	23	2024-12-20 16:00:00	2024-12-20 17:00:00	f	2024-10-22 22:35:35.634868	2024-10-22 22:35:35.634868
55911	23	2024-12-20 17:00:00	2024-12-20 18:00:00	f	2024-10-22 22:35:35.637696	2024-10-22 22:35:35.637696
55912	23	2024-12-20 18:00:00	2024-12-20 19:00:00	f	2024-10-22 22:35:35.640192	2024-10-22 22:35:35.640192
55913	23	2024-12-20 19:00:00	2024-12-20 20:00:00	f	2024-10-22 22:35:35.642194	2024-10-22 22:35:35.642194
55914	23	2024-12-20 20:00:00	2024-12-20 21:00:00	f	2024-10-22 22:35:35.64581	2024-10-22 22:35:35.64581
55915	23	2024-12-21 09:00:00	2024-12-21 10:00:00	f	2024-10-22 22:35:35.647923	2024-10-22 22:35:35.647923
55916	23	2024-12-21 10:00:00	2024-12-21 11:00:00	f	2024-10-22 22:35:35.650233	2024-10-22 22:35:35.650233
55917	23	2024-12-21 11:00:00	2024-12-21 12:00:00	f	2024-10-22 22:35:35.653045	2024-10-22 22:35:35.653045
55918	23	2024-12-21 12:00:00	2024-12-21 13:00:00	f	2024-10-22 22:35:35.65524	2024-10-22 22:35:35.65524
55919	23	2024-12-21 13:00:00	2024-12-21 14:00:00	f	2024-10-22 22:35:35.658375	2024-10-22 22:35:35.658375
55920	23	2024-12-21 14:00:00	2024-12-21 15:00:00	f	2024-10-22 22:35:35.660782	2024-10-22 22:35:35.660782
55921	23	2024-12-21 15:00:00	2024-12-21 16:00:00	f	2024-10-22 22:35:35.662755	2024-10-22 22:35:35.662755
55922	23	2024-12-21 16:00:00	2024-12-21 17:00:00	f	2024-10-22 22:35:35.665635	2024-10-22 22:35:35.665635
55923	23	2024-12-21 17:00:00	2024-12-21 18:00:00	f	2024-10-22 22:35:35.668621	2024-10-22 22:35:35.668621
55924	23	2024-12-21 18:00:00	2024-12-21 19:00:00	f	2024-10-22 22:35:35.671935	2024-10-22 22:35:35.671935
55925	23	2024-12-21 19:00:00	2024-12-21 20:00:00	f	2024-10-22 22:35:35.674627	2024-10-22 22:35:35.674627
55926	23	2024-12-21 20:00:00	2024-12-21 21:00:00	f	2024-10-22 22:35:35.676544	2024-10-22 22:35:35.676544
55927	23	2024-12-23 09:00:00	2024-12-23 10:00:00	f	2024-10-22 22:35:35.679794	2024-10-22 22:35:35.679794
55928	23	2024-12-23 10:00:00	2024-12-23 11:00:00	f	2024-10-22 22:35:35.682307	2024-10-22 22:35:35.682307
55929	23	2024-12-23 11:00:00	2024-12-23 12:00:00	f	2024-10-22 22:35:35.685469	2024-10-22 22:35:35.685469
55930	23	2024-12-23 12:00:00	2024-12-23 13:00:00	f	2024-10-22 22:35:35.688589	2024-10-22 22:35:35.688589
55931	23	2024-12-23 13:00:00	2024-12-23 14:00:00	f	2024-10-22 22:35:35.690892	2024-10-22 22:35:35.690892
55932	23	2024-12-23 14:00:00	2024-12-23 15:00:00	f	2024-10-22 22:35:35.693803	2024-10-22 22:35:35.693803
55933	23	2024-12-23 15:00:00	2024-12-23 16:00:00	f	2024-10-22 22:35:35.696071	2024-10-22 22:35:35.696071
55934	23	2024-12-23 16:00:00	2024-12-23 17:00:00	f	2024-10-22 22:35:35.698543	2024-10-22 22:35:35.698543
55935	23	2024-12-23 17:00:00	2024-12-23 18:00:00	f	2024-10-22 22:35:35.702157	2024-10-22 22:35:35.702157
55936	23	2024-12-23 18:00:00	2024-12-23 19:00:00	f	2024-10-22 22:35:35.70409	2024-10-22 22:35:35.70409
55937	23	2024-12-23 19:00:00	2024-12-23 20:00:00	f	2024-10-22 22:35:35.707089	2024-10-22 22:35:35.707089
55938	23	2024-12-23 20:00:00	2024-12-23 21:00:00	f	2024-10-22 22:35:35.70962	2024-10-22 22:35:35.70962
55939	23	2024-12-24 09:00:00	2024-12-24 10:00:00	f	2024-10-22 22:35:35.711427	2024-10-22 22:35:35.711427
55940	23	2024-12-24 10:00:00	2024-12-24 11:00:00	f	2024-10-22 22:35:35.714563	2024-10-22 22:35:35.714563
55941	23	2024-12-24 11:00:00	2024-12-24 12:00:00	f	2024-10-22 22:35:35.717234	2024-10-22 22:35:35.717234
55942	23	2024-12-24 12:00:00	2024-12-24 13:00:00	f	2024-10-22 22:35:35.72025	2024-10-22 22:35:35.72025
55943	23	2024-12-24 13:00:00	2024-12-24 14:00:00	f	2024-10-22 22:35:35.723084	2024-10-22 22:35:35.723084
55944	23	2024-12-24 14:00:00	2024-12-24 15:00:00	f	2024-10-22 22:35:35.725032	2024-10-22 22:35:35.725032
55945	23	2024-12-24 15:00:00	2024-12-24 16:00:00	f	2024-10-22 22:35:35.727806	2024-10-22 22:35:35.727806
55946	23	2024-12-24 16:00:00	2024-12-24 17:00:00	f	2024-10-22 22:35:35.730112	2024-10-22 22:35:35.730112
55947	23	2024-12-24 17:00:00	2024-12-24 18:00:00	f	2024-10-22 22:35:35.732112	2024-10-22 22:35:35.732112
55948	23	2024-12-24 18:00:00	2024-12-24 19:00:00	f	2024-10-22 22:35:35.735132	2024-10-22 22:35:35.735132
55949	23	2024-12-24 19:00:00	2024-12-24 20:00:00	f	2024-10-22 22:35:35.737992	2024-10-22 22:35:35.737992
55950	23	2024-12-24 20:00:00	2024-12-24 21:00:00	f	2024-10-22 22:35:35.74272	2024-10-22 22:35:35.74272
55951	23	2024-12-25 09:00:00	2024-12-25 10:00:00	f	2024-10-22 22:35:35.74546	2024-10-22 22:35:35.74546
55952	23	2024-12-25 10:00:00	2024-12-25 11:00:00	f	2024-10-22 22:35:35.748693	2024-10-22 22:35:35.748693
55953	23	2024-12-25 11:00:00	2024-12-25 12:00:00	f	2024-10-22 22:35:35.751404	2024-10-22 22:35:35.751404
55954	23	2024-12-25 12:00:00	2024-12-25 13:00:00	f	2024-10-22 22:35:35.753438	2024-10-22 22:35:35.753438
55955	23	2024-12-25 13:00:00	2024-12-25 14:00:00	f	2024-10-22 22:35:35.756614	2024-10-22 22:35:35.756614
55956	23	2024-12-25 14:00:00	2024-12-25 15:00:00	f	2024-10-22 22:35:35.75869	2024-10-22 22:35:35.75869
55957	23	2024-12-25 15:00:00	2024-12-25 16:00:00	f	2024-10-22 22:35:35.761051	2024-10-22 22:35:35.761051
55958	23	2024-12-25 16:00:00	2024-12-25 17:00:00	f	2024-10-22 22:35:35.764284	2024-10-22 22:35:35.764284
55959	23	2024-12-25 17:00:00	2024-12-25 18:00:00	f	2024-10-22 22:35:35.766301	2024-10-22 22:35:35.766301
55960	23	2024-12-25 18:00:00	2024-12-25 19:00:00	f	2024-10-22 22:35:35.769687	2024-10-22 22:35:35.769687
55961	23	2024-12-25 19:00:00	2024-12-25 20:00:00	f	2024-10-22 22:35:35.773073	2024-10-22 22:35:35.773073
55962	23	2024-12-25 20:00:00	2024-12-25 21:00:00	f	2024-10-22 22:35:35.776615	2024-10-22 22:35:35.776615
55963	23	2024-12-26 09:00:00	2024-12-26 10:00:00	f	2024-10-22 22:35:35.780103	2024-10-22 22:35:35.780103
55964	23	2024-12-26 10:00:00	2024-12-26 11:00:00	f	2024-10-22 22:35:35.783272	2024-10-22 22:35:35.783272
55965	23	2024-12-26 11:00:00	2024-12-26 12:00:00	f	2024-10-22 22:35:35.785616	2024-10-22 22:35:35.785616
55966	23	2024-12-26 12:00:00	2024-12-26 13:00:00	f	2024-10-22 22:35:35.787637	2024-10-22 22:35:35.787637
55967	23	2024-12-26 13:00:00	2024-12-26 14:00:00	f	2024-10-22 22:35:35.79038	2024-10-22 22:35:35.79038
55968	23	2024-12-26 14:00:00	2024-12-26 15:00:00	f	2024-10-22 22:35:35.792804	2024-10-22 22:35:35.792804
55969	23	2024-12-26 15:00:00	2024-12-26 16:00:00	f	2024-10-22 22:35:35.79471	2024-10-22 22:35:35.79471
55970	23	2024-12-26 16:00:00	2024-12-26 17:00:00	f	2024-10-22 22:35:35.797821	2024-10-22 22:35:35.797821
55971	23	2024-12-26 17:00:00	2024-12-26 18:00:00	f	2024-10-22 22:35:35.800128	2024-10-22 22:35:35.800128
55972	23	2024-12-26 18:00:00	2024-12-26 19:00:00	f	2024-10-22 22:35:35.802002	2024-10-22 22:35:35.802002
55973	23	2024-12-26 19:00:00	2024-12-26 20:00:00	f	2024-10-22 22:35:35.805584	2024-10-22 22:35:35.805584
55974	23	2024-12-26 20:00:00	2024-12-26 21:00:00	f	2024-10-22 22:35:35.809417	2024-10-22 22:35:35.809417
55975	23	2024-12-27 09:00:00	2024-12-27 10:00:00	f	2024-10-22 22:35:35.813422	2024-10-22 22:35:35.813422
55976	23	2024-12-27 10:00:00	2024-12-27 11:00:00	f	2024-10-22 22:35:35.815597	2024-10-22 22:35:35.815597
55977	23	2024-12-27 11:00:00	2024-12-27 12:00:00	f	2024-10-22 22:35:35.818661	2024-10-22 22:35:35.818661
55978	23	2024-12-27 12:00:00	2024-12-27 13:00:00	f	2024-10-22 22:35:35.821083	2024-10-22 22:35:35.821083
55979	23	2024-12-27 13:00:00	2024-12-27 14:00:00	f	2024-10-22 22:35:35.824233	2024-10-22 22:35:35.824233
55980	23	2024-12-27 14:00:00	2024-12-27 15:00:00	f	2024-10-22 22:35:35.827015	2024-10-22 22:35:35.827015
55981	23	2024-12-27 15:00:00	2024-12-27 16:00:00	f	2024-10-22 22:35:35.829009	2024-10-22 22:35:35.829009
55982	23	2024-12-27 16:00:00	2024-12-27 17:00:00	f	2024-10-22 22:35:35.832055	2024-10-22 22:35:35.832055
55983	23	2024-12-27 17:00:00	2024-12-27 18:00:00	f	2024-10-22 22:35:35.8343	2024-10-22 22:35:35.8343
55984	23	2024-12-27 18:00:00	2024-12-27 19:00:00	f	2024-10-22 22:35:35.836659	2024-10-22 22:35:35.836659
55985	23	2024-12-27 19:00:00	2024-12-27 20:00:00	f	2024-10-22 22:35:35.841241	2024-10-22 22:35:35.841241
55986	23	2024-12-27 20:00:00	2024-12-27 21:00:00	f	2024-10-22 22:35:35.843429	2024-10-22 22:35:35.843429
55987	23	2024-12-28 09:00:00	2024-12-28 10:00:00	f	2024-10-22 22:35:35.846686	2024-10-22 22:35:35.846686
55988	23	2024-12-28 10:00:00	2024-12-28 11:00:00	f	2024-10-22 22:35:35.849456	2024-10-22 22:35:35.849456
55989	23	2024-12-28 11:00:00	2024-12-28 12:00:00	f	2024-10-22 22:35:35.853654	2024-10-22 22:35:35.853654
55990	23	2024-12-28 12:00:00	2024-12-28 13:00:00	f	2024-10-22 22:35:35.856095	2024-10-22 22:35:35.856095
55991	23	2024-12-28 13:00:00	2024-12-28 14:00:00	f	2024-10-22 22:35:35.858668	2024-10-22 22:35:35.858668
55992	23	2024-12-28 14:00:00	2024-12-28 15:00:00	f	2024-10-22 22:35:35.862008	2024-10-22 22:35:35.862008
55993	23	2024-12-28 15:00:00	2024-12-28 16:00:00	f	2024-10-22 22:35:35.864187	2024-10-22 22:35:35.864187
55994	23	2024-12-28 16:00:00	2024-12-28 17:00:00	f	2024-10-22 22:35:35.867869	2024-10-22 22:35:35.867869
55995	23	2024-12-28 17:00:00	2024-12-28 18:00:00	f	2024-10-22 22:35:35.870927	2024-10-22 22:35:35.870927
55996	23	2024-12-28 18:00:00	2024-12-28 19:00:00	f	2024-10-22 22:35:35.874515	2024-10-22 22:35:35.874515
55997	23	2024-12-28 19:00:00	2024-12-28 20:00:00	f	2024-10-22 22:35:35.87676	2024-10-22 22:35:35.87676
55998	23	2024-12-28 20:00:00	2024-12-28 21:00:00	f	2024-10-22 22:35:35.87948	2024-10-22 22:35:35.87948
55999	23	2024-12-30 09:00:00	2024-12-30 10:00:00	f	2024-10-22 22:35:35.881993	2024-10-22 22:35:35.881993
56000	23	2024-12-30 10:00:00	2024-12-30 11:00:00	f	2024-10-22 22:35:35.888914	2024-10-22 22:35:35.888914
56001	23	2024-12-30 11:00:00	2024-12-30 12:00:00	f	2024-10-22 22:35:35.891037	2024-10-22 22:35:35.891037
56002	23	2024-12-30 12:00:00	2024-12-30 13:00:00	f	2024-10-22 22:35:35.893094	2024-10-22 22:35:35.893094
56003	23	2024-12-30 13:00:00	2024-12-30 14:00:00	f	2024-10-22 22:35:35.896003	2024-10-22 22:35:35.896003
56004	23	2024-12-30 14:00:00	2024-12-30 15:00:00	f	2024-10-22 22:35:35.89799	2024-10-22 22:35:35.89799
56005	23	2024-12-30 15:00:00	2024-12-30 16:00:00	f	2024-10-22 22:35:35.900704	2024-10-22 22:35:35.900704
56006	23	2024-12-30 16:00:00	2024-12-30 17:00:00	f	2024-10-22 22:35:35.903659	2024-10-22 22:35:35.903659
56007	23	2024-12-30 17:00:00	2024-12-30 18:00:00	f	2024-10-22 22:35:35.905725	2024-10-22 22:35:35.905725
56008	23	2024-12-30 18:00:00	2024-12-30 19:00:00	f	2024-10-22 22:35:35.909306	2024-10-22 22:35:35.909306
56009	23	2024-12-30 19:00:00	2024-12-30 20:00:00	f	2024-10-22 22:35:35.911535	2024-10-22 22:35:35.911535
56010	23	2024-12-30 20:00:00	2024-12-30 21:00:00	f	2024-10-22 22:35:35.915026	2024-10-22 22:35:35.915026
56011	23	2024-12-31 09:00:00	2024-12-31 10:00:00	f	2024-10-22 22:35:35.917744	2024-10-22 22:35:35.917744
56012	23	2024-12-31 10:00:00	2024-12-31 11:00:00	f	2024-10-22 22:35:35.919843	2024-10-22 22:35:35.919843
56013	23	2024-12-31 11:00:00	2024-12-31 12:00:00	f	2024-10-22 22:35:35.922768	2024-10-22 22:35:35.922768
56014	23	2024-12-31 12:00:00	2024-12-31 13:00:00	f	2024-10-22 22:35:35.924926	2024-10-22 22:35:35.924926
56015	23	2024-12-31 13:00:00	2024-12-31 14:00:00	f	2024-10-22 22:35:35.926747	2024-10-22 22:35:35.926747
56016	23	2024-12-31 14:00:00	2024-12-31 15:00:00	f	2024-10-22 22:35:35.929741	2024-10-22 22:35:35.929741
56017	23	2024-12-31 15:00:00	2024-12-31 16:00:00	f	2024-10-22 22:35:35.932509	2024-10-22 22:35:35.932509
56018	23	2024-12-31 16:00:00	2024-12-31 17:00:00	f	2024-10-22 22:35:35.935965	2024-10-22 22:35:35.935965
56019	23	2024-12-31 17:00:00	2024-12-31 18:00:00	f	2024-10-22 22:35:35.938435	2024-10-22 22:35:35.938435
56020	23	2024-12-31 18:00:00	2024-12-31 19:00:00	f	2024-10-22 22:35:35.940263	2024-10-22 22:35:35.940263
56021	23	2024-12-31 19:00:00	2024-12-31 20:00:00	f	2024-10-22 22:35:35.943234	2024-10-22 22:35:35.943234
56022	23	2024-12-31 20:00:00	2024-12-31 21:00:00	f	2024-10-22 22:35:35.945513	2024-10-22 22:35:35.945513
56023	23	2025-01-01 09:00:00	2025-01-01 10:00:00	f	2024-10-22 22:35:35.947623	2024-10-22 22:35:35.947623
56024	23	2025-01-01 10:00:00	2025-01-01 11:00:00	f	2024-10-22 22:35:35.950818	2024-10-22 22:35:35.950818
56025	23	2025-01-01 11:00:00	2025-01-01 12:00:00	f	2024-10-22 22:35:35.953051	2024-10-22 22:35:35.953051
56026	23	2025-01-01 12:00:00	2025-01-01 13:00:00	f	2024-10-22 22:35:35.954893	2024-10-22 22:35:35.954893
56027	23	2025-01-01 13:00:00	2025-01-01 14:00:00	f	2024-10-22 22:35:35.958143	2024-10-22 22:35:35.958143
56028	23	2025-01-01 14:00:00	2025-01-01 15:00:00	f	2024-10-22 22:35:35.960535	2024-10-22 22:35:35.960535
56029	23	2025-01-01 15:00:00	2025-01-01 16:00:00	f	2024-10-22 22:35:35.964613	2024-10-22 22:35:35.964613
56030	23	2025-01-01 16:00:00	2025-01-01 17:00:00	f	2024-10-22 22:35:35.966989	2024-10-22 22:35:35.966989
56031	23	2025-01-01 17:00:00	2025-01-01 18:00:00	f	2024-10-22 22:35:35.968936	2024-10-22 22:35:35.968936
56032	23	2025-01-01 18:00:00	2025-01-01 19:00:00	f	2024-10-22 22:35:35.972587	2024-10-22 22:35:35.972587
56033	23	2025-01-01 19:00:00	2025-01-01 20:00:00	f	2024-10-22 22:35:35.974607	2024-10-22 22:35:35.974607
56034	23	2025-01-01 20:00:00	2025-01-01 21:00:00	f	2024-10-22 22:35:35.977584	2024-10-22 22:35:35.977584
56035	23	2025-01-02 09:00:00	2025-01-02 10:00:00	f	2024-10-22 22:35:35.980206	2024-10-22 22:35:35.980206
56036	23	2025-01-02 10:00:00	2025-01-02 11:00:00	f	2024-10-22 22:35:35.982271	2024-10-22 22:35:35.982271
56037	23	2025-01-02 11:00:00	2025-01-02 12:00:00	f	2024-10-22 22:35:35.985205	2024-10-22 22:35:35.985205
56038	23	2025-01-02 12:00:00	2025-01-02 13:00:00	f	2024-10-22 22:35:35.987533	2024-10-22 22:35:35.987533
56039	23	2025-01-02 13:00:00	2025-01-02 14:00:00	f	2024-10-22 22:35:35.989687	2024-10-22 22:35:35.989687
56040	23	2025-01-02 14:00:00	2025-01-02 15:00:00	f	2024-10-22 22:35:35.99317	2024-10-22 22:35:35.99317
56041	23	2025-01-02 15:00:00	2025-01-02 16:00:00	f	2024-10-22 22:35:35.995519	2024-10-22 22:35:35.995519
56042	23	2025-01-02 16:00:00	2025-01-02 17:00:00	f	2024-10-22 22:35:35.998902	2024-10-22 22:35:35.998902
56043	23	2025-01-02 17:00:00	2025-01-02 18:00:00	f	2024-10-22 22:35:36.001137	2024-10-22 22:35:36.001137
56044	23	2025-01-02 18:00:00	2025-01-02 19:00:00	f	2024-10-22 22:35:36.002988	2024-10-22 22:35:36.002988
56045	23	2025-01-02 19:00:00	2025-01-02 20:00:00	f	2024-10-22 22:35:36.006149	2024-10-22 22:35:36.006149
56046	23	2025-01-02 20:00:00	2025-01-02 21:00:00	f	2024-10-22 22:35:36.008499	2024-10-22 22:35:36.008499
56047	23	2025-01-03 09:00:00	2025-01-03 10:00:00	f	2024-10-22 22:35:36.010678	2024-10-22 22:35:36.010678
56048	23	2025-01-03 10:00:00	2025-01-03 11:00:00	f	2024-10-22 22:35:36.013438	2024-10-22 22:35:36.013438
56049	23	2025-01-03 11:00:00	2025-01-03 12:00:00	f	2024-10-22 22:35:36.015579	2024-10-22 22:35:36.015579
56050	23	2025-01-03 12:00:00	2025-01-03 13:00:00	f	2024-10-22 22:35:36.018588	2024-10-22 22:35:36.018588
56051	23	2025-01-03 13:00:00	2025-01-03 14:00:00	f	2024-10-22 22:35:36.021595	2024-10-22 22:35:36.021595
56052	23	2025-01-03 14:00:00	2025-01-03 15:00:00	f	2024-10-22 22:35:36.023397	2024-10-22 22:35:36.023397
56053	23	2025-01-03 15:00:00	2025-01-03 16:00:00	f	2024-10-22 22:35:36.026113	2024-10-22 22:35:36.026113
56054	23	2025-01-03 16:00:00	2025-01-03 17:00:00	f	2024-10-22 22:35:36.02863	2024-10-22 22:35:36.02863
56055	23	2025-01-03 17:00:00	2025-01-03 18:00:00	f	2024-10-22 22:35:36.030579	2024-10-22 22:35:36.030579
56056	23	2025-01-03 18:00:00	2025-01-03 19:00:00	f	2024-10-22 22:35:36.033794	2024-10-22 22:35:36.033794
56057	23	2025-01-03 19:00:00	2025-01-03 20:00:00	f	2024-10-22 22:35:36.036523	2024-10-22 22:35:36.036523
56058	23	2025-01-03 20:00:00	2025-01-03 21:00:00	f	2024-10-22 22:35:36.039098	2024-10-22 22:35:36.039098
56059	23	2025-01-04 09:00:00	2025-01-04 10:00:00	f	2024-10-22 22:35:36.042099	2024-10-22 22:35:36.042099
56060	23	2025-01-04 10:00:00	2025-01-04 11:00:00	f	2024-10-22 22:35:36.044093	2024-10-22 22:35:36.044093
56061	23	2025-01-04 11:00:00	2025-01-04 12:00:00	f	2024-10-22 22:35:36.047684	2024-10-22 22:35:36.047684
56062	23	2025-01-04 12:00:00	2025-01-04 13:00:00	f	2024-10-22 22:35:36.050245	2024-10-22 22:35:36.050245
56063	23	2025-01-04 13:00:00	2025-01-04 14:00:00	f	2024-10-22 22:35:36.05227	2024-10-22 22:35:36.05227
56064	23	2025-01-04 14:00:00	2025-01-04 15:00:00	f	2024-10-22 22:35:36.05569	2024-10-22 22:35:36.05569
56065	23	2025-01-04 15:00:00	2025-01-04 16:00:00	f	2024-10-22 22:35:36.058297	2024-10-22 22:35:36.058297
56066	23	2025-01-04 16:00:00	2025-01-04 17:00:00	f	2024-10-22 22:35:36.061852	2024-10-22 22:35:36.061852
56067	23	2025-01-04 17:00:00	2025-01-04 18:00:00	f	2024-10-22 22:35:36.064093	2024-10-22 22:35:36.064093
56068	23	2025-01-04 18:00:00	2025-01-04 19:00:00	f	2024-10-22 22:35:36.066282	2024-10-22 22:35:36.066282
56069	23	2025-01-04 19:00:00	2025-01-04 20:00:00	f	2024-10-22 22:35:36.069147	2024-10-22 22:35:36.069147
56070	23	2025-01-04 20:00:00	2025-01-04 21:00:00	f	2024-10-22 22:35:36.071351	2024-10-22 22:35:36.071351
56071	23	2025-01-06 09:00:00	2025-01-06 10:00:00	f	2024-10-22 22:35:36.074461	2024-10-22 22:35:36.074461
56072	23	2025-01-06 10:00:00	2025-01-06 11:00:00	f	2024-10-22 22:35:36.077039	2024-10-22 22:35:36.077039
56073	23	2025-01-06 11:00:00	2025-01-06 12:00:00	f	2024-10-22 22:35:36.079153	2024-10-22 22:35:36.079153
56074	23	2025-01-06 12:00:00	2025-01-06 13:00:00	f	2024-10-22 22:35:36.081896	2024-10-22 22:35:36.081896
56075	23	2025-01-06 13:00:00	2025-01-06 14:00:00	f	2024-10-22 22:35:36.084213	2024-10-22 22:35:36.084213
56076	23	2025-01-06 14:00:00	2025-01-06 15:00:00	f	2024-10-22 22:35:36.086196	2024-10-22 22:35:36.086196
56077	23	2025-01-06 15:00:00	2025-01-06 16:00:00	f	2024-10-22 22:35:36.089932	2024-10-22 22:35:36.089932
56078	23	2025-01-06 16:00:00	2025-01-06 17:00:00	f	2024-10-22 22:35:36.092245	2024-10-22 22:35:36.092245
56079	23	2025-01-06 17:00:00	2025-01-06 18:00:00	f	2024-10-22 22:35:36.09431	2024-10-22 22:35:36.09431
56080	23	2025-01-06 18:00:00	2025-01-06 19:00:00	f	2024-10-22 22:35:36.097788	2024-10-22 22:35:36.097788
56081	23	2025-01-06 19:00:00	2025-01-06 20:00:00	f	2024-10-22 22:35:36.09984	2024-10-22 22:35:36.09984
56082	23	2025-01-06 20:00:00	2025-01-06 21:00:00	f	2024-10-22 22:35:36.102603	2024-10-22 22:35:36.102603
56083	23	2025-01-07 09:00:00	2025-01-07 10:00:00	f	2024-10-22 22:35:36.105059	2024-10-22 22:35:36.105059
56084	23	2025-01-07 10:00:00	2025-01-07 11:00:00	f	2024-10-22 22:35:36.107163	2024-10-22 22:35:36.107163
56085	23	2025-01-07 11:00:00	2025-01-07 12:00:00	f	2024-10-22 22:35:36.110643	2024-10-22 22:35:36.110643
56086	23	2025-01-07 12:00:00	2025-01-07 13:00:00	f	2024-10-22 22:35:36.112799	2024-10-22 22:35:36.112799
56087	23	2025-01-07 13:00:00	2025-01-07 14:00:00	f	2024-10-22 22:35:36.114567	2024-10-22 22:35:36.114567
56088	23	2025-01-07 14:00:00	2025-01-07 15:00:00	f	2024-10-22 22:35:36.117752	2024-10-22 22:35:36.117752
56089	23	2025-01-07 15:00:00	2025-01-07 16:00:00	f	2024-10-22 22:35:36.120326	2024-10-22 22:35:36.120326
56090	23	2025-01-07 16:00:00	2025-01-07 17:00:00	f	2024-10-22 22:35:36.123196	2024-10-22 22:35:36.123196
56091	23	2025-01-07 17:00:00	2025-01-07 18:00:00	f	2024-10-22 22:35:36.12606	2024-10-22 22:35:36.12606
56092	23	2025-01-07 18:00:00	2025-01-07 19:00:00	f	2024-10-22 22:35:36.128117	2024-10-22 22:35:36.128117
56093	23	2025-01-07 19:00:00	2025-01-07 20:00:00	f	2024-10-22 22:35:36.131458	2024-10-22 22:35:36.131458
56094	23	2025-01-07 20:00:00	2025-01-07 21:00:00	f	2024-10-22 22:35:36.134477	2024-10-22 22:35:36.134477
56095	23	2025-01-08 09:00:00	2025-01-08 10:00:00	f	2024-10-22 22:35:36.137955	2024-10-22 22:35:36.137955
56096	23	2025-01-08 10:00:00	2025-01-08 11:00:00	f	2024-10-22 22:35:36.140206	2024-10-22 22:35:36.140206
56097	23	2025-01-08 11:00:00	2025-01-08 12:00:00	f	2024-10-22 22:35:36.142657	2024-10-22 22:35:36.142657
56098	23	2025-01-08 12:00:00	2025-01-08 13:00:00	f	2024-10-22 22:35:36.145595	2024-10-22 22:35:36.145595
56099	23	2025-01-08 13:00:00	2025-01-08 14:00:00	f	2024-10-22 22:35:36.1481	2024-10-22 22:35:36.1481
56100	23	2025-01-08 14:00:00	2025-01-08 15:00:00	f	2024-10-22 22:35:36.151449	2024-10-22 22:35:36.151449
56101	23	2025-01-08 15:00:00	2025-01-08 16:00:00	f	2024-10-22 22:35:36.154322	2024-10-22 22:35:36.154322
56102	23	2025-01-08 16:00:00	2025-01-08 17:00:00	f	2024-10-22 22:35:36.16133	2024-10-22 22:35:36.16133
56103	23	2025-01-08 17:00:00	2025-01-08 18:00:00	f	2024-10-22 22:35:36.164855	2024-10-22 22:35:36.164855
56104	23	2025-01-08 18:00:00	2025-01-08 19:00:00	f	2024-10-22 22:35:36.167274	2024-10-22 22:35:36.167274
56105	23	2025-01-08 19:00:00	2025-01-08 20:00:00	f	2024-10-22 22:35:36.169393	2024-10-22 22:35:36.169393
56106	23	2025-01-08 20:00:00	2025-01-08 21:00:00	f	2024-10-22 22:35:36.172192	2024-10-22 22:35:36.172192
56107	23	2025-01-09 09:00:00	2025-01-09 10:00:00	f	2024-10-22 22:35:36.175286	2024-10-22 22:35:36.175286
56108	23	2025-01-09 10:00:00	2025-01-09 11:00:00	f	2024-10-22 22:35:36.177922	2024-10-22 22:35:36.177922
56109	23	2025-01-09 11:00:00	2025-01-09 12:00:00	f	2024-10-22 22:35:36.180874	2024-10-22 22:35:36.180874
56110	23	2025-01-09 12:00:00	2025-01-09 13:00:00	f	2024-10-22 22:35:36.183016	2024-10-22 22:35:36.183016
56111	23	2025-01-09 13:00:00	2025-01-09 14:00:00	f	2024-10-22 22:35:36.186617	2024-10-22 22:35:36.186617
56112	23	2025-01-09 14:00:00	2025-01-09 15:00:00	f	2024-10-22 22:35:36.190204	2024-10-22 22:35:36.190204
56113	23	2025-01-09 15:00:00	2025-01-09 16:00:00	f	2024-10-22 22:35:36.194377	2024-10-22 22:35:36.194377
56114	23	2025-01-09 16:00:00	2025-01-09 17:00:00	f	2024-10-22 22:35:36.196874	2024-10-22 22:35:36.196874
56115	23	2025-01-09 17:00:00	2025-01-09 18:00:00	f	2024-10-22 22:35:36.200606	2024-10-22 22:35:36.200606
56116	23	2025-01-09 18:00:00	2025-01-09 19:00:00	f	2024-10-22 22:35:36.203813	2024-10-22 22:35:36.203813
56117	23	2025-01-09 19:00:00	2025-01-09 20:00:00	f	2024-10-22 22:35:36.207858	2024-10-22 22:35:36.207858
56118	23	2025-01-09 20:00:00	2025-01-09 21:00:00	f	2024-10-22 22:35:36.21042	2024-10-22 22:35:36.21042
56119	23	2025-01-10 09:00:00	2025-01-10 10:00:00	f	2024-10-22 22:35:36.213132	2024-10-22 22:35:36.213132
56120	23	2025-01-10 10:00:00	2025-01-10 11:00:00	f	2024-10-22 22:35:36.216188	2024-10-22 22:35:36.216188
56121	23	2025-01-10 11:00:00	2025-01-10 12:00:00	f	2024-10-22 22:35:36.218188	2024-10-22 22:35:36.218188
56122	23	2025-01-10 12:00:00	2025-01-10 13:00:00	f	2024-10-22 22:35:36.222735	2024-10-22 22:35:36.222735
56123	23	2025-01-10 13:00:00	2025-01-10 14:00:00	f	2024-10-22 22:35:36.225283	2024-10-22 22:35:36.225283
56124	23	2025-01-10 14:00:00	2025-01-10 15:00:00	f	2024-10-22 22:35:36.230371	2024-10-22 22:35:36.230371
56125	23	2025-01-10 15:00:00	2025-01-10 16:00:00	f	2024-10-22 22:35:36.23441	2024-10-22 22:35:36.23441
56126	23	2025-01-10 16:00:00	2025-01-10 17:00:00	f	2024-10-22 22:35:36.237637	2024-10-22 22:35:36.237637
56127	23	2025-01-10 17:00:00	2025-01-10 18:00:00	f	2024-10-22 22:35:36.242124	2024-10-22 22:35:36.242124
56128	23	2025-01-10 18:00:00	2025-01-10 19:00:00	f	2024-10-22 22:35:36.245379	2024-10-22 22:35:36.245379
56129	23	2025-01-10 19:00:00	2025-01-10 20:00:00	f	2024-10-22 22:35:36.249278	2024-10-22 22:35:36.249278
56130	23	2025-01-10 20:00:00	2025-01-10 21:00:00	f	2024-10-22 22:35:36.252925	2024-10-22 22:35:36.252925
56131	23	2025-01-11 09:00:00	2025-01-11 10:00:00	f	2024-10-22 22:35:36.256421	2024-10-22 22:35:36.256421
56132	23	2025-01-11 10:00:00	2025-01-11 11:00:00	f	2024-10-22 22:35:36.258735	2024-10-22 22:35:36.258735
56133	23	2025-01-11 11:00:00	2025-01-11 12:00:00	f	2024-10-22 22:35:36.261965	2024-10-22 22:35:36.261965
56134	23	2025-01-11 12:00:00	2025-01-11 13:00:00	f	2024-10-22 22:35:36.264468	2024-10-22 22:35:36.264468
56135	23	2025-01-11 13:00:00	2025-01-11 14:00:00	f	2024-10-22 22:35:36.266896	2024-10-22 22:35:36.266896
56136	23	2025-01-11 14:00:00	2025-01-11 15:00:00	f	2024-10-22 22:35:36.270034	2024-10-22 22:35:36.270034
56137	23	2025-01-11 15:00:00	2025-01-11 16:00:00	f	2024-10-22 22:35:36.272806	2024-10-22 22:35:36.272806
56138	23	2025-01-11 16:00:00	2025-01-11 17:00:00	f	2024-10-22 22:35:36.27582	2024-10-22 22:35:36.27582
56139	23	2025-01-11 17:00:00	2025-01-11 18:00:00	f	2024-10-22 22:35:36.27858	2024-10-22 22:35:36.27858
56140	23	2025-01-11 18:00:00	2025-01-11 19:00:00	f	2024-10-22 22:35:36.280485	2024-10-22 22:35:36.280485
56141	23	2025-01-11 19:00:00	2025-01-11 20:00:00	f	2024-10-22 22:35:36.284542	2024-10-22 22:35:36.284542
56142	23	2025-01-11 20:00:00	2025-01-11 21:00:00	f	2024-10-22 22:35:36.286986	2024-10-22 22:35:36.286986
56143	23	2025-01-13 09:00:00	2025-01-13 10:00:00	f	2024-10-22 22:35:36.290745	2024-10-22 22:35:36.290745
56144	23	2025-01-13 10:00:00	2025-01-13 11:00:00	f	2024-10-22 22:35:36.293513	2024-10-22 22:35:36.293513
56145	23	2025-01-13 11:00:00	2025-01-13 12:00:00	f	2024-10-22 22:35:36.296709	2024-10-22 22:35:36.296709
56146	23	2025-01-13 12:00:00	2025-01-13 13:00:00	f	2024-10-22 22:35:36.299688	2024-10-22 22:35:36.299688
56147	23	2025-01-13 13:00:00	2025-01-13 14:00:00	f	2024-10-22 22:35:36.302525	2024-10-22 22:35:36.302525
56148	23	2025-01-13 14:00:00	2025-01-13 15:00:00	f	2024-10-22 22:35:36.30589	2024-10-22 22:35:36.30589
56149	23	2025-01-13 15:00:00	2025-01-13 16:00:00	f	2024-10-22 22:35:36.308004	2024-10-22 22:35:36.308004
56150	23	2025-01-13 16:00:00	2025-01-13 17:00:00	f	2024-10-22 22:35:36.310623	2024-10-22 22:35:36.310623
56151	23	2025-01-13 17:00:00	2025-01-13 18:00:00	f	2024-10-22 22:35:36.313367	2024-10-22 22:35:36.313367
56152	23	2025-01-13 18:00:00	2025-01-13 19:00:00	f	2024-10-22 22:35:36.315859	2024-10-22 22:35:36.315859
56153	23	2025-01-13 19:00:00	2025-01-13 20:00:00	f	2024-10-22 22:35:36.319499	2024-10-22 22:35:36.319499
56154	23	2025-01-13 20:00:00	2025-01-13 21:00:00	f	2024-10-22 22:35:36.321689	2024-10-22 22:35:36.321689
56155	23	2025-01-14 09:00:00	2025-01-14 10:00:00	f	2024-10-22 22:35:36.324431	2024-10-22 22:35:36.324431
56156	23	2025-01-14 10:00:00	2025-01-14 11:00:00	f	2024-10-22 22:35:36.32726	2024-10-22 22:35:36.32726
56157	23	2025-01-14 11:00:00	2025-01-14 12:00:00	f	2024-10-22 22:35:36.329372	2024-10-22 22:35:36.329372
56158	23	2025-01-14 12:00:00	2025-01-14 13:00:00	f	2024-10-22 22:35:36.332373	2024-10-22 22:35:36.332373
56159	23	2025-01-14 13:00:00	2025-01-14 14:00:00	f	2024-10-22 22:35:36.334843	2024-10-22 22:35:36.334843
56160	23	2025-01-14 14:00:00	2025-01-14 15:00:00	f	2024-10-22 22:35:36.337475	2024-10-22 22:35:36.337475
56161	23	2025-01-14 15:00:00	2025-01-14 16:00:00	f	2024-10-22 22:35:36.341015	2024-10-22 22:35:36.341015
56162	23	2025-01-14 16:00:00	2025-01-14 17:00:00	f	2024-10-22 22:35:36.343093	2024-10-22 22:35:36.343093
56163	23	2025-01-14 17:00:00	2025-01-14 18:00:00	f	2024-10-22 22:35:36.346974	2024-10-22 22:35:36.346974
56164	23	2025-01-14 18:00:00	2025-01-14 19:00:00	f	2024-10-22 22:35:36.349991	2024-10-22 22:35:36.349991
56165	23	2025-01-14 19:00:00	2025-01-14 20:00:00	f	2024-10-22 22:35:36.354521	2024-10-22 22:35:36.354521
56166	23	2025-01-14 20:00:00	2025-01-14 21:00:00	f	2024-10-22 22:35:36.35714	2024-10-22 22:35:36.35714
56167	23	2025-01-15 09:00:00	2025-01-15 10:00:00	f	2024-10-22 22:35:36.360989	2024-10-22 22:35:36.360989
56168	23	2025-01-15 10:00:00	2025-01-15 11:00:00	f	2024-10-22 22:35:36.363199	2024-10-22 22:35:36.363199
56169	23	2025-01-15 11:00:00	2025-01-15 12:00:00	f	2024-10-22 22:35:36.365262	2024-10-22 22:35:36.365262
56170	23	2025-01-15 12:00:00	2025-01-15 13:00:00	f	2024-10-22 22:35:36.368281	2024-10-22 22:35:36.368281
56171	23	2025-01-15 13:00:00	2025-01-15 14:00:00	f	2024-10-22 22:35:36.37057	2024-10-22 22:35:36.37057
56172	23	2025-01-15 14:00:00	2025-01-15 15:00:00	f	2024-10-22 22:35:36.37342	2024-10-22 22:35:36.37342
56173	23	2025-01-15 15:00:00	2025-01-15 16:00:00	f	2024-10-22 22:35:36.375799	2024-10-22 22:35:36.375799
56174	23	2025-01-15 16:00:00	2025-01-15 17:00:00	f	2024-10-22 22:35:36.377752	2024-10-22 22:35:36.377752
56175	23	2025-01-15 17:00:00	2025-01-15 18:00:00	f	2024-10-22 22:35:36.380451	2024-10-22 22:35:36.380451
56176	23	2025-01-15 18:00:00	2025-01-15 19:00:00	f	2024-10-22 22:35:36.383386	2024-10-22 22:35:36.383386
56177	23	2025-01-15 19:00:00	2025-01-15 20:00:00	f	2024-10-22 22:35:36.386042	2024-10-22 22:35:36.386042
56178	23	2025-01-15 20:00:00	2025-01-15 21:00:00	f	2024-10-22 22:35:36.389124	2024-10-22 22:35:36.389124
56179	23	2025-01-16 09:00:00	2025-01-16 10:00:00	f	2024-10-22 22:35:36.391387	2024-10-22 22:35:36.391387
56180	23	2025-01-16 10:00:00	2025-01-16 11:00:00	f	2024-10-22 22:35:36.394213	2024-10-22 22:35:36.394213
56181	23	2025-01-16 11:00:00	2025-01-16 12:00:00	f	2024-10-22 22:35:36.396896	2024-10-22 22:35:36.396896
56182	23	2025-01-16 12:00:00	2025-01-16 13:00:00	f	2024-10-22 22:35:36.399205	2024-10-22 22:35:36.399205
56183	23	2025-01-16 13:00:00	2025-01-16 14:00:00	f	2024-10-22 22:35:36.402741	2024-10-22 22:35:36.402741
56184	23	2025-01-16 14:00:00	2025-01-16 15:00:00	f	2024-10-22 22:35:36.404703	2024-10-22 22:35:36.404703
56185	23	2025-01-16 15:00:00	2025-01-16 16:00:00	f	2024-10-22 22:35:36.406647	2024-10-22 22:35:36.406647
56186	23	2025-01-16 16:00:00	2025-01-16 17:00:00	f	2024-10-22 22:35:36.409907	2024-10-22 22:35:36.409907
56187	23	2025-01-16 17:00:00	2025-01-16 18:00:00	f	2024-10-22 22:35:36.412672	2024-10-22 22:35:36.412672
56188	23	2025-01-16 18:00:00	2025-01-16 19:00:00	f	2024-10-22 22:35:36.416191	2024-10-22 22:35:36.416191
56189	23	2025-01-16 19:00:00	2025-01-16 20:00:00	f	2024-10-22 22:35:36.418596	2024-10-22 22:35:36.418596
56190	23	2025-01-16 20:00:00	2025-01-16 21:00:00	f	2024-10-22 22:35:36.420875	2024-10-22 22:35:36.420875
56191	23	2025-01-17 09:00:00	2025-01-17 10:00:00	f	2024-10-22 22:35:36.42406	2024-10-22 22:35:36.42406
56192	23	2025-01-17 10:00:00	2025-01-17 11:00:00	f	2024-10-22 22:35:36.426361	2024-10-22 22:35:36.426361
56193	23	2025-01-17 11:00:00	2025-01-17 12:00:00	f	2024-10-22 22:35:36.429732	2024-10-22 22:35:36.429732
56194	23	2025-01-17 12:00:00	2025-01-17 13:00:00	f	2024-10-22 22:35:36.431875	2024-10-22 22:35:36.431875
56195	23	2025-01-17 13:00:00	2025-01-17 14:00:00	f	2024-10-22 22:35:36.433727	2024-10-22 22:35:36.433727
56196	23	2025-01-17 14:00:00	2025-01-17 15:00:00	f	2024-10-22 22:35:36.436741	2024-10-22 22:35:36.436741
56197	23	2025-01-17 15:00:00	2025-01-17 16:00:00	f	2024-10-22 22:35:36.438812	2024-10-22 22:35:36.438812
56198	23	2025-01-17 16:00:00	2025-01-17 17:00:00	f	2024-10-22 22:35:36.440952	2024-10-22 22:35:36.440952
56199	23	2025-01-17 17:00:00	2025-01-17 18:00:00	f	2024-10-22 22:35:36.444529	2024-10-22 22:35:36.444529
56200	23	2025-01-17 18:00:00	2025-01-17 19:00:00	f	2024-10-22 22:35:36.446869	2024-10-22 22:35:36.446869
56201	23	2025-01-17 19:00:00	2025-01-17 20:00:00	f	2024-10-22 22:35:36.450248	2024-10-22 22:35:36.450248
56202	23	2025-01-17 20:00:00	2025-01-17 21:00:00	f	2024-10-22 22:35:36.453174	2024-10-22 22:35:36.453174
56203	23	2025-01-18 09:00:00	2025-01-18 10:00:00	f	2024-10-22 22:35:36.456422	2024-10-22 22:35:36.456422
56204	23	2025-01-18 10:00:00	2025-01-18 11:00:00	f	2024-10-22 22:35:36.463518	2024-10-22 22:35:36.463518
56205	23	2025-01-18 11:00:00	2025-01-18 12:00:00	f	2024-10-22 22:35:36.46596	2024-10-22 22:35:36.46596
56206	23	2025-01-18 12:00:00	2025-01-18 13:00:00	f	2024-10-22 22:35:36.467739	2024-10-22 22:35:36.467739
56207	23	2025-01-18 13:00:00	2025-01-18 14:00:00	f	2024-10-22 22:35:36.470423	2024-10-22 22:35:36.470423
56208	23	2025-01-18 14:00:00	2025-01-18 15:00:00	f	2024-10-22 22:35:36.472964	2024-10-22 22:35:36.472964
56209	23	2025-01-18 15:00:00	2025-01-18 16:00:00	f	2024-10-22 22:35:36.47736	2024-10-22 22:35:36.47736
56210	23	2025-01-18 16:00:00	2025-01-18 17:00:00	f	2024-10-22 22:35:36.480741	2024-10-22 22:35:36.480741
56211	23	2025-01-18 17:00:00	2025-01-18 18:00:00	f	2024-10-22 22:35:36.483435	2024-10-22 22:35:36.483435
56212	23	2025-01-18 18:00:00	2025-01-18 19:00:00	f	2024-10-22 22:35:36.486353	2024-10-22 22:35:36.486353
56213	23	2025-01-18 19:00:00	2025-01-18 20:00:00	f	2024-10-22 22:35:36.488726	2024-10-22 22:35:36.488726
56214	23	2025-01-18 20:00:00	2025-01-18 21:00:00	f	2024-10-22 22:35:36.491985	2024-10-22 22:35:36.491985
56215	23	2025-01-20 09:00:00	2025-01-20 10:00:00	f	2024-10-22 22:35:36.494425	2024-10-22 22:35:36.494425
56216	23	2025-01-20 10:00:00	2025-01-20 11:00:00	f	2024-10-22 22:35:36.496259	2024-10-22 22:35:36.496259
56217	23	2025-01-20 11:00:00	2025-01-20 12:00:00	f	2024-10-22 22:35:36.499061	2024-10-22 22:35:36.499061
56218	23	2025-01-20 12:00:00	2025-01-20 13:00:00	f	2024-10-22 22:35:36.501428	2024-10-22 22:35:36.501428
56219	23	2025-01-20 13:00:00	2025-01-20 14:00:00	f	2024-10-22 22:35:36.503175	2024-10-22 22:35:36.503175
56220	23	2025-01-20 14:00:00	2025-01-20 15:00:00	f	2024-10-22 22:35:36.507043	2024-10-22 22:35:36.507043
56221	23	2025-01-20 15:00:00	2025-01-20 16:00:00	f	2024-10-22 22:35:36.509342	2024-10-22 22:35:36.509342
56222	23	2025-01-20 16:00:00	2025-01-20 17:00:00	f	2024-10-22 22:35:36.512912	2024-10-22 22:35:36.512912
56223	23	2025-01-20 17:00:00	2025-01-20 18:00:00	f	2024-10-22 22:35:36.515361	2024-10-22 22:35:36.515361
56224	23	2025-01-20 18:00:00	2025-01-20 19:00:00	f	2024-10-22 22:35:36.517995	2024-10-22 22:35:36.517995
56225	23	2025-01-20 19:00:00	2025-01-20 20:00:00	f	2024-10-22 22:35:36.521663	2024-10-22 22:35:36.521663
56226	23	2025-01-20 20:00:00	2025-01-20 21:00:00	f	2024-10-22 22:35:36.523816	2024-10-22 22:35:36.523816
56227	23	2025-01-21 09:00:00	2025-01-21 10:00:00	f	2024-10-22 22:35:36.52663	2024-10-22 22:35:36.52663
56228	23	2025-01-21 10:00:00	2025-01-21 11:00:00	f	2024-10-22 22:35:36.528954	2024-10-22 22:35:36.528954
56229	23	2025-01-21 11:00:00	2025-01-21 12:00:00	f	2024-10-22 22:35:36.530925	2024-10-22 22:35:36.530925
56230	23	2025-01-21 12:00:00	2025-01-21 13:00:00	f	2024-10-22 22:35:36.533986	2024-10-22 22:35:36.533986
56231	23	2025-01-21 13:00:00	2025-01-21 14:00:00	f	2024-10-22 22:35:36.536514	2024-10-22 22:35:36.536514
56232	23	2025-01-21 14:00:00	2025-01-21 15:00:00	f	2024-10-22 22:35:36.539084	2024-10-22 22:35:36.539084
56233	23	2025-01-21 15:00:00	2025-01-21 16:00:00	f	2024-10-22 22:35:36.54245	2024-10-22 22:35:36.54245
56234	23	2025-01-21 16:00:00	2025-01-21 17:00:00	f	2024-10-22 22:35:36.544539	2024-10-22 22:35:36.544539
56235	23	2025-01-21 17:00:00	2025-01-21 18:00:00	f	2024-10-22 22:35:36.547705	2024-10-22 22:35:36.547705
56236	23	2025-01-21 18:00:00	2025-01-21 19:00:00	f	2024-10-22 22:35:36.550216	2024-10-22 22:35:36.550216
56237	23	2025-01-21 19:00:00	2025-01-21 20:00:00	f	2024-10-22 22:35:36.553587	2024-10-22 22:35:36.553587
56238	23	2025-01-21 20:00:00	2025-01-21 21:00:00	f	2024-10-22 22:35:36.555965	2024-10-22 22:35:36.555965
56239	23	2025-01-22 09:00:00	2025-01-22 10:00:00	f	2024-10-22 22:35:36.558293	2024-10-22 22:35:36.558293
56240	23	2025-01-22 10:00:00	2025-01-22 11:00:00	f	2024-10-22 22:35:36.561681	2024-10-22 22:35:36.561681
56241	23	2025-01-22 11:00:00	2025-01-22 12:00:00	f	2024-10-22 22:35:36.564195	2024-10-22 22:35:36.564195
56242	23	2025-01-22 12:00:00	2025-01-22 13:00:00	f	2024-10-22 22:35:36.566451	2024-10-22 22:35:36.566451
56243	23	2025-01-22 13:00:00	2025-01-22 14:00:00	f	2024-10-22 22:35:36.570562	2024-10-22 22:35:36.570562
56244	23	2025-01-22 14:00:00	2025-01-22 15:00:00	f	2024-10-22 22:35:36.573242	2024-10-22 22:35:36.573242
56245	23	2025-01-22 15:00:00	2025-01-22 16:00:00	f	2024-10-22 22:35:36.576737	2024-10-22 22:35:36.576737
56246	23	2025-01-22 16:00:00	2025-01-22 17:00:00	f	2024-10-22 22:35:36.579143	2024-10-22 22:35:36.579143
56247	23	2025-01-22 17:00:00	2025-01-22 18:00:00	f	2024-10-22 22:35:36.582566	2024-10-22 22:35:36.582566
56248	23	2025-01-22 18:00:00	2025-01-22 19:00:00	f	2024-10-22 22:35:36.585022	2024-10-22 22:35:36.585022
56249	23	2025-01-22 19:00:00	2025-01-22 20:00:00	f	2024-10-22 22:35:36.587082	2024-10-22 22:35:36.587082
56250	23	2025-01-22 20:00:00	2025-01-22 21:00:00	f	2024-10-22 22:35:36.590716	2024-10-22 22:35:36.590716
56251	23	2025-01-23 09:00:00	2025-01-23 10:00:00	f	2024-10-22 22:35:36.593008	2024-10-22 22:35:36.593008
56252	23	2025-01-23 10:00:00	2025-01-23 11:00:00	f	2024-10-22 22:35:36.59643	2024-10-22 22:35:36.59643
56253	23	2025-01-23 11:00:00	2025-01-23 12:00:00	f	2024-10-22 22:35:36.598595	2024-10-22 22:35:36.598595
56254	23	2025-01-23 12:00:00	2025-01-23 13:00:00	f	2024-10-22 22:35:36.601255	2024-10-22 22:35:36.601255
56255	23	2025-01-23 13:00:00	2025-01-23 14:00:00	f	2024-10-22 22:35:36.60441	2024-10-22 22:35:36.60441
56256	23	2025-01-23 14:00:00	2025-01-23 15:00:00	f	2024-10-22 22:35:36.6067	2024-10-22 22:35:36.6067
56257	23	2025-01-23 15:00:00	2025-01-23 16:00:00	f	2024-10-22 22:35:36.612307	2024-10-22 22:35:36.612307
56258	23	2025-01-23 16:00:00	2025-01-23 17:00:00	f	2024-10-22 22:35:36.615073	2024-10-22 22:35:36.615073
56259	23	2025-01-23 17:00:00	2025-01-23 18:00:00	f	2024-10-22 22:35:36.619302	2024-10-22 22:35:36.619302
56260	23	2025-01-23 18:00:00	2025-01-23 19:00:00	f	2024-10-22 22:35:36.621686	2024-10-22 22:35:36.621686
56261	23	2025-01-23 19:00:00	2025-01-23 20:00:00	f	2024-10-22 22:35:36.624966	2024-10-22 22:35:36.624966
56262	23	2025-01-23 20:00:00	2025-01-23 21:00:00	f	2024-10-22 22:35:36.627471	2024-10-22 22:35:36.627471
56263	23	2025-01-24 09:00:00	2025-01-24 10:00:00	f	2024-10-22 22:35:36.630283	2024-10-22 22:35:36.630283
56264	23	2025-01-24 10:00:00	2025-01-24 11:00:00	f	2024-10-22 22:35:36.632934	2024-10-22 22:35:36.632934
56265	23	2025-01-24 11:00:00	2025-01-24 12:00:00	f	2024-10-22 22:35:36.634822	2024-10-22 22:35:36.634822
56266	23	2025-01-24 12:00:00	2025-01-24 13:00:00	f	2024-10-22 22:35:36.637775	2024-10-22 22:35:36.637775
56267	23	2025-01-24 13:00:00	2025-01-24 14:00:00	f	2024-10-22 22:35:36.640122	2024-10-22 22:35:36.640122
56268	23	2025-01-24 14:00:00	2025-01-24 15:00:00	f	2024-10-22 22:35:36.641894	2024-10-22 22:35:36.641894
56269	23	2025-01-24 15:00:00	2025-01-24 16:00:00	f	2024-10-22 22:35:36.646372	2024-10-22 22:35:36.646372
56270	23	2025-01-24 16:00:00	2025-01-24 17:00:00	f	2024-10-22 22:35:36.648879	2024-10-22 22:35:36.648879
56271	23	2025-01-24 17:00:00	2025-01-24 18:00:00	f	2024-10-22 22:35:36.653399	2024-10-22 22:35:36.653399
56272	23	2025-01-24 18:00:00	2025-01-24 19:00:00	f	2024-10-22 22:35:36.655623	2024-10-22 22:35:36.655623
56273	23	2025-01-24 19:00:00	2025-01-24 20:00:00	f	2024-10-22 22:35:36.659148	2024-10-22 22:35:36.659148
56274	23	2025-01-24 20:00:00	2025-01-24 21:00:00	f	2024-10-22 22:35:36.661717	2024-10-22 22:35:36.661717
56275	23	2025-01-25 09:00:00	2025-01-25 10:00:00	f	2024-10-22 22:35:36.664097	2024-10-22 22:35:36.664097
56276	23	2025-01-25 10:00:00	2025-01-25 11:00:00	f	2024-10-22 22:35:36.667721	2024-10-22 22:35:36.667721
56277	23	2025-01-25 11:00:00	2025-01-25 12:00:00	f	2024-10-22 22:35:36.669636	2024-10-22 22:35:36.669636
56278	23	2025-01-25 12:00:00	2025-01-25 13:00:00	f	2024-10-22 22:35:36.672773	2024-10-22 22:35:36.672773
56279	23	2025-01-25 13:00:00	2025-01-25 14:00:00	f	2024-10-22 22:35:36.675866	2024-10-22 22:35:36.675866
56280	23	2025-01-25 14:00:00	2025-01-25 15:00:00	f	2024-10-22 22:35:36.679873	2024-10-22 22:35:36.679873
56281	23	2025-01-25 15:00:00	2025-01-25 16:00:00	f	2024-10-22 22:35:36.68271	2024-10-22 22:35:36.68271
56282	23	2025-01-25 16:00:00	2025-01-25 17:00:00	f	2024-10-22 22:35:36.685715	2024-10-22 22:35:36.685715
56283	23	2025-01-25 17:00:00	2025-01-25 18:00:00	f	2024-10-22 22:35:36.68795	2024-10-22 22:35:36.68795
56284	23	2025-01-25 18:00:00	2025-01-25 19:00:00	f	2024-10-22 22:35:36.69013	2024-10-22 22:35:36.69013
56285	23	2025-01-25 19:00:00	2025-01-25 20:00:00	f	2024-10-22 22:35:36.693082	2024-10-22 22:35:36.693082
56286	23	2025-01-25 20:00:00	2025-01-25 21:00:00	f	2024-10-22 22:35:36.695495	2024-10-22 22:35:36.695495
56287	23	2025-01-27 09:00:00	2025-01-27 10:00:00	f	2024-10-22 22:35:36.697458	2024-10-22 22:35:36.697458
56288	23	2025-01-27 10:00:00	2025-01-27 11:00:00	f	2024-10-22 22:35:36.700621	2024-10-22 22:35:36.700621
56289	23	2025-01-27 11:00:00	2025-01-27 12:00:00	f	2024-10-22 22:35:36.702839	2024-10-22 22:35:36.702839
56290	23	2025-01-27 12:00:00	2025-01-27 13:00:00	f	2024-10-22 22:35:36.705455	2024-10-22 22:35:36.705455
56291	23	2025-01-27 13:00:00	2025-01-27 14:00:00	f	2024-10-22 22:35:36.708889	2024-10-22 22:35:36.708889
56292	23	2025-01-27 14:00:00	2025-01-27 15:00:00	f	2024-10-22 22:35:36.711206	2024-10-22 22:35:36.711206
56293	23	2025-01-27 15:00:00	2025-01-27 16:00:00	f	2024-10-22 22:35:36.715023	2024-10-22 22:35:36.715023
56294	23	2025-01-27 16:00:00	2025-01-27 17:00:00	f	2024-10-22 22:35:36.717511	2024-10-22 22:35:36.717511
56295	23	2025-01-27 17:00:00	2025-01-27 18:00:00	f	2024-10-22 22:35:36.720542	2024-10-22 22:35:36.720542
56296	23	2025-01-27 18:00:00	2025-01-27 19:00:00	f	2024-10-22 22:35:36.723611	2024-10-22 22:35:36.723611
56297	23	2025-01-27 19:00:00	2025-01-27 20:00:00	f	2024-10-22 22:35:36.725737	2024-10-22 22:35:36.725737
56298	23	2025-01-27 20:00:00	2025-01-27 21:00:00	f	2024-10-22 22:35:36.729723	2024-10-22 22:35:36.729723
56299	23	2025-01-28 09:00:00	2025-01-28 10:00:00	f	2024-10-22 22:35:36.731752	2024-10-22 22:35:36.731752
56300	23	2025-01-28 10:00:00	2025-01-28 11:00:00	f	2024-10-22 22:35:36.735015	2024-10-22 22:35:36.735015
56301	23	2025-01-28 11:00:00	2025-01-28 12:00:00	f	2024-10-22 22:35:36.738358	2024-10-22 22:35:36.738358
56302	23	2025-01-28 12:00:00	2025-01-28 13:00:00	f	2024-10-22 22:35:36.742102	2024-10-22 22:35:36.742102
56303	23	2025-01-28 13:00:00	2025-01-28 14:00:00	f	2024-10-22 22:35:36.744974	2024-10-22 22:35:36.744974
56304	23	2025-01-28 14:00:00	2025-01-28 15:00:00	f	2024-10-22 22:35:36.748219	2024-10-22 22:35:36.748219
56305	23	2025-01-28 15:00:00	2025-01-28 16:00:00	f	2024-10-22 22:35:36.753926	2024-10-22 22:35:36.753926
56306	23	2025-01-28 16:00:00	2025-01-28 17:00:00	f	2024-10-22 22:35:36.756731	2024-10-22 22:35:36.756731
56307	23	2025-01-28 17:00:00	2025-01-28 18:00:00	f	2024-10-22 22:35:36.758912	2024-10-22 22:35:36.758912
56308	23	2025-01-28 18:00:00	2025-01-28 19:00:00	f	2024-10-22 22:35:36.761521	2024-10-22 22:35:36.761521
56309	23	2025-01-28 19:00:00	2025-01-28 20:00:00	f	2024-10-22 22:35:36.764175	2024-10-22 22:35:36.764175
56310	23	2025-01-28 20:00:00	2025-01-28 21:00:00	f	2024-10-22 22:35:36.766326	2024-10-22 22:35:36.766326
56311	23	2025-01-29 09:00:00	2025-01-29 10:00:00	f	2024-10-22 22:35:36.770004	2024-10-22 22:35:36.770004
56312	23	2025-01-29 10:00:00	2025-01-29 11:00:00	f	2024-10-22 22:35:36.772565	2024-10-22 22:35:36.772565
56313	23	2025-01-29 11:00:00	2025-01-29 12:00:00	f	2024-10-22 22:35:36.775822	2024-10-22 22:35:36.775822
56314	23	2025-01-29 12:00:00	2025-01-29 13:00:00	f	2024-10-22 22:35:36.778805	2024-10-22 22:35:36.778805
56315	23	2025-01-29 13:00:00	2025-01-29 14:00:00	f	2024-10-22 22:35:36.780675	2024-10-22 22:35:36.780675
56316	23	2025-01-29 14:00:00	2025-01-29 15:00:00	f	2024-10-22 22:35:36.78373	2024-10-22 22:35:36.78373
56317	23	2025-01-29 15:00:00	2025-01-29 16:00:00	f	2024-10-22 22:35:36.786335	2024-10-22 22:35:36.786335
56318	23	2025-01-29 16:00:00	2025-01-29 17:00:00	f	2024-10-22 22:35:36.789089	2024-10-22 22:35:36.789089
56319	23	2025-01-29 17:00:00	2025-01-29 18:00:00	f	2024-10-22 22:35:36.79173	2024-10-22 22:35:36.79173
56320	23	2025-01-29 18:00:00	2025-01-29 19:00:00	f	2024-10-22 22:35:36.793749	2024-10-22 22:35:36.793749
56321	23	2025-01-29 19:00:00	2025-01-29 20:00:00	f	2024-10-22 22:35:36.795962	2024-10-22 22:35:36.795962
56322	23	2025-01-29 20:00:00	2025-01-29 21:00:00	f	2024-10-22 22:35:36.798983	2024-10-22 22:35:36.798983
56323	23	2025-01-30 09:00:00	2025-01-30 10:00:00	f	2024-10-22 22:35:36.80191	2024-10-22 22:35:36.80191
56324	23	2025-01-30 10:00:00	2025-01-30 11:00:00	f	2024-10-22 22:35:36.806126	2024-10-22 22:35:36.806126
56325	23	2025-01-30 11:00:00	2025-01-30 12:00:00	f	2024-10-22 22:35:36.808232	2024-10-22 22:35:36.808232
56326	23	2025-01-30 12:00:00	2025-01-30 13:00:00	f	2024-10-22 22:35:36.81114	2024-10-22 22:35:36.81114
56327	23	2025-01-30 13:00:00	2025-01-30 14:00:00	f	2024-10-22 22:35:36.813585	2024-10-22 22:35:36.813585
56328	23	2025-01-30 14:00:00	2025-01-30 15:00:00	f	2024-10-22 22:35:36.815424	2024-10-22 22:35:36.815424
56329	23	2025-01-30 15:00:00	2025-01-30 16:00:00	f	2024-10-22 22:35:36.818119	2024-10-22 22:35:36.818119
56330	23	2025-01-30 16:00:00	2025-01-30 17:00:00	f	2024-10-22 22:35:36.82049	2024-10-22 22:35:36.82049
56331	23	2025-01-30 17:00:00	2025-01-30 18:00:00	f	2024-10-22 22:35:36.822372	2024-10-22 22:35:36.822372
56332	23	2025-01-30 18:00:00	2025-01-30 19:00:00	f	2024-10-22 22:35:36.825377	2024-10-22 22:35:36.825377
56333	23	2025-01-30 19:00:00	2025-01-30 20:00:00	f	2024-10-22 22:35:36.827622	2024-10-22 22:35:36.827622
56334	23	2025-01-30 20:00:00	2025-01-30 21:00:00	f	2024-10-22 22:35:36.829578	2024-10-22 22:35:36.829578
56335	23	2025-01-31 09:00:00	2025-01-31 10:00:00	f	2024-10-22 22:35:36.833496	2024-10-22 22:35:36.833496
56336	23	2025-01-31 10:00:00	2025-01-31 11:00:00	f	2024-10-22 22:35:36.835871	2024-10-22 22:35:36.835871
56337	23	2025-01-31 11:00:00	2025-01-31 12:00:00	f	2024-10-22 22:35:36.839149	2024-10-22 22:35:36.839149
56338	23	2025-01-31 12:00:00	2025-01-31 13:00:00	f	2024-10-22 22:35:36.841731	2024-10-22 22:35:36.841731
56339	23	2025-01-31 13:00:00	2025-01-31 14:00:00	f	2024-10-22 22:35:36.843709	2024-10-22 22:35:36.843709
56340	23	2025-01-31 14:00:00	2025-01-31 15:00:00	f	2024-10-22 22:35:36.847098	2024-10-22 22:35:36.847098
56341	23	2025-01-31 15:00:00	2025-01-31 16:00:00	f	2024-10-22 22:35:36.849248	2024-10-22 22:35:36.849248
56342	23	2025-01-31 16:00:00	2025-01-31 17:00:00	f	2024-10-22 22:35:36.852267	2024-10-22 22:35:36.852267
56343	23	2025-01-31 17:00:00	2025-01-31 18:00:00	f	2024-10-22 22:35:36.855939	2024-10-22 22:35:36.855939
56344	23	2025-01-31 18:00:00	2025-01-31 19:00:00	f	2024-10-22 22:35:36.859601	2024-10-22 22:35:36.859601
56345	23	2025-01-31 19:00:00	2025-01-31 20:00:00	f	2024-10-22 22:35:36.862435	2024-10-22 22:35:36.862435
56346	23	2025-01-31 20:00:00	2025-01-31 21:00:00	f	2024-10-22 22:35:36.865081	2024-10-22 22:35:36.865081
56347	23	2025-02-01 09:00:00	2025-02-01 10:00:00	f	2024-10-22 22:35:36.868209	2024-10-22 22:35:36.868209
56348	23	2025-02-01 10:00:00	2025-02-01 11:00:00	f	2024-10-22 22:35:36.870314	2024-10-22 22:35:36.870314
56349	23	2025-02-01 11:00:00	2025-02-01 12:00:00	f	2024-10-22 22:35:36.872914	2024-10-22 22:35:36.872914
56350	23	2025-02-01 12:00:00	2025-02-01 13:00:00	f	2024-10-22 22:35:36.875483	2024-10-22 22:35:36.875483
56351	23	2025-02-01 13:00:00	2025-02-01 14:00:00	f	2024-10-22 22:35:36.877375	2024-10-22 22:35:36.877375
56352	23	2025-02-01 14:00:00	2025-02-01 15:00:00	f	2024-10-22 22:35:36.880086	2024-10-22 22:35:36.880086
56353	23	2025-02-01 15:00:00	2025-02-01 16:00:00	f	2024-10-22 22:35:36.882762	2024-10-22 22:35:36.882762
56354	23	2025-02-01 16:00:00	2025-02-01 17:00:00	f	2024-10-22 22:35:36.884717	2024-10-22 22:35:36.884717
56355	23	2025-02-01 17:00:00	2025-02-01 18:00:00	f	2024-10-22 22:35:36.888059	2024-10-22 22:35:36.888059
56356	23	2025-02-01 18:00:00	2025-02-01 19:00:00	f	2024-10-22 22:35:36.890536	2024-10-22 22:35:36.890536
56357	23	2025-02-01 19:00:00	2025-02-01 20:00:00	f	2024-10-22 22:35:36.892494	2024-10-22 22:35:36.892494
56358	23	2025-02-01 20:00:00	2025-02-01 21:00:00	f	2024-10-22 22:35:36.896346	2024-10-22 22:35:36.896346
56359	23	2025-02-03 09:00:00	2025-02-03 10:00:00	f	2024-10-22 22:35:36.898707	2024-10-22 22:35:36.898707
56360	23	2025-02-03 10:00:00	2025-02-03 11:00:00	f	2024-10-22 22:35:36.902103	2024-10-22 22:35:36.902103
56361	23	2025-02-03 11:00:00	2025-02-03 12:00:00	f	2024-10-22 22:35:36.904733	2024-10-22 22:35:36.904733
56362	23	2025-02-03 12:00:00	2025-02-03 13:00:00	f	2024-10-22 22:35:36.907549	2024-10-22 22:35:36.907549
56363	23	2025-02-03 13:00:00	2025-02-03 14:00:00	f	2024-10-22 22:35:36.910757	2024-10-22 22:35:36.910757
56364	23	2025-02-03 14:00:00	2025-02-03 15:00:00	f	2024-10-22 22:35:36.91268	2024-10-22 22:35:36.91268
56365	23	2025-02-03 15:00:00	2025-02-03 16:00:00	f	2024-10-22 22:35:36.915512	2024-10-22 22:35:36.915512
56366	23	2025-02-03 16:00:00	2025-02-03 17:00:00	f	2024-10-22 22:35:36.917971	2024-10-22 22:35:36.917971
56367	23	2025-02-03 17:00:00	2025-02-03 18:00:00	f	2024-10-22 22:35:36.920161	2024-10-22 22:35:36.920161
56368	23	2025-02-03 18:00:00	2025-02-03 19:00:00	f	2024-10-22 22:35:36.923785	2024-10-22 22:35:36.923785
56369	23	2025-02-03 19:00:00	2025-02-03 20:00:00	f	2024-10-22 22:35:36.926409	2024-10-22 22:35:36.926409
56370	23	2025-02-03 20:00:00	2025-02-03 21:00:00	f	2024-10-22 22:35:36.929474	2024-10-22 22:35:36.929474
56371	23	2025-02-04 09:00:00	2025-02-04 10:00:00	f	2024-10-22 22:35:36.932151	2024-10-22 22:35:36.932151
56372	23	2025-02-04 10:00:00	2025-02-04 11:00:00	f	2024-10-22 22:35:36.934404	2024-10-22 22:35:36.934404
56373	23	2025-02-04 11:00:00	2025-02-04 12:00:00	f	2024-10-22 22:35:36.937733	2024-10-22 22:35:36.937733
56374	23	2025-02-04 12:00:00	2025-02-04 13:00:00	f	2024-10-22 22:35:36.93964	2024-10-22 22:35:36.93964
56375	23	2025-02-04 13:00:00	2025-02-04 14:00:00	f	2024-10-22 22:35:36.941869	2024-10-22 22:35:36.941869
56376	23	2025-02-04 14:00:00	2025-02-04 15:00:00	f	2024-10-22 22:35:36.94474	2024-10-22 22:35:36.94474
56377	23	2025-02-04 15:00:00	2025-02-04 16:00:00	f	2024-10-22 22:35:36.946938	2024-10-22 22:35:36.946938
56378	23	2025-02-04 16:00:00	2025-02-04 17:00:00	f	2024-10-22 22:35:36.950089	2024-10-22 22:35:36.950089
56379	23	2025-02-04 17:00:00	2025-02-04 18:00:00	f	2024-10-22 22:35:36.952525	2024-10-22 22:35:36.952525
56380	23	2025-02-04 18:00:00	2025-02-04 19:00:00	f	2024-10-22 22:35:36.954571	2024-10-22 22:35:36.954571
56381	23	2025-02-04 19:00:00	2025-02-04 20:00:00	f	2024-10-22 22:35:36.958509	2024-10-22 22:35:36.958509
56382	23	2025-02-04 20:00:00	2025-02-04 21:00:00	f	2024-10-22 22:35:36.960638	2024-10-22 22:35:36.960638
56383	23	2025-02-05 09:00:00	2025-02-05 10:00:00	f	2024-10-22 22:35:36.963394	2024-10-22 22:35:36.963394
56384	23	2025-02-05 10:00:00	2025-02-05 11:00:00	f	2024-10-22 22:35:36.966197	2024-10-22 22:35:36.966197
56385	23	2025-02-05 11:00:00	2025-02-05 12:00:00	f	2024-10-22 22:35:36.968128	2024-10-22 22:35:36.968128
56386	23	2025-02-05 12:00:00	2025-02-05 13:00:00	f	2024-10-22 22:35:36.970991	2024-10-22 22:35:36.970991
56387	23	2025-02-05 13:00:00	2025-02-05 14:00:00	f	2024-10-22 22:35:36.973536	2024-10-22 22:35:36.973536
56388	23	2025-02-05 14:00:00	2025-02-05 15:00:00	f	2024-10-22 22:35:36.976649	2024-10-22 22:35:36.976649
56389	23	2025-02-05 15:00:00	2025-02-05 16:00:00	f	2024-10-22 22:35:36.980173	2024-10-22 22:35:36.980173
56390	23	2025-02-05 16:00:00	2025-02-05 17:00:00	f	2024-10-22 22:35:36.982175	2024-10-22 22:35:36.982175
56391	23	2025-02-05 17:00:00	2025-02-05 18:00:00	f	2024-10-22 22:35:36.984752	2024-10-22 22:35:36.984752
56392	23	2025-02-05 18:00:00	2025-02-05 19:00:00	f	2024-10-22 22:35:36.987581	2024-10-22 22:35:36.987581
56393	23	2025-02-05 19:00:00	2025-02-05 20:00:00	f	2024-10-22 22:35:36.990135	2024-10-22 22:35:36.990135
56394	23	2025-02-05 20:00:00	2025-02-05 21:00:00	f	2024-10-22 22:35:36.993864	2024-10-22 22:35:36.993864
56395	23	2025-02-06 09:00:00	2025-02-06 10:00:00	f	2024-10-22 22:35:36.99582	2024-10-22 22:35:36.99582
56396	23	2025-02-06 10:00:00	2025-02-06 11:00:00	f	2024-10-22 22:35:36.998723	2024-10-22 22:35:36.998723
56397	23	2025-02-06 11:00:00	2025-02-06 12:00:00	f	2024-10-22 22:35:37.000933	2024-10-22 22:35:37.000933
56398	23	2025-02-06 12:00:00	2025-02-06 13:00:00	f	2024-10-22 22:35:37.003096	2024-10-22 22:35:37.003096
56399	23	2025-02-06 13:00:00	2025-02-06 14:00:00	f	2024-10-22 22:35:37.006373	2024-10-22 22:35:37.006373
56400	23	2025-02-06 14:00:00	2025-02-06 15:00:00	f	2024-10-22 22:35:37.008747	2024-10-22 22:35:37.008747
56401	23	2025-02-06 15:00:00	2025-02-06 16:00:00	f	2024-10-22 22:35:37.01133	2024-10-22 22:35:37.01133
56402	23	2025-02-06 16:00:00	2025-02-06 17:00:00	f	2024-10-22 22:35:37.014109	2024-10-22 22:35:37.014109
56403	23	2025-02-06 17:00:00	2025-02-06 18:00:00	f	2024-10-22 22:35:37.016577	2024-10-22 22:35:37.016577
56404	23	2025-02-06 18:00:00	2025-02-06 19:00:00	f	2024-10-22 22:35:37.020502	2024-10-22 22:35:37.020502
56405	23	2025-02-06 19:00:00	2025-02-06 20:00:00	f	2024-10-22 22:35:37.023164	2024-10-22 22:35:37.023164
56406	23	2025-02-06 20:00:00	2025-02-06 21:00:00	f	2024-10-22 22:35:37.029931	2024-10-22 22:35:37.029931
56407	23	2025-02-07 09:00:00	2025-02-07 10:00:00	f	2024-10-22 22:35:37.032814	2024-10-22 22:35:37.032814
56408	23	2025-02-07 10:00:00	2025-02-07 11:00:00	f	2024-10-22 22:35:37.035012	2024-10-22 22:35:37.035012
56409	23	2025-02-07 11:00:00	2025-02-07 12:00:00	f	2024-10-22 22:35:37.036925	2024-10-22 22:35:37.036925
56410	23	2025-02-07 12:00:00	2025-02-07 13:00:00	f	2024-10-22 22:35:37.039977	2024-10-22 22:35:37.039977
56411	23	2025-02-07 13:00:00	2025-02-07 14:00:00	f	2024-10-22 22:35:37.042474	2024-10-22 22:35:37.042474
56412	23	2025-02-07 14:00:00	2025-02-07 15:00:00	f	2024-10-22 22:35:37.044542	2024-10-22 22:35:37.044542
56413	23	2025-02-07 15:00:00	2025-02-07 16:00:00	f	2024-10-22 22:35:37.047969	2024-10-22 22:35:37.047969
56414	23	2025-02-07 16:00:00	2025-02-07 17:00:00	f	2024-10-22 22:35:37.050784	2024-10-22 22:35:37.050784
56415	23	2025-02-07 17:00:00	2025-02-07 18:00:00	f	2024-10-22 22:35:37.053696	2024-10-22 22:35:37.053696
56416	23	2025-02-07 18:00:00	2025-02-07 19:00:00	f	2024-10-22 22:35:37.056625	2024-10-22 22:35:37.056625
56417	23	2025-02-07 19:00:00	2025-02-07 20:00:00	f	2024-10-22 22:35:37.058516	2024-10-22 22:35:37.058516
56418	23	2025-02-07 20:00:00	2025-02-07 21:00:00	f	2024-10-22 22:35:37.061535	2024-10-22 22:35:37.061535
56419	23	2025-02-08 09:00:00	2025-02-08 10:00:00	f	2024-10-22 22:35:37.063962	2024-10-22 22:35:37.063962
56420	23	2025-02-08 10:00:00	2025-02-08 11:00:00	f	2024-10-22 22:35:37.066375	2024-10-22 22:35:37.066375
56421	23	2025-02-08 11:00:00	2025-02-08 12:00:00	f	2024-10-22 22:35:37.069613	2024-10-22 22:35:37.069613
56422	23	2025-02-08 12:00:00	2025-02-08 13:00:00	f	2024-10-22 22:35:37.071827	2024-10-22 22:35:37.071827
56423	23	2025-02-08 13:00:00	2025-02-08 14:00:00	f	2024-10-22 22:35:37.074387	2024-10-22 22:35:37.074387
56424	23	2025-02-08 14:00:00	2025-02-08 15:00:00	f	2024-10-22 22:35:37.076735	2024-10-22 22:35:37.076735
56425	23	2025-02-08 15:00:00	2025-02-08 16:00:00	f	2024-10-22 22:35:37.078671	2024-10-22 22:35:37.078671
56426	23	2025-02-08 16:00:00	2025-02-08 17:00:00	f	2024-10-22 22:35:37.081445	2024-10-22 22:35:37.081445
56427	23	2025-02-08 17:00:00	2025-02-08 18:00:00	f	2024-10-22 22:35:37.084366	2024-10-22 22:35:37.084366
56428	23	2025-02-08 18:00:00	2025-02-08 19:00:00	f	2024-10-22 22:35:37.086282	2024-10-22 22:35:37.086282
56429	23	2025-02-08 19:00:00	2025-02-08 20:00:00	f	2024-10-22 22:35:37.089184	2024-10-22 22:35:37.089184
56430	23	2025-02-08 20:00:00	2025-02-08 21:00:00	f	2024-10-22 22:35:37.09151	2024-10-22 22:35:37.09151
56431	23	2025-02-10 09:00:00	2025-02-10 10:00:00	f	2024-10-22 22:35:37.093497	2024-10-22 22:35:37.093497
56432	23	2025-02-10 10:00:00	2025-02-10 11:00:00	f	2024-10-22 22:35:37.096434	2024-10-22 22:35:37.096434
56433	23	2025-02-10 11:00:00	2025-02-10 12:00:00	f	2024-10-22 22:35:37.098603	2024-10-22 22:35:37.098603
56434	23	2025-02-10 12:00:00	2025-02-10 13:00:00	f	2024-10-22 22:35:37.100877	2024-10-22 22:35:37.100877
56435	23	2025-02-10 13:00:00	2025-02-10 14:00:00	f	2024-10-22 22:35:37.104515	2024-10-22 22:35:37.104515
56436	23	2025-02-10 14:00:00	2025-02-10 15:00:00	f	2024-10-22 22:35:37.106507	2024-10-22 22:35:37.106507
56437	23	2025-02-10 15:00:00	2025-02-10 16:00:00	f	2024-10-22 22:35:37.108797	2024-10-22 22:35:37.108797
56438	23	2025-02-10 16:00:00	2025-02-10 17:00:00	f	2024-10-22 22:35:37.111397	2024-10-22 22:35:37.111397
56439	23	2025-02-10 17:00:00	2025-02-10 18:00:00	f	2024-10-22 22:35:37.114193	2024-10-22 22:35:37.114193
56440	23	2025-02-10 18:00:00	2025-02-10 19:00:00	f	2024-10-22 22:35:37.117471	2024-10-22 22:35:37.117471
56441	23	2025-02-10 19:00:00	2025-02-10 20:00:00	f	2024-10-22 22:35:37.119877	2024-10-22 22:35:37.119877
56442	23	2025-02-10 20:00:00	2025-02-10 21:00:00	f	2024-10-22 22:35:37.122116	2024-10-22 22:35:37.122116
56443	23	2025-02-11 09:00:00	2025-02-11 10:00:00	f	2024-10-22 22:35:37.12586	2024-10-22 22:35:37.12586
56444	23	2025-02-11 10:00:00	2025-02-11 11:00:00	f	2024-10-22 22:35:37.128648	2024-10-22 22:35:37.128648
56445	23	2025-02-11 11:00:00	2025-02-11 12:00:00	f	2024-10-22 22:35:37.132417	2024-10-22 22:35:37.132417
56446	23	2025-02-11 12:00:00	2025-02-11 13:00:00	f	2024-10-22 22:35:37.135017	2024-10-22 22:35:37.135017
56447	23	2025-02-11 13:00:00	2025-02-11 14:00:00	f	2024-10-22 22:35:37.138117	2024-10-22 22:35:37.138117
56448	23	2025-02-11 14:00:00	2025-02-11 15:00:00	f	2024-10-22 22:35:37.140596	2024-10-22 22:35:37.140596
56449	23	2025-02-11 15:00:00	2025-02-11 16:00:00	f	2024-10-22 22:35:37.143294	2024-10-22 22:35:37.143294
56450	23	2025-02-11 16:00:00	2025-02-11 17:00:00	f	2024-10-22 22:35:37.147094	2024-10-22 22:35:37.147094
56451	23	2025-02-11 17:00:00	2025-02-11 18:00:00	f	2024-10-22 22:35:37.148971	2024-10-22 22:35:37.148971
56452	23	2025-02-11 18:00:00	2025-02-11 19:00:00	f	2024-10-22 22:35:37.15239	2024-10-22 22:35:37.15239
56453	23	2025-02-11 19:00:00	2025-02-11 20:00:00	f	2024-10-22 22:35:37.15467	2024-10-22 22:35:37.15467
56454	23	2025-02-11 20:00:00	2025-02-11 21:00:00	f	2024-10-22 22:35:37.158157	2024-10-22 22:35:37.158157
56455	23	2025-02-12 09:00:00	2025-02-12 10:00:00	f	2024-10-22 22:35:37.160931	2024-10-22 22:35:37.160931
56456	23	2025-02-12 10:00:00	2025-02-12 11:00:00	f	2024-10-22 22:35:37.163056	2024-10-22 22:35:37.163056
56457	23	2025-02-12 11:00:00	2025-02-12 12:00:00	f	2024-10-22 22:35:37.165831	2024-10-22 22:35:37.165831
56458	23	2025-02-12 12:00:00	2025-02-12 13:00:00	f	2024-10-22 22:35:37.168116	2024-10-22 22:35:37.168116
56459	23	2025-02-12 13:00:00	2025-02-12 14:00:00	f	2024-10-22 22:35:37.170114	2024-10-22 22:35:37.170114
56460	23	2025-02-12 14:00:00	2025-02-12 15:00:00	f	2024-10-22 22:35:37.173782	2024-10-22 22:35:37.173782
56461	23	2025-02-12 15:00:00	2025-02-12 16:00:00	f	2024-10-22 22:35:37.176125	2024-10-22 22:35:37.176125
56462	23	2025-02-12 16:00:00	2025-02-12 17:00:00	f	2024-10-22 22:35:37.179115	2024-10-22 22:35:37.179115
56463	23	2025-02-12 17:00:00	2025-02-12 18:00:00	f	2024-10-22 22:35:37.181703	2024-10-22 22:35:37.181703
56464	23	2025-02-12 18:00:00	2025-02-12 19:00:00	f	2024-10-22 22:35:37.183647	2024-10-22 22:35:37.183647
56465	23	2025-02-12 19:00:00	2025-02-12 20:00:00	f	2024-10-22 22:35:37.187221	2024-10-22 22:35:37.187221
56466	23	2025-02-12 20:00:00	2025-02-12 21:00:00	f	2024-10-22 22:35:37.18948	2024-10-22 22:35:37.18948
56467	23	2025-02-13 09:00:00	2025-02-13 10:00:00	f	2024-10-22 22:35:37.191539	2024-10-22 22:35:37.191539
56468	23	2025-02-13 10:00:00	2025-02-13 11:00:00	f	2024-10-22 22:35:37.19473	2024-10-22 22:35:37.19473
56469	23	2025-02-13 11:00:00	2025-02-13 12:00:00	f	2024-10-22 22:35:37.196617	2024-10-22 22:35:37.196617
56470	23	2025-02-13 12:00:00	2025-02-13 13:00:00	f	2024-10-22 22:35:37.199136	2024-10-22 22:35:37.199136
56471	23	2025-02-13 13:00:00	2025-02-13 14:00:00	f	2024-10-22 22:35:37.202034	2024-10-22 22:35:37.202034
56472	23	2025-02-13 14:00:00	2025-02-13 15:00:00	f	2024-10-22 22:35:37.204734	2024-10-22 22:35:37.204734
56473	23	2025-02-13 15:00:00	2025-02-13 16:00:00	f	2024-10-22 22:35:37.208657	2024-10-22 22:35:37.208657
56474	23	2025-02-13 16:00:00	2025-02-13 17:00:00	f	2024-10-22 22:35:37.211407	2024-10-22 22:35:37.211407
56475	23	2025-02-13 17:00:00	2025-02-13 18:00:00	f	2024-10-22 22:35:37.214855	2024-10-22 22:35:37.214855
56476	23	2025-02-13 18:00:00	2025-02-13 19:00:00	f	2024-10-22 22:35:37.217526	2024-10-22 22:35:37.217526
56477	23	2025-02-13 19:00:00	2025-02-13 20:00:00	f	2024-10-22 22:35:37.221033	2024-10-22 22:35:37.221033
56478	23	2025-02-13 20:00:00	2025-02-13 21:00:00	f	2024-10-22 22:35:37.223745	2024-10-22 22:35:37.223745
56479	23	2025-02-14 09:00:00	2025-02-14 10:00:00	f	2024-10-22 22:35:37.225625	2024-10-22 22:35:37.225625
56480	23	2025-02-14 10:00:00	2025-02-14 11:00:00	f	2024-10-22 22:35:37.228921	2024-10-22 22:35:37.228921
56481	23	2025-02-14 11:00:00	2025-02-14 12:00:00	f	2024-10-22 22:35:37.23109	2024-10-22 22:35:37.23109
56482	23	2025-02-14 12:00:00	2025-02-14 13:00:00	f	2024-10-22 22:35:37.233801	2024-10-22 22:35:37.233801
56483	23	2025-02-14 13:00:00	2025-02-14 14:00:00	f	2024-10-22 22:35:37.236764	2024-10-22 22:35:37.236764
56484	23	2025-02-14 14:00:00	2025-02-14 15:00:00	f	2024-10-22 22:35:37.239596	2024-10-22 22:35:37.239596
56485	23	2025-02-14 15:00:00	2025-02-14 16:00:00	f	2024-10-22 22:35:37.243203	2024-10-22 22:35:37.243203
56486	23	2025-02-14 16:00:00	2025-02-14 17:00:00	f	2024-10-22 22:35:37.245485	2024-10-22 22:35:37.245485
56487	23	2025-02-14 17:00:00	2025-02-14 18:00:00	f	2024-10-22 22:35:37.248402	2024-10-22 22:35:37.248402
56488	23	2025-02-14 18:00:00	2025-02-14 19:00:00	f	2024-10-22 22:35:37.251202	2024-10-22 22:35:37.251202
56489	23	2025-02-14 19:00:00	2025-02-14 20:00:00	f	2024-10-22 22:35:37.253879	2024-10-22 22:35:37.253879
56490	23	2025-02-14 20:00:00	2025-02-14 21:00:00	f	2024-10-22 22:35:37.257521	2024-10-22 22:35:37.257521
56491	23	2025-02-15 09:00:00	2025-02-15 10:00:00	f	2024-10-22 22:35:37.25952	2024-10-22 22:35:37.25952
56492	23	2025-02-15 10:00:00	2025-02-15 11:00:00	f	2024-10-22 22:35:37.262745	2024-10-22 22:35:37.262745
56493	23	2025-02-15 11:00:00	2025-02-15 12:00:00	f	2024-10-22 22:35:37.2649	2024-10-22 22:35:37.2649
56494	23	2025-02-15 12:00:00	2025-02-15 13:00:00	f	2024-10-22 22:35:37.267071	2024-10-22 22:35:37.267071
56495	23	2025-02-15 13:00:00	2025-02-15 14:00:00	f	2024-10-22 22:35:37.271401	2024-10-22 22:35:37.271401
56496	23	2025-02-15 14:00:00	2025-02-15 15:00:00	f	2024-10-22 22:35:37.273677	2024-10-22 22:35:37.273677
56497	23	2025-02-15 15:00:00	2025-02-15 16:00:00	f	2024-10-22 22:35:37.277008	2024-10-22 22:35:37.277008
56498	23	2025-02-15 16:00:00	2025-02-15 17:00:00	f	2024-10-22 22:35:37.280136	2024-10-22 22:35:37.280136
56499	23	2025-02-15 17:00:00	2025-02-15 18:00:00	f	2024-10-22 22:35:37.283832	2024-10-22 22:35:37.283832
56500	23	2025-02-15 18:00:00	2025-02-15 19:00:00	f	2024-10-22 22:35:37.286635	2024-10-22 22:35:37.286635
56501	23	2025-02-15 19:00:00	2025-02-15 20:00:00	f	2024-10-22 22:35:37.289063	2024-10-22 22:35:37.289063
56502	23	2025-02-15 20:00:00	2025-02-15 21:00:00	f	2024-10-22 22:35:37.292825	2024-10-22 22:35:37.292825
56503	23	2025-02-17 09:00:00	2025-02-17 10:00:00	f	2024-10-22 22:35:37.295621	2024-10-22 22:35:37.295621
56504	23	2025-02-17 10:00:00	2025-02-17 11:00:00	f	2024-10-22 22:35:37.299516	2024-10-22 22:35:37.299516
56505	23	2025-02-17 11:00:00	2025-02-17 12:00:00	f	2024-10-22 22:35:37.302366	2024-10-22 22:35:37.302366
56506	23	2025-02-17 12:00:00	2025-02-17 13:00:00	f	2024-10-22 22:35:37.308953	2024-10-22 22:35:37.308953
56507	23	2025-02-17 13:00:00	2025-02-17 14:00:00	f	2024-10-22 22:35:37.31235	2024-10-22 22:35:37.31235
56508	23	2025-02-17 14:00:00	2025-02-17 15:00:00	f	2024-10-22 22:35:37.314405	2024-10-22 22:35:37.314405
56509	23	2025-02-17 15:00:00	2025-02-17 16:00:00	f	2024-10-22 22:35:37.317294	2024-10-22 22:35:37.317294
56510	23	2025-02-17 16:00:00	2025-02-17 17:00:00	f	2024-10-22 22:35:37.320257	2024-10-22 22:35:37.320257
56511	23	2025-02-17 17:00:00	2025-02-17 18:00:00	f	2024-10-22 22:35:37.322526	2024-10-22 22:35:37.322526
56512	23	2025-02-17 18:00:00	2025-02-17 19:00:00	f	2024-10-22 22:35:37.325433	2024-10-22 22:35:37.325433
56513	23	2025-02-17 19:00:00	2025-02-17 20:00:00	f	2024-10-22 22:35:37.327701	2024-10-22 22:35:37.327701
56514	23	2025-02-17 20:00:00	2025-02-17 21:00:00	f	2024-10-22 22:35:37.33013	2024-10-22 22:35:37.33013
56515	23	2025-02-18 09:00:00	2025-02-18 10:00:00	f	2024-10-22 22:35:37.33361	2024-10-22 22:35:37.33361
56516	23	2025-02-18 10:00:00	2025-02-18 11:00:00	f	2024-10-22 22:35:37.335619	2024-10-22 22:35:37.335619
56517	23	2025-02-18 11:00:00	2025-02-18 12:00:00	f	2024-10-22 22:35:37.338574	2024-10-22 22:35:37.338574
56518	23	2025-02-18 12:00:00	2025-02-18 13:00:00	f	2024-10-22 22:35:37.341456	2024-10-22 22:35:37.341456
56519	23	2025-02-18 13:00:00	2025-02-18 14:00:00	f	2024-10-22 22:35:37.343608	2024-10-22 22:35:37.343608
56520	23	2025-02-18 14:00:00	2025-02-18 15:00:00	f	2024-10-22 22:35:37.346855	2024-10-22 22:35:37.346855
56521	23	2025-02-18 15:00:00	2025-02-18 16:00:00	f	2024-10-22 22:35:37.349186	2024-10-22 22:35:37.349186
56522	23	2025-02-18 16:00:00	2025-02-18 17:00:00	f	2024-10-22 22:35:37.351523	2024-10-22 22:35:37.351523
56523	23	2025-02-18 17:00:00	2025-02-18 18:00:00	f	2024-10-22 22:35:37.354347	2024-10-22 22:35:37.354347
56524	23	2025-02-18 18:00:00	2025-02-18 19:00:00	f	2024-10-22 22:35:37.356871	2024-10-22 22:35:37.356871
56525	23	2025-02-18 19:00:00	2025-02-18 20:00:00	f	2024-10-22 22:35:37.360161	2024-10-22 22:35:37.360161
56526	23	2025-02-18 20:00:00	2025-02-18 21:00:00	f	2024-10-22 22:35:37.363093	2024-10-22 22:35:37.363093
56527	23	2025-02-19 09:00:00	2025-02-19 10:00:00	f	2024-10-22 22:35:37.36622	2024-10-22 22:35:37.36622
56528	23	2025-02-19 10:00:00	2025-02-19 11:00:00	f	2024-10-22 22:35:37.369154	2024-10-22 22:35:37.369154
56529	23	2025-02-19 11:00:00	2025-02-19 12:00:00	f	2024-10-22 22:35:37.370972	2024-10-22 22:35:37.370972
56530	23	2025-02-19 12:00:00	2025-02-19 13:00:00	f	2024-10-22 22:35:37.374146	2024-10-22 22:35:37.374146
56531	23	2025-02-19 13:00:00	2025-02-19 14:00:00	f	2024-10-22 22:35:37.37657	2024-10-22 22:35:37.37657
56532	23	2025-02-19 14:00:00	2025-02-19 15:00:00	f	2024-10-22 22:35:37.379369	2024-10-22 22:35:37.379369
56533	23	2025-02-19 15:00:00	2025-02-19 16:00:00	f	2024-10-22 22:35:37.382165	2024-10-22 22:35:37.382165
56534	23	2025-02-19 16:00:00	2025-02-19 17:00:00	f	2024-10-22 22:35:37.384281	2024-10-22 22:35:37.384281
56535	23	2025-02-19 17:00:00	2025-02-19 18:00:00	f	2024-10-22 22:35:37.386859	2024-10-22 22:35:37.386859
56536	23	2025-02-19 18:00:00	2025-02-19 19:00:00	f	2024-10-22 22:35:37.38941	2024-10-22 22:35:37.38941
56537	23	2025-02-19 19:00:00	2025-02-19 20:00:00	f	2024-10-22 22:35:37.39197	2024-10-22 22:35:37.39197
56538	23	2025-02-19 20:00:00	2025-02-19 21:00:00	f	2024-10-22 22:35:37.395993	2024-10-22 22:35:37.395993
56539	23	2025-02-20 09:00:00	2025-02-20 10:00:00	f	2024-10-22 22:35:37.398319	2024-10-22 22:35:37.398319
56540	23	2025-02-20 10:00:00	2025-02-20 11:00:00	f	2024-10-22 22:35:37.40185	2024-10-22 22:35:37.40185
56541	23	2025-02-20 11:00:00	2025-02-20 12:00:00	f	2024-10-22 22:35:37.40441	2024-10-22 22:35:37.40441
56542	23	2025-02-20 12:00:00	2025-02-20 13:00:00	f	2024-10-22 22:35:37.407076	2024-10-22 22:35:37.407076
56543	23	2025-02-20 13:00:00	2025-02-20 14:00:00	f	2024-10-22 22:35:37.41023	2024-10-22 22:35:37.41023
56544	23	2025-02-20 14:00:00	2025-02-20 15:00:00	f	2024-10-22 22:35:37.412246	2024-10-22 22:35:37.412246
56545	23	2025-02-20 15:00:00	2025-02-20 16:00:00	f	2024-10-22 22:35:37.415031	2024-10-22 22:35:37.415031
56546	23	2025-02-20 16:00:00	2025-02-20 17:00:00	f	2024-10-22 22:35:37.417466	2024-10-22 22:35:37.417466
56547	23	2025-02-20 17:00:00	2025-02-20 18:00:00	f	2024-10-22 22:35:37.419383	2024-10-22 22:35:37.419383
56548	23	2025-02-20 18:00:00	2025-02-20 19:00:00	f	2024-10-22 22:35:37.422319	2024-10-22 22:35:37.422319
56549	23	2025-02-20 19:00:00	2025-02-20 20:00:00	f	2024-10-22 22:35:37.425137	2024-10-22 22:35:37.425137
56550	23	2025-02-20 20:00:00	2025-02-20 21:00:00	f	2024-10-22 22:35:37.427231	2024-10-22 22:35:37.427231
55310	23	2024-10-23 16:00:00	2024-10-23 17:00:00	t	2024-10-22 22:35:33.953229	2024-10-23 15:21:16.689582
57488	25	2024-10-24 12:00:00	2024-10-24 13:00:00	f	2024-10-23 23:44:35.974256	2024-10-23 23:44:35.974256
57489	25	2024-10-24 13:00:00	2024-10-24 14:00:00	f	2024-10-23 23:44:35.97618	2024-10-23 23:44:35.97618
57490	25	2024-10-24 14:00:00	2024-10-24 15:00:00	f	2024-10-23 23:44:35.978306	2024-10-23 23:44:35.978306
57491	25	2024-10-24 15:00:00	2024-10-24 16:00:00	f	2024-10-23 23:44:35.9805	2024-10-23 23:44:35.9805
57492	25	2024-10-24 16:00:00	2024-10-24 17:00:00	f	2024-10-23 23:44:35.984287	2024-10-23 23:44:35.984287
57493	25	2024-10-24 17:00:00	2024-10-24 18:00:00	f	2024-10-23 23:44:35.989868	2024-10-23 23:44:35.989868
57494	25	2024-10-24 18:00:00	2024-10-24 19:00:00	f	2024-10-23 23:44:35.992212	2024-10-23 23:44:35.992212
57495	25	2024-10-25 11:00:00	2024-10-25 12:00:00	f	2024-10-23 23:44:35.995401	2024-10-23 23:44:35.995401
57496	25	2024-10-25 12:00:00	2024-10-25 13:00:00	f	2024-10-23 23:44:35.999138	2024-10-23 23:44:35.999138
57497	25	2024-10-25 13:00:00	2024-10-25 14:00:00	f	2024-10-23 23:44:36.002092	2024-10-23 23:44:36.002092
57498	25	2024-10-25 14:00:00	2024-10-25 15:00:00	f	2024-10-23 23:44:36.005822	2024-10-23 23:44:36.005822
57499	25	2024-10-25 15:00:00	2024-10-25 16:00:00	f	2024-10-23 23:44:36.008891	2024-10-23 23:44:36.008891
57500	25	2024-10-25 16:00:00	2024-10-25 17:00:00	f	2024-10-23 23:44:36.012769	2024-10-23 23:44:36.012769
57501	25	2024-10-25 17:00:00	2024-10-25 18:00:00	f	2024-10-23 23:44:36.016969	2024-10-23 23:44:36.016969
57502	25	2024-10-25 18:00:00	2024-10-25 19:00:00	f	2024-10-23 23:44:36.021699	2024-10-23 23:44:36.021699
57503	25	2024-10-26 11:00:00	2024-10-26 12:00:00	f	2024-10-23 23:44:36.024589	2024-10-23 23:44:36.024589
57504	25	2024-10-26 12:00:00	2024-10-26 13:00:00	f	2024-10-23 23:44:36.0292	2024-10-23 23:44:36.0292
57505	25	2024-10-26 13:00:00	2024-10-26 14:00:00	f	2024-10-23 23:44:36.033587	2024-10-23 23:44:36.033587
57506	25	2024-10-26 14:00:00	2024-10-26 15:00:00	f	2024-10-23 23:44:36.036774	2024-10-23 23:44:36.036774
57507	25	2024-10-26 15:00:00	2024-10-26 16:00:00	f	2024-10-23 23:44:36.039864	2024-10-23 23:44:36.039864
57508	25	2024-10-26 16:00:00	2024-10-26 17:00:00	f	2024-10-23 23:44:36.042128	2024-10-23 23:44:36.042128
57509	25	2024-10-26 17:00:00	2024-10-26 18:00:00	f	2024-10-23 23:44:36.045428	2024-10-23 23:44:36.045428
57510	25	2024-10-26 18:00:00	2024-10-26 19:00:00	f	2024-10-23 23:44:36.047705	2024-10-23 23:44:36.047705
57511	25	2024-10-28 11:00:00	2024-10-28 12:00:00	f	2024-10-23 23:44:36.050617	2024-10-23 23:44:36.050617
57512	25	2024-10-28 12:00:00	2024-10-28 13:00:00	f	2024-10-23 23:44:36.054686	2024-10-23 23:44:36.054686
57513	25	2024-10-28 13:00:00	2024-10-28 14:00:00	f	2024-10-23 23:44:36.058521	2024-10-23 23:44:36.058521
57514	25	2024-10-28 14:00:00	2024-10-28 15:00:00	f	2024-10-23 23:44:36.062632	2024-10-23 23:44:36.062632
57515	25	2024-10-28 15:00:00	2024-10-28 16:00:00	f	2024-10-23 23:44:36.06515	2024-10-23 23:44:36.06515
57516	25	2024-10-28 16:00:00	2024-10-28 17:00:00	f	2024-10-23 23:44:36.068735	2024-10-23 23:44:36.068735
57517	25	2024-10-28 17:00:00	2024-10-28 18:00:00	f	2024-10-23 23:44:36.072406	2024-10-23 23:44:36.072406
57518	25	2024-10-28 18:00:00	2024-10-28 19:00:00	f	2024-10-23 23:44:36.075034	2024-10-23 23:44:36.075034
57519	25	2024-10-29 11:00:00	2024-10-29 12:00:00	f	2024-10-23 23:44:36.077631	2024-10-23 23:44:36.077631
57520	25	2024-10-29 12:00:00	2024-10-29 13:00:00	f	2024-10-23 23:44:36.080541	2024-10-23 23:44:36.080541
57521	25	2024-10-29 13:00:00	2024-10-29 14:00:00	f	2024-10-23 23:44:36.083122	2024-10-23 23:44:36.083122
57522	25	2024-10-29 14:00:00	2024-10-29 15:00:00	f	2024-10-23 23:44:36.087033	2024-10-23 23:44:36.087033
57523	25	2024-10-29 15:00:00	2024-10-29 16:00:00	f	2024-10-23 23:44:36.097108	2024-10-23 23:44:36.097108
57524	25	2024-10-29 16:00:00	2024-10-29 17:00:00	f	2024-10-23 23:44:36.099964	2024-10-23 23:44:36.099964
57525	25	2024-10-29 17:00:00	2024-10-29 18:00:00	f	2024-10-23 23:44:36.103151	2024-10-23 23:44:36.103151
57526	25	2024-10-29 18:00:00	2024-10-29 19:00:00	f	2024-10-23 23:44:36.10633	2024-10-23 23:44:36.10633
57527	25	2024-10-30 11:00:00	2024-10-30 12:00:00	f	2024-10-23 23:44:36.108688	2024-10-23 23:44:36.108688
57528	25	2024-10-30 12:00:00	2024-10-30 13:00:00	f	2024-10-23 23:44:36.110766	2024-10-23 23:44:36.110766
57529	25	2024-10-30 13:00:00	2024-10-30 14:00:00	f	2024-10-23 23:44:36.112805	2024-10-23 23:44:36.112805
57530	25	2024-10-30 14:00:00	2024-10-30 15:00:00	f	2024-10-23 23:44:36.115194	2024-10-23 23:44:36.115194
57531	25	2024-10-30 15:00:00	2024-10-30 16:00:00	f	2024-10-23 23:44:36.1186	2024-10-23 23:44:36.1186
57532	25	2024-10-30 16:00:00	2024-10-30 17:00:00	f	2024-10-23 23:44:36.1211	2024-10-23 23:44:36.1211
57533	25	2024-10-30 17:00:00	2024-10-30 18:00:00	f	2024-10-23 23:44:36.125618	2024-10-23 23:44:36.125618
57534	25	2024-10-30 18:00:00	2024-10-30 19:00:00	f	2024-10-23 23:44:36.128163	2024-10-23 23:44:36.128163
57535	25	2024-10-31 11:00:00	2024-10-31 12:00:00	f	2024-10-23 23:44:36.132141	2024-10-23 23:44:36.132141
57536	25	2024-10-31 12:00:00	2024-10-31 13:00:00	f	2024-10-23 23:44:36.135594	2024-10-23 23:44:36.135594
57537	25	2024-10-31 13:00:00	2024-10-31 14:00:00	f	2024-10-23 23:44:36.138608	2024-10-23 23:44:36.138608
57538	25	2024-10-31 14:00:00	2024-10-31 15:00:00	f	2024-10-23 23:44:36.141426	2024-10-23 23:44:36.141426
57539	25	2024-10-31 15:00:00	2024-10-31 16:00:00	f	2024-10-23 23:44:36.145961	2024-10-23 23:44:36.145961
57540	25	2024-10-31 16:00:00	2024-10-31 17:00:00	f	2024-10-23 23:44:36.148683	2024-10-23 23:44:36.148683
57541	25	2024-10-31 17:00:00	2024-10-31 18:00:00	f	2024-10-23 23:44:36.15236	2024-10-23 23:44:36.15236
57542	25	2024-10-31 18:00:00	2024-10-31 19:00:00	f	2024-10-23 23:44:36.156892	2024-10-23 23:44:36.156892
57543	25	2024-11-01 11:00:00	2024-11-01 12:00:00	f	2024-10-23 23:44:36.160539	2024-10-23 23:44:36.160539
57544	25	2024-11-01 12:00:00	2024-11-01 13:00:00	f	2024-10-23 23:44:36.16455	2024-10-23 23:44:36.16455
57545	25	2024-11-01 13:00:00	2024-11-01 14:00:00	f	2024-10-23 23:44:36.167183	2024-10-23 23:44:36.167183
57546	25	2024-11-01 14:00:00	2024-11-01 15:00:00	f	2024-10-23 23:44:36.169595	2024-10-23 23:44:36.169595
57547	25	2024-11-01 15:00:00	2024-11-01 16:00:00	f	2024-10-23 23:44:36.174217	2024-10-23 23:44:36.174217
57548	25	2024-11-01 16:00:00	2024-11-01 17:00:00	f	2024-10-23 23:44:36.176935	2024-10-23 23:44:36.176935
57549	25	2024-11-01 17:00:00	2024-11-01 18:00:00	f	2024-10-23 23:44:36.180311	2024-10-23 23:44:36.180311
57550	25	2024-11-01 18:00:00	2024-11-01 19:00:00	f	2024-10-23 23:44:36.183498	2024-10-23 23:44:36.183498
57551	25	2024-11-02 11:00:00	2024-11-02 12:00:00	f	2024-10-23 23:44:36.187192	2024-10-23 23:44:36.187192
57552	25	2024-11-02 12:00:00	2024-11-02 13:00:00	f	2024-10-23 23:44:36.191466	2024-10-23 23:44:36.191466
57553	25	2024-11-02 13:00:00	2024-11-02 14:00:00	f	2024-10-23 23:44:36.194641	2024-10-23 23:44:36.194641
57554	25	2024-11-02 14:00:00	2024-11-02 15:00:00	f	2024-10-23 23:44:36.19741	2024-10-23 23:44:36.19741
57555	25	2024-11-02 15:00:00	2024-11-02 16:00:00	f	2024-10-23 23:44:36.202057	2024-10-23 23:44:36.202057
57556	25	2024-11-02 16:00:00	2024-11-02 17:00:00	f	2024-10-23 23:44:36.206508	2024-10-23 23:44:36.206508
57557	25	2024-11-02 17:00:00	2024-11-02 18:00:00	f	2024-10-23 23:44:36.209883	2024-10-23 23:44:36.209883
57558	25	2024-11-02 18:00:00	2024-11-02 19:00:00	f	2024-10-23 23:44:36.2139	2024-10-23 23:44:36.2139
57559	25	2024-11-04 11:00:00	2024-11-04 12:00:00	f	2024-10-23 23:44:36.216549	2024-10-23 23:44:36.216549
57560	25	2024-11-04 12:00:00	2024-11-04 13:00:00	f	2024-10-23 23:44:36.219881	2024-10-23 23:44:36.219881
57561	25	2024-11-04 13:00:00	2024-11-04 14:00:00	f	2024-10-23 23:44:36.222191	2024-10-23 23:44:36.222191
57562	25	2024-11-04 14:00:00	2024-11-04 15:00:00	f	2024-10-23 23:44:36.224524	2024-10-23 23:44:36.224524
57563	25	2024-11-04 15:00:00	2024-11-04 16:00:00	f	2024-10-23 23:44:36.228599	2024-10-23 23:44:36.228599
57564	25	2024-11-04 16:00:00	2024-11-04 17:00:00	f	2024-10-23 23:44:36.231485	2024-10-23 23:44:36.231485
57565	25	2024-11-04 17:00:00	2024-11-04 18:00:00	f	2024-10-23 23:44:36.234113	2024-10-23 23:44:36.234113
57566	25	2024-11-04 18:00:00	2024-11-04 19:00:00	f	2024-10-23 23:44:36.238174	2024-10-23 23:44:36.238174
57567	25	2024-11-05 11:00:00	2024-11-05 12:00:00	f	2024-10-23 23:44:36.242039	2024-10-23 23:44:36.242039
57568	25	2024-11-05 12:00:00	2024-11-05 13:00:00	f	2024-10-23 23:44:36.245262	2024-10-23 23:44:36.245262
57569	25	2024-11-05 13:00:00	2024-11-05 14:00:00	f	2024-10-23 23:44:36.248519	2024-10-23 23:44:36.248519
57570	25	2024-11-05 14:00:00	2024-11-05 15:00:00	f	2024-10-23 23:44:36.251635	2024-10-23 23:44:36.251635
57571	25	2024-11-05 15:00:00	2024-11-05 16:00:00	f	2024-10-23 23:44:36.255493	2024-10-23 23:44:36.255493
57572	25	2024-11-05 16:00:00	2024-11-05 17:00:00	f	2024-10-23 23:44:36.258492	2024-10-23 23:44:36.258492
57573	25	2024-11-05 17:00:00	2024-11-05 18:00:00	f	2024-10-23 23:44:36.262553	2024-10-23 23:44:36.262553
57574	25	2024-11-05 18:00:00	2024-11-05 19:00:00	f	2024-10-23 23:44:36.26535	2024-10-23 23:44:36.26535
57575	25	2024-11-06 11:00:00	2024-11-06 12:00:00	f	2024-10-23 23:44:36.268828	2024-10-23 23:44:36.268828
57576	25	2024-11-06 12:00:00	2024-11-06 13:00:00	f	2024-10-23 23:44:36.271617	2024-10-23 23:44:36.271617
57577	25	2024-11-06 13:00:00	2024-11-06 14:00:00	f	2024-10-23 23:44:36.274635	2024-10-23 23:44:36.274635
57578	25	2024-11-06 14:00:00	2024-11-06 15:00:00	f	2024-10-23 23:44:36.27702	2024-10-23 23:44:36.27702
57579	25	2024-11-06 15:00:00	2024-11-06 16:00:00	f	2024-10-23 23:44:36.280093	2024-10-23 23:44:36.280093
57580	25	2024-11-06 16:00:00	2024-11-06 17:00:00	f	2024-10-23 23:44:36.283902	2024-10-23 23:44:36.283902
57581	25	2024-11-06 17:00:00	2024-11-06 18:00:00	f	2024-10-23 23:44:36.287075	2024-10-23 23:44:36.287075
57582	25	2024-11-06 18:00:00	2024-11-06 19:00:00	f	2024-10-23 23:44:36.291117	2024-10-23 23:44:36.291117
57583	25	2024-11-07 11:00:00	2024-11-07 12:00:00	f	2024-10-23 23:44:36.294269	2024-10-23 23:44:36.294269
57584	25	2024-11-07 12:00:00	2024-11-07 13:00:00	f	2024-10-23 23:44:36.298782	2024-10-23 23:44:36.298782
57585	25	2024-11-07 13:00:00	2024-11-07 14:00:00	f	2024-10-23 23:44:36.303038	2024-10-23 23:44:36.303038
57586	25	2024-11-07 14:00:00	2024-11-07 15:00:00	f	2024-10-23 23:44:36.306329	2024-10-23 23:44:36.306329
57587	25	2024-11-07 15:00:00	2024-11-07 16:00:00	f	2024-10-23 23:44:36.31072	2024-10-23 23:44:36.31072
57588	25	2024-11-07 16:00:00	2024-11-07 17:00:00	f	2024-10-23 23:44:36.313778	2024-10-23 23:44:36.313778
57589	25	2024-11-07 17:00:00	2024-11-07 18:00:00	f	2024-10-23 23:44:36.317343	2024-10-23 23:44:36.317343
57590	25	2024-11-07 18:00:00	2024-11-07 19:00:00	f	2024-10-23 23:44:36.320403	2024-10-23 23:44:36.320403
57591	25	2024-11-08 11:00:00	2024-11-08 12:00:00	f	2024-10-23 23:44:36.323864	2024-10-23 23:44:36.323864
57592	25	2024-11-08 12:00:00	2024-11-08 13:00:00	f	2024-10-23 23:44:36.326527	2024-10-23 23:44:36.326527
57593	25	2024-11-08 13:00:00	2024-11-08 14:00:00	f	2024-10-23 23:44:36.329521	2024-10-23 23:44:36.329521
57594	25	2024-11-08 14:00:00	2024-11-08 15:00:00	f	2024-10-23 23:44:36.334397	2024-10-23 23:44:36.334397
57595	25	2024-11-08 15:00:00	2024-11-08 16:00:00	f	2024-10-23 23:44:36.33694	2024-10-23 23:44:36.33694
57596	25	2024-11-08 16:00:00	2024-11-08 17:00:00	f	2024-10-23 23:44:36.341575	2024-10-23 23:44:36.341575
57597	25	2024-11-08 17:00:00	2024-11-08 18:00:00	f	2024-10-23 23:44:36.344758	2024-10-23 23:44:36.344758
57598	25	2024-11-08 18:00:00	2024-11-08 19:00:00	f	2024-10-23 23:44:36.3484	2024-10-23 23:44:36.3484
57599	25	2024-11-09 11:00:00	2024-11-09 12:00:00	f	2024-10-23 23:44:36.352285	2024-10-23 23:44:36.352285
57600	25	2024-11-09 12:00:00	2024-11-09 13:00:00	f	2024-10-23 23:44:36.355272	2024-10-23 23:44:36.355272
57601	25	2024-11-09 13:00:00	2024-11-09 14:00:00	f	2024-10-23 23:44:36.359038	2024-10-23 23:44:36.359038
57602	25	2024-11-09 14:00:00	2024-11-09 15:00:00	f	2024-10-23 23:44:36.36197	2024-10-23 23:44:36.36197
57603	25	2024-11-09 15:00:00	2024-11-09 16:00:00	f	2024-10-23 23:44:36.365465	2024-10-23 23:44:36.365465
57604	25	2024-11-09 16:00:00	2024-11-09 17:00:00	f	2024-10-23 23:44:36.369387	2024-10-23 23:44:36.369387
57605	25	2024-11-09 17:00:00	2024-11-09 18:00:00	f	2024-10-23 23:44:36.373682	2024-10-23 23:44:36.373682
57606	25	2024-11-09 18:00:00	2024-11-09 19:00:00	f	2024-10-23 23:44:36.37712	2024-10-23 23:44:36.37712
57607	25	2024-11-11 11:00:00	2024-11-11 12:00:00	f	2024-10-23 23:44:36.381584	2024-10-23 23:44:36.381584
57608	25	2024-11-11 12:00:00	2024-11-11 13:00:00	f	2024-10-23 23:44:36.386159	2024-10-23 23:44:36.386159
57609	25	2024-11-11 13:00:00	2024-11-11 14:00:00	f	2024-10-23 23:44:36.38897	2024-10-23 23:44:36.38897
57610	25	2024-11-11 14:00:00	2024-11-11 15:00:00	f	2024-10-23 23:44:36.393328	2024-10-23 23:44:36.393328
57611	25	2024-11-11 15:00:00	2024-11-11 16:00:00	f	2024-10-23 23:44:36.396997	2024-10-23 23:44:36.396997
57612	25	2024-11-11 16:00:00	2024-11-11 17:00:00	f	2024-10-23 23:44:36.401025	2024-10-23 23:44:36.401025
57613	25	2024-11-11 17:00:00	2024-11-11 18:00:00	f	2024-10-23 23:44:36.40438	2024-10-23 23:44:36.40438
57614	25	2024-11-11 18:00:00	2024-11-11 19:00:00	f	2024-10-23 23:44:36.408125	2024-10-23 23:44:36.408125
57615	25	2024-11-12 11:00:00	2024-11-12 12:00:00	f	2024-10-23 23:44:36.411273	2024-10-23 23:44:36.411273
57616	25	2024-11-12 12:00:00	2024-11-12 13:00:00	f	2024-10-23 23:44:36.414732	2024-10-23 23:44:36.414732
57617	25	2024-11-12 13:00:00	2024-11-12 14:00:00	f	2024-10-23 23:44:36.417386	2024-10-23 23:44:36.417386
57618	25	2024-11-12 14:00:00	2024-11-12 15:00:00	f	2024-10-23 23:44:36.420792	2024-10-23 23:44:36.420792
57619	25	2024-11-12 15:00:00	2024-11-12 16:00:00	f	2024-10-23 23:44:36.423145	2024-10-23 23:44:36.423145
57620	25	2024-11-12 16:00:00	2024-11-12 17:00:00	f	2024-10-23 23:44:36.425476	2024-10-23 23:44:36.425476
57621	25	2024-11-12 17:00:00	2024-11-12 18:00:00	f	2024-10-23 23:44:36.429014	2024-10-23 23:44:36.429014
57622	25	2024-11-12 18:00:00	2024-11-12 19:00:00	f	2024-10-23 23:44:36.431561	2024-10-23 23:44:36.431561
57623	25	2024-11-13 11:00:00	2024-11-13 12:00:00	f	2024-10-23 23:44:36.43496	2024-10-23 23:44:36.43496
57624	25	2024-11-13 12:00:00	2024-11-13 13:00:00	f	2024-10-23 23:44:36.439049	2024-10-23 23:44:36.439049
57625	25	2024-11-13 13:00:00	2024-11-13 14:00:00	f	2024-10-23 23:44:36.443117	2024-10-23 23:44:36.443117
57626	25	2024-11-13 14:00:00	2024-11-13 15:00:00	f	2024-10-23 23:44:36.44632	2024-10-23 23:44:36.44632
57627	25	2024-11-13 15:00:00	2024-11-13 16:00:00	f	2024-10-23 23:44:36.450119	2024-10-23 23:44:36.450119
57628	25	2024-11-13 16:00:00	2024-11-13 17:00:00	f	2024-10-23 23:44:36.453447	2024-10-23 23:44:36.453447
57629	25	2024-11-13 17:00:00	2024-11-13 18:00:00	f	2024-10-23 23:44:36.456946	2024-10-23 23:44:36.456946
57630	25	2024-11-13 18:00:00	2024-11-13 19:00:00	f	2024-10-23 23:44:36.460154	2024-10-23 23:44:36.460154
57631	25	2024-11-14 11:00:00	2024-11-14 12:00:00	f	2024-10-23 23:44:36.464129	2024-10-23 23:44:36.464129
57632	25	2024-11-14 12:00:00	2024-11-14 13:00:00	f	2024-10-23 23:44:36.47348	2024-10-23 23:44:36.47348
57633	25	2024-11-14 13:00:00	2024-11-14 14:00:00	f	2024-10-23 23:44:36.477863	2024-10-23 23:44:36.477863
57634	25	2024-11-14 14:00:00	2024-11-14 15:00:00	f	2024-10-23 23:44:36.481229	2024-10-23 23:44:36.481229
57635	25	2024-11-14 15:00:00	2024-11-14 16:00:00	f	2024-10-23 23:44:36.484852	2024-10-23 23:44:36.484852
57636	25	2024-11-14 16:00:00	2024-11-14 17:00:00	f	2024-10-23 23:44:36.487496	2024-10-23 23:44:36.487496
57637	25	2024-11-14 17:00:00	2024-11-14 18:00:00	f	2024-10-23 23:44:36.490937	2024-10-23 23:44:36.490937
57638	25	2024-11-14 18:00:00	2024-11-14 19:00:00	f	2024-10-23 23:44:36.493315	2024-10-23 23:44:36.493315
57639	25	2024-11-15 11:00:00	2024-11-15 12:00:00	f	2024-10-23 23:44:36.497288	2024-10-23 23:44:36.497288
57640	25	2024-11-15 12:00:00	2024-11-15 13:00:00	f	2024-10-23 23:44:36.499713	2024-10-23 23:44:36.499713
57641	25	2024-11-15 13:00:00	2024-11-15 14:00:00	f	2024-10-23 23:44:36.503728	2024-10-23 23:44:36.503728
57642	25	2024-11-15 14:00:00	2024-11-15 15:00:00	f	2024-10-23 23:44:36.507031	2024-10-23 23:44:36.507031
57643	25	2024-11-15 15:00:00	2024-11-15 16:00:00	f	2024-10-23 23:44:36.510893	2024-10-23 23:44:36.510893
57644	25	2024-11-15 16:00:00	2024-11-15 17:00:00	f	2024-10-23 23:44:36.513394	2024-10-23 23:44:36.513394
57645	25	2024-11-15 17:00:00	2024-11-15 18:00:00	f	2024-10-23 23:44:36.517391	2024-10-23 23:44:36.517391
57646	25	2024-11-15 18:00:00	2024-11-15 19:00:00	f	2024-10-23 23:44:36.52014	2024-10-23 23:44:36.52014
57647	25	2024-11-16 11:00:00	2024-11-16 12:00:00	f	2024-10-23 23:44:36.522797	2024-10-23 23:44:36.522797
57648	25	2024-11-16 12:00:00	2024-11-16 13:00:00	f	2024-10-23 23:44:36.525584	2024-10-23 23:44:36.525584
57649	25	2024-11-16 13:00:00	2024-11-16 14:00:00	f	2024-10-23 23:44:36.529483	2024-10-23 23:44:36.529483
57650	25	2024-11-16 14:00:00	2024-11-16 15:00:00	f	2024-10-23 23:44:36.532561	2024-10-23 23:44:36.532561
57651	25	2024-11-16 15:00:00	2024-11-16 16:00:00	f	2024-10-23 23:44:36.534854	2024-10-23 23:44:36.534854
57652	25	2024-11-16 16:00:00	2024-11-16 17:00:00	f	2024-10-23 23:44:36.537941	2024-10-23 23:44:36.537941
57653	25	2024-11-16 17:00:00	2024-11-16 18:00:00	f	2024-10-23 23:44:36.54236	2024-10-23 23:44:36.54236
57654	25	2024-11-16 18:00:00	2024-11-16 19:00:00	f	2024-10-23 23:44:36.544958	2024-10-23 23:44:36.544958
57655	25	2024-11-18 11:00:00	2024-11-18 12:00:00	f	2024-10-23 23:44:36.549622	2024-10-23 23:44:36.549622
57656	25	2024-11-18 12:00:00	2024-11-18 13:00:00	f	2024-10-23 23:44:36.553096	2024-10-23 23:44:36.553096
57657	25	2024-11-18 13:00:00	2024-11-18 14:00:00	f	2024-10-23 23:44:36.556999	2024-10-23 23:44:36.556999
57658	25	2024-11-18 14:00:00	2024-11-18 15:00:00	f	2024-10-23 23:44:36.560808	2024-10-23 23:44:36.560808
57659	25	2024-11-18 15:00:00	2024-11-18 16:00:00	f	2024-10-23 23:44:36.563883	2024-10-23 23:44:36.563883
57660	25	2024-11-18 16:00:00	2024-11-18 17:00:00	f	2024-10-23 23:44:36.56761	2024-10-23 23:44:36.56761
57661	25	2024-11-18 17:00:00	2024-11-18 18:00:00	f	2024-10-23 23:44:36.57052	2024-10-23 23:44:36.57052
57662	25	2024-11-18 18:00:00	2024-11-18 19:00:00	f	2024-10-23 23:44:36.575052	2024-10-23 23:44:36.575052
57663	25	2024-11-19 11:00:00	2024-11-19 12:00:00	f	2024-10-23 23:44:36.578573	2024-10-23 23:44:36.578573
57664	25	2024-11-19 12:00:00	2024-11-19 13:00:00	f	2024-10-23 23:44:36.582118	2024-10-23 23:44:36.582118
57665	25	2024-11-19 13:00:00	2024-11-19 14:00:00	f	2024-10-23 23:44:36.586068	2024-10-23 23:44:36.586068
57666	25	2024-11-19 14:00:00	2024-11-19 15:00:00	f	2024-10-23 23:44:36.589679	2024-10-23 23:44:36.589679
57667	25	2024-11-19 15:00:00	2024-11-19 16:00:00	f	2024-10-23 23:44:36.593306	2024-10-23 23:44:36.593306
57668	25	2024-11-19 16:00:00	2024-11-19 17:00:00	f	2024-10-23 23:44:36.595792	2024-10-23 23:44:36.595792
57669	25	2024-11-19 17:00:00	2024-11-19 18:00:00	f	2024-10-23 23:44:36.598183	2024-10-23 23:44:36.598183
57670	25	2024-11-19 18:00:00	2024-11-19 19:00:00	f	2024-10-23 23:44:36.600316	2024-10-23 23:44:36.600316
57671	25	2024-11-20 11:00:00	2024-11-20 12:00:00	f	2024-10-23 23:44:36.60387	2024-10-23 23:44:36.60387
57672	25	2024-11-20 12:00:00	2024-11-20 13:00:00	f	2024-10-23 23:44:36.6064	2024-10-23 23:44:36.6064
57673	25	2024-11-20 13:00:00	2024-11-20 14:00:00	f	2024-10-23 23:44:36.609628	2024-10-23 23:44:36.609628
57674	25	2024-11-20 14:00:00	2024-11-20 15:00:00	f	2024-10-23 23:44:36.61331	2024-10-23 23:44:36.61331
57675	25	2024-11-20 15:00:00	2024-11-20 16:00:00	f	2024-10-23 23:44:36.617367	2024-10-23 23:44:36.617367
57676	25	2024-11-20 16:00:00	2024-11-20 17:00:00	f	2024-10-23 23:44:36.620714	2024-10-23 23:44:36.620714
57677	25	2024-11-20 17:00:00	2024-11-20 18:00:00	f	2024-10-23 23:44:36.624919	2024-10-23 23:44:36.624919
57678	25	2024-11-20 18:00:00	2024-11-20 19:00:00	f	2024-10-23 23:44:36.627605	2024-10-23 23:44:36.627605
57679	25	2024-11-21 11:00:00	2024-11-21 12:00:00	f	2024-10-23 23:44:36.631168	2024-10-23 23:44:36.631168
57680	25	2024-11-21 12:00:00	2024-11-21 13:00:00	f	2024-10-23 23:44:36.633951	2024-10-23 23:44:36.633951
57681	25	2024-11-21 13:00:00	2024-11-21 14:00:00	f	2024-10-23 23:44:36.637892	2024-10-23 23:44:36.637892
57682	25	2024-11-21 14:00:00	2024-11-21 15:00:00	f	2024-10-23 23:44:36.640714	2024-10-23 23:44:36.640714
57683	25	2024-11-21 15:00:00	2024-11-21 16:00:00	f	2024-10-23 23:44:36.646032	2024-10-23 23:44:36.646032
57684	25	2024-11-21 16:00:00	2024-11-21 17:00:00	f	2024-10-23 23:44:36.648696	2024-10-23 23:44:36.648696
57685	25	2024-11-21 17:00:00	2024-11-21 18:00:00	f	2024-10-23 23:44:36.652955	2024-10-23 23:44:36.652955
57686	25	2024-11-21 18:00:00	2024-11-21 19:00:00	f	2024-10-23 23:44:36.655545	2024-10-23 23:44:36.655545
57687	25	2024-11-22 11:00:00	2024-11-22 12:00:00	f	2024-10-23 23:44:36.659823	2024-10-23 23:44:36.659823
57688	25	2024-11-22 12:00:00	2024-11-22 13:00:00	f	2024-10-23 23:44:36.664046	2024-10-23 23:44:36.664046
57689	25	2024-11-22 13:00:00	2024-11-22 14:00:00	f	2024-10-23 23:44:36.666647	2024-10-23 23:44:36.666647
57690	25	2024-11-22 14:00:00	2024-11-22 15:00:00	f	2024-10-23 23:44:36.6706	2024-10-23 23:44:36.6706
57691	25	2024-11-22 15:00:00	2024-11-22 16:00:00	f	2024-10-23 23:44:36.674211	2024-10-23 23:44:36.674211
57692	25	2024-11-22 16:00:00	2024-11-22 17:00:00	f	2024-10-23 23:44:36.677405	2024-10-23 23:44:36.677405
57693	25	2024-11-22 17:00:00	2024-11-22 18:00:00	f	2024-10-23 23:44:36.681054	2024-10-23 23:44:36.681054
57694	25	2024-11-22 18:00:00	2024-11-22 19:00:00	f	2024-10-23 23:44:36.6837	2024-10-23 23:44:36.6837
57695	25	2024-11-23 11:00:00	2024-11-23 12:00:00	f	2024-10-23 23:44:36.688258	2024-10-23 23:44:36.688258
57696	25	2024-11-23 12:00:00	2024-11-23 13:00:00	f	2024-10-23 23:44:36.690858	2024-10-23 23:44:36.690858
57697	25	2024-11-23 13:00:00	2024-11-23 14:00:00	f	2024-10-23 23:44:36.695078	2024-10-23 23:44:36.695078
57698	25	2024-11-23 14:00:00	2024-11-23 15:00:00	f	2024-10-23 23:44:36.698109	2024-10-23 23:44:36.698109
57699	25	2024-11-23 15:00:00	2024-11-23 16:00:00	f	2024-10-23 23:44:36.702257	2024-10-23 23:44:36.702257
57700	25	2024-11-23 16:00:00	2024-11-23 17:00:00	f	2024-10-23 23:44:36.70591	2024-10-23 23:44:36.70591
57701	25	2024-11-23 17:00:00	2024-11-23 18:00:00	f	2024-10-23 23:44:36.709825	2024-10-23 23:44:36.709825
57702	25	2024-11-23 18:00:00	2024-11-23 19:00:00	f	2024-10-23 23:44:36.713245	2024-10-23 23:44:36.713245
57703	25	2024-11-25 11:00:00	2024-11-25 12:00:00	f	2024-10-23 23:44:36.717172	2024-10-23 23:44:36.717172
57704	25	2024-11-25 12:00:00	2024-11-25 13:00:00	f	2024-10-23 23:44:36.721119	2024-10-23 23:44:36.721119
57705	25	2024-11-25 13:00:00	2024-11-25 14:00:00	f	2024-10-23 23:44:36.724435	2024-10-23 23:44:36.724435
57706	25	2024-11-25 14:00:00	2024-11-25 15:00:00	f	2024-10-23 23:44:36.728065	2024-10-23 23:44:36.728065
57707	25	2024-11-25 15:00:00	2024-11-25 16:00:00	f	2024-10-23 23:44:36.731302	2024-10-23 23:44:36.731302
57708	25	2024-11-25 16:00:00	2024-11-25 17:00:00	f	2024-10-23 23:44:36.734556	2024-10-23 23:44:36.734556
57709	25	2024-11-25 17:00:00	2024-11-25 18:00:00	f	2024-10-23 23:44:36.738774	2024-10-23 23:44:36.738774
57710	25	2024-11-25 18:00:00	2024-11-25 19:00:00	f	2024-10-23 23:44:36.741952	2024-10-23 23:44:36.741952
57711	25	2024-11-26 11:00:00	2024-11-26 12:00:00	f	2024-10-23 23:44:36.747205	2024-10-23 23:44:36.747205
57712	25	2024-11-26 12:00:00	2024-11-26 13:00:00	f	2024-10-23 23:44:36.750584	2024-10-23 23:44:36.750584
57713	25	2024-11-26 13:00:00	2024-11-26 14:00:00	f	2024-10-23 23:44:36.756143	2024-10-23 23:44:36.756143
57714	25	2024-11-26 14:00:00	2024-11-26 15:00:00	f	2024-10-23 23:44:36.759486	2024-10-23 23:44:36.759486
57715	25	2024-11-26 15:00:00	2024-11-26 16:00:00	f	2024-10-23 23:44:36.763033	2024-10-23 23:44:36.763033
57716	25	2024-11-26 16:00:00	2024-11-26 17:00:00	f	2024-10-23 23:44:36.765646	2024-10-23 23:44:36.765646
57717	25	2024-11-26 17:00:00	2024-11-26 18:00:00	f	2024-10-23 23:44:36.767755	2024-10-23 23:44:36.767755
57718	25	2024-11-26 18:00:00	2024-11-26 19:00:00	f	2024-10-23 23:44:36.771413	2024-10-23 23:44:36.771413
57719	25	2024-11-27 11:00:00	2024-11-27 12:00:00	f	2024-10-23 23:44:36.773552	2024-10-23 23:44:36.773552
57720	25	2024-11-27 12:00:00	2024-11-27 13:00:00	f	2024-10-23 23:44:36.777112	2024-10-23 23:44:36.777112
57721	25	2024-11-27 13:00:00	2024-11-27 14:00:00	f	2024-10-23 23:44:36.781054	2024-10-23 23:44:36.781054
57722	25	2024-11-27 14:00:00	2024-11-27 15:00:00	f	2024-10-23 23:44:36.785724	2024-10-23 23:44:36.785724
57723	25	2024-11-27 15:00:00	2024-11-27 16:00:00	f	2024-10-23 23:44:36.788957	2024-10-23 23:44:36.788957
57724	25	2024-11-27 16:00:00	2024-11-27 17:00:00	f	2024-10-23 23:44:36.793459	2024-10-23 23:44:36.793459
57725	25	2024-11-27 17:00:00	2024-11-27 18:00:00	f	2024-10-23 23:44:36.796313	2024-10-23 23:44:36.796313
57726	25	2024-11-27 18:00:00	2024-11-27 19:00:00	f	2024-10-23 23:44:36.800528	2024-10-23 23:44:36.800528
57727	25	2024-11-28 11:00:00	2024-11-28 12:00:00	f	2024-10-23 23:44:36.80401	2024-10-23 23:44:36.80401
57728	25	2024-11-28 12:00:00	2024-11-28 13:00:00	f	2024-10-23 23:44:36.806834	2024-10-23 23:44:36.806834
57729	25	2024-11-28 13:00:00	2024-11-28 14:00:00	f	2024-10-23 23:44:36.810125	2024-10-23 23:44:36.810125
57730	25	2024-11-28 14:00:00	2024-11-28 15:00:00	f	2024-10-23 23:44:36.812462	2024-10-23 23:44:36.812462
57731	25	2024-11-28 15:00:00	2024-11-28 16:00:00	f	2024-10-23 23:44:36.817378	2024-10-23 23:44:36.817378
57732	25	2024-11-28 16:00:00	2024-11-28 17:00:00	f	2024-10-23 23:44:36.820782	2024-10-23 23:44:36.820782
57733	25	2024-11-28 17:00:00	2024-11-28 18:00:00	f	2024-10-23 23:44:36.825165	2024-10-23 23:44:36.825165
57734	25	2024-11-28 18:00:00	2024-11-28 19:00:00	f	2024-10-23 23:44:36.828044	2024-10-23 23:44:36.828044
57735	25	2024-11-29 11:00:00	2024-11-29 12:00:00	f	2024-10-23 23:44:36.831097	2024-10-23 23:44:36.831097
57736	25	2024-11-29 12:00:00	2024-11-29 13:00:00	f	2024-10-23 23:44:36.835143	2024-10-23 23:44:36.835143
57737	25	2024-11-29 13:00:00	2024-11-29 14:00:00	f	2024-10-23 23:44:36.838989	2024-10-23 23:44:36.838989
57738	25	2024-11-29 14:00:00	2024-11-29 15:00:00	f	2024-10-23 23:44:36.841905	2024-10-23 23:44:36.841905
57739	25	2024-11-29 15:00:00	2024-11-29 16:00:00	f	2024-10-23 23:44:36.845708	2024-10-23 23:44:36.845708
57740	25	2024-11-29 16:00:00	2024-11-29 17:00:00	f	2024-10-23 23:44:36.848428	2024-10-23 23:44:36.848428
57741	25	2024-11-29 17:00:00	2024-11-29 18:00:00	f	2024-10-23 23:44:36.857879	2024-10-23 23:44:36.857879
57742	25	2024-11-29 18:00:00	2024-11-29 19:00:00	f	2024-10-23 23:44:36.860151	2024-10-23 23:44:36.860151
57743	25	2024-11-30 11:00:00	2024-11-30 12:00:00	f	2024-10-23 23:44:36.86311	2024-10-23 23:44:36.86311
57744	25	2024-11-30 12:00:00	2024-11-30 13:00:00	f	2024-10-23 23:44:36.866412	2024-10-23 23:44:36.866412
57745	25	2024-11-30 13:00:00	2024-11-30 14:00:00	f	2024-10-23 23:44:36.868694	2024-10-23 23:44:36.868694
57746	25	2024-11-30 14:00:00	2024-11-30 15:00:00	f	2024-10-23 23:44:36.871545	2024-10-23 23:44:36.871545
57747	25	2024-11-30 15:00:00	2024-11-30 16:00:00	f	2024-10-23 23:44:36.874833	2024-10-23 23:44:36.874833
57748	25	2024-11-30 16:00:00	2024-11-30 17:00:00	f	2024-10-23 23:44:36.878349	2024-10-23 23:44:36.878349
57749	25	2024-11-30 17:00:00	2024-11-30 18:00:00	f	2024-10-23 23:44:36.881174	2024-10-23 23:44:36.881174
57750	25	2024-11-30 18:00:00	2024-11-30 19:00:00	f	2024-10-23 23:44:36.88364	2024-10-23 23:44:36.88364
57751	25	2024-12-02 11:00:00	2024-12-02 12:00:00	f	2024-10-23 23:44:36.886902	2024-10-23 23:44:36.886902
57752	25	2024-12-02 12:00:00	2024-12-02 13:00:00	f	2024-10-23 23:44:36.891239	2024-10-23 23:44:36.891239
57753	25	2024-12-02 13:00:00	2024-12-02 14:00:00	f	2024-10-23 23:44:36.893682	2024-10-23 23:44:36.893682
57754	25	2024-12-02 14:00:00	2024-12-02 15:00:00	f	2024-10-23 23:44:36.896517	2024-10-23 23:44:36.896517
57755	25	2024-12-02 15:00:00	2024-12-02 16:00:00	f	2024-10-23 23:44:36.900084	2024-10-23 23:44:36.900084
57756	25	2024-12-02 16:00:00	2024-12-02 17:00:00	f	2024-10-23 23:44:36.903157	2024-10-23 23:44:36.903157
57757	25	2024-12-02 17:00:00	2024-12-02 18:00:00	f	2024-10-23 23:44:36.905848	2024-10-23 23:44:36.905848
57758	25	2024-12-02 18:00:00	2024-12-02 19:00:00	f	2024-10-23 23:44:36.909215	2024-10-23 23:44:36.909215
57759	25	2024-12-03 11:00:00	2024-12-03 12:00:00	f	2024-10-23 23:44:36.912128	2024-10-23 23:44:36.912128
57760	25	2024-12-03 12:00:00	2024-12-03 13:00:00	f	2024-10-23 23:44:36.915617	2024-10-23 23:44:36.915617
57761	25	2024-12-03 13:00:00	2024-12-03 14:00:00	f	2024-10-23 23:44:36.918477	2024-10-23 23:44:36.918477
57762	25	2024-12-03 14:00:00	2024-12-03 15:00:00	f	2024-10-23 23:44:36.923372	2024-10-23 23:44:36.923372
57763	25	2024-12-03 15:00:00	2024-12-03 16:00:00	f	2024-10-23 23:44:36.92762	2024-10-23 23:44:36.92762
57764	25	2024-12-03 16:00:00	2024-12-03 17:00:00	f	2024-10-23 23:44:36.93088	2024-10-23 23:44:36.93088
57765	25	2024-12-03 17:00:00	2024-12-03 18:00:00	f	2024-10-23 23:44:36.934407	2024-10-23 23:44:36.934407
57766	25	2024-12-03 18:00:00	2024-12-03 19:00:00	f	2024-10-23 23:44:36.938124	2024-10-23 23:44:36.938124
57767	25	2024-12-04 11:00:00	2024-12-04 12:00:00	f	2024-10-23 23:44:36.941972	2024-10-23 23:44:36.941972
57768	25	2024-12-04 12:00:00	2024-12-04 13:00:00	f	2024-10-23 23:44:36.945207	2024-10-23 23:44:36.945207
57769	25	2024-12-04 13:00:00	2024-12-04 14:00:00	f	2024-10-23 23:44:36.949049	2024-10-23 23:44:36.949049
57770	25	2024-12-04 14:00:00	2024-12-04 15:00:00	f	2024-10-23 23:44:36.951876	2024-10-23 23:44:36.951876
57771	25	2024-12-04 15:00:00	2024-12-04 16:00:00	f	2024-10-23 23:44:36.956598	2024-10-23 23:44:36.956598
57772	25	2024-12-04 16:00:00	2024-12-04 17:00:00	f	2024-10-23 23:44:36.960017	2024-10-23 23:44:36.960017
57773	25	2024-12-04 17:00:00	2024-12-04 18:00:00	f	2024-10-23 23:44:36.963589	2024-10-23 23:44:36.963589
57774	25	2024-12-04 18:00:00	2024-12-04 19:00:00	f	2024-10-23 23:44:36.96647	2024-10-23 23:44:36.96647
57775	25	2024-12-05 11:00:00	2024-12-05 12:00:00	f	2024-10-23 23:44:36.970226	2024-10-23 23:44:36.970226
57776	25	2024-12-05 12:00:00	2024-12-05 13:00:00	f	2024-10-23 23:44:36.973467	2024-10-23 23:44:36.973467
57777	25	2024-12-05 13:00:00	2024-12-05 14:00:00	f	2024-10-23 23:44:36.976963	2024-10-23 23:44:36.976963
57778	25	2024-12-05 14:00:00	2024-12-05 15:00:00	f	2024-10-23 23:44:36.979797	2024-10-23 23:44:36.979797
57779	25	2024-12-05 15:00:00	2024-12-05 16:00:00	f	2024-10-23 23:44:36.983482	2024-10-23 23:44:36.983482
57780	25	2024-12-05 16:00:00	2024-12-05 17:00:00	f	2024-10-23 23:44:36.985697	2024-10-23 23:44:36.985697
57781	25	2024-12-05 17:00:00	2024-12-05 18:00:00	f	2024-10-23 23:44:36.990532	2024-10-23 23:44:36.990532
57782	25	2024-12-05 18:00:00	2024-12-05 19:00:00	f	2024-10-23 23:44:36.993813	2024-10-23 23:44:36.993813
57783	25	2024-12-06 11:00:00	2024-12-06 12:00:00	f	2024-10-23 23:44:36.99768	2024-10-23 23:44:36.99768
57784	25	2024-12-06 12:00:00	2024-12-06 13:00:00	f	2024-10-23 23:44:37.000707	2024-10-23 23:44:37.000707
57785	25	2024-12-06 13:00:00	2024-12-06 14:00:00	f	2024-10-23 23:44:37.004594	2024-10-23 23:44:37.004594
57786	25	2024-12-06 14:00:00	2024-12-06 15:00:00	f	2024-10-23 23:44:37.007352	2024-10-23 23:44:37.007352
57787	25	2024-12-06 15:00:00	2024-12-06 16:00:00	f	2024-10-23 23:44:37.011308	2024-10-23 23:44:37.011308
57788	25	2024-12-06 16:00:00	2024-12-06 17:00:00	f	2024-10-23 23:44:37.013946	2024-10-23 23:44:37.013946
57789	25	2024-12-06 17:00:00	2024-12-06 18:00:00	f	2024-10-23 23:44:37.01772	2024-10-23 23:44:37.01772
57790	25	2024-12-06 18:00:00	2024-12-06 19:00:00	f	2024-10-23 23:44:37.021391	2024-10-23 23:44:37.021391
57791	25	2024-12-07 11:00:00	2024-12-07 12:00:00	f	2024-10-23 23:44:37.0254	2024-10-23 23:44:37.0254
57792	25	2024-12-07 12:00:00	2024-12-07 13:00:00	f	2024-10-23 23:44:37.028047	2024-10-23 23:44:37.028047
57793	25	2024-12-07 13:00:00	2024-12-07 14:00:00	f	2024-10-23 23:44:37.032046	2024-10-23 23:44:37.032046
57794	25	2024-12-07 14:00:00	2024-12-07 15:00:00	f	2024-10-23 23:44:37.034879	2024-10-23 23:44:37.034879
57795	25	2024-12-07 15:00:00	2024-12-07 16:00:00	f	2024-10-23 23:44:37.03799	2024-10-23 23:44:37.03799
57796	25	2024-12-07 16:00:00	2024-12-07 17:00:00	f	2024-10-23 23:44:37.041459	2024-10-23 23:44:37.041459
57797	25	2024-12-07 17:00:00	2024-12-07 18:00:00	f	2024-10-23 23:44:37.044643	2024-10-23 23:44:37.044643
57798	25	2024-12-07 18:00:00	2024-12-07 19:00:00	f	2024-10-23 23:44:37.048262	2024-10-23 23:44:37.048262
57799	25	2024-12-09 11:00:00	2024-12-09 12:00:00	f	2024-10-23 23:44:37.051979	2024-10-23 23:44:37.051979
57800	25	2024-12-09 12:00:00	2024-12-09 13:00:00	f	2024-10-23 23:44:37.056222	2024-10-23 23:44:37.056222
57801	25	2024-12-09 13:00:00	2024-12-09 14:00:00	f	2024-10-23 23:44:37.060646	2024-10-23 23:44:37.060646
57802	25	2024-12-09 14:00:00	2024-12-09 15:00:00	f	2024-10-23 23:44:37.064182	2024-10-23 23:44:37.064182
57803	25	2024-12-09 15:00:00	2024-12-09 16:00:00	f	2024-10-23 23:44:37.067965	2024-10-23 23:44:37.067965
57804	25	2024-12-09 16:00:00	2024-12-09 17:00:00	f	2024-10-23 23:44:37.070904	2024-10-23 23:44:37.070904
57805	25	2024-12-09 17:00:00	2024-12-09 18:00:00	f	2024-10-23 23:44:37.074388	2024-10-23 23:44:37.074388
57806	25	2024-12-09 18:00:00	2024-12-09 19:00:00	f	2024-10-23 23:44:37.07662	2024-10-23 23:44:37.07662
57807	25	2024-12-10 11:00:00	2024-12-10 12:00:00	f	2024-10-23 23:44:37.080384	2024-10-23 23:44:37.080384
57808	25	2024-12-10 12:00:00	2024-12-10 13:00:00	f	2024-10-23 23:44:37.082673	2024-10-23 23:44:37.082673
57809	25	2024-12-10 13:00:00	2024-12-10 14:00:00	f	2024-10-23 23:44:37.085994	2024-10-23 23:44:37.085994
57810	25	2024-12-10 14:00:00	2024-12-10 15:00:00	f	2024-10-23 23:44:37.089706	2024-10-23 23:44:37.089706
57811	25	2024-12-10 15:00:00	2024-12-10 16:00:00	f	2024-10-23 23:44:37.094243	2024-10-23 23:44:37.094243
57812	25	2024-12-10 16:00:00	2024-12-10 17:00:00	f	2024-10-23 23:44:37.09734	2024-10-23 23:44:37.09734
57813	25	2024-12-10 17:00:00	2024-12-10 18:00:00	f	2024-10-23 23:44:37.101572	2024-10-23 23:44:37.101572
57814	25	2024-12-10 18:00:00	2024-12-10 19:00:00	f	2024-10-23 23:44:37.104121	2024-10-23 23:44:37.104121
57815	25	2024-12-11 11:00:00	2024-12-11 12:00:00	f	2024-10-23 23:44:37.106343	2024-10-23 23:44:37.106343
57816	25	2024-12-11 12:00:00	2024-12-11 13:00:00	f	2024-10-23 23:44:37.110167	2024-10-23 23:44:37.110167
57817	25	2024-12-11 13:00:00	2024-12-11 14:00:00	f	2024-10-23 23:44:37.112892	2024-10-23 23:44:37.112892
57818	25	2024-12-11 14:00:00	2024-12-11 15:00:00	f	2024-10-23 23:44:37.116922	2024-10-23 23:44:37.116922
57819	25	2024-12-11 15:00:00	2024-12-11 16:00:00	f	2024-10-23 23:44:37.120176	2024-10-23 23:44:37.120176
57820	25	2024-12-11 16:00:00	2024-12-11 17:00:00	f	2024-10-23 23:44:37.123932	2024-10-23 23:44:37.123932
57821	25	2024-12-11 17:00:00	2024-12-11 18:00:00	f	2024-10-23 23:44:37.127706	2024-10-23 23:44:37.127706
57822	25	2024-12-11 18:00:00	2024-12-11 19:00:00	f	2024-10-23 23:44:37.130951	2024-10-23 23:44:37.130951
57823	25	2024-12-12 11:00:00	2024-12-12 12:00:00	f	2024-10-23 23:44:37.134127	2024-10-23 23:44:37.134127
57824	25	2024-12-12 12:00:00	2024-12-12 13:00:00	f	2024-10-23 23:44:37.137712	2024-10-23 23:44:37.137712
57825	25	2024-12-12 13:00:00	2024-12-12 14:00:00	f	2024-10-23 23:44:37.140942	2024-10-23 23:44:37.140942
57826	25	2024-12-12 14:00:00	2024-12-12 15:00:00	f	2024-10-23 23:44:37.144678	2024-10-23 23:44:37.144678
57827	25	2024-12-12 15:00:00	2024-12-12 16:00:00	f	2024-10-23 23:44:37.147758	2024-10-23 23:44:37.147758
57828	25	2024-12-12 16:00:00	2024-12-12 17:00:00	f	2024-10-23 23:44:37.151492	2024-10-23 23:44:37.151492
57829	25	2024-12-12 17:00:00	2024-12-12 18:00:00	f	2024-10-23 23:44:37.154686	2024-10-23 23:44:37.154686
57830	25	2024-12-12 18:00:00	2024-12-12 19:00:00	f	2024-10-23 23:44:37.15886	2024-10-23 23:44:37.15886
57831	25	2024-12-13 11:00:00	2024-12-13 12:00:00	f	2024-10-23 23:44:37.163923	2024-10-23 23:44:37.163923
57832	25	2024-12-13 12:00:00	2024-12-13 13:00:00	f	2024-10-23 23:44:37.166691	2024-10-23 23:44:37.166691
57833	25	2024-12-13 13:00:00	2024-12-13 14:00:00	f	2024-10-23 23:44:37.169952	2024-10-23 23:44:37.169952
57834	25	2024-12-13 14:00:00	2024-12-13 15:00:00	f	2024-10-23 23:44:37.172518	2024-10-23 23:44:37.172518
57835	25	2024-12-13 15:00:00	2024-12-13 16:00:00	f	2024-10-23 23:44:37.175216	2024-10-23 23:44:37.175216
57836	25	2024-12-13 16:00:00	2024-12-13 17:00:00	f	2024-10-23 23:44:37.178599	2024-10-23 23:44:37.178599
57837	25	2024-12-13 17:00:00	2024-12-13 18:00:00	f	2024-10-23 23:44:37.181064	2024-10-23 23:44:37.181064
57838	25	2024-12-13 18:00:00	2024-12-13 19:00:00	f	2024-10-23 23:44:37.183623	2024-10-23 23:44:37.183623
57839	25	2024-12-14 11:00:00	2024-12-14 12:00:00	f	2024-10-23 23:44:37.18719	2024-10-23 23:44:37.18719
57840	25	2024-12-14 12:00:00	2024-12-14 13:00:00	f	2024-10-23 23:44:37.191517	2024-10-23 23:44:37.191517
57841	25	2024-12-14 13:00:00	2024-12-14 14:00:00	f	2024-10-23 23:44:37.195088	2024-10-23 23:44:37.195088
57842	25	2024-12-14 14:00:00	2024-12-14 15:00:00	f	2024-10-23 23:44:37.199533	2024-10-23 23:44:37.199533
57843	25	2024-12-14 15:00:00	2024-12-14 16:00:00	f	2024-10-23 23:44:37.203465	2024-10-23 23:44:37.203465
57844	25	2024-12-14 16:00:00	2024-12-14 17:00:00	f	2024-10-23 23:44:37.20664	2024-10-23 23:44:37.20664
57845	25	2024-12-14 17:00:00	2024-12-14 18:00:00	f	2024-10-23 23:44:37.209372	2024-10-23 23:44:37.209372
57846	25	2024-12-14 18:00:00	2024-12-14 19:00:00	f	2024-10-23 23:44:37.212771	2024-10-23 23:44:37.212771
57847	25	2024-12-16 11:00:00	2024-12-16 12:00:00	f	2024-10-23 23:44:37.215521	2024-10-23 23:44:37.215521
57848	25	2024-12-16 12:00:00	2024-12-16 13:00:00	f	2024-10-23 23:44:37.219435	2024-10-23 23:44:37.219435
57849	25	2024-12-16 13:00:00	2024-12-16 14:00:00	f	2024-10-23 23:44:37.226902	2024-10-23 23:44:37.226902
57850	25	2024-12-16 14:00:00	2024-12-16 15:00:00	f	2024-10-23 23:44:37.22992	2024-10-23 23:44:37.22992
57851	25	2024-12-16 15:00:00	2024-12-16 16:00:00	f	2024-10-23 23:44:37.234027	2024-10-23 23:44:37.234027
57852	25	2024-12-16 16:00:00	2024-12-16 17:00:00	f	2024-10-23 23:44:37.236706	2024-10-23 23:44:37.236706
57853	25	2024-12-16 17:00:00	2024-12-16 18:00:00	f	2024-10-23 23:44:37.240244	2024-10-23 23:44:37.240244
57854	25	2024-12-16 18:00:00	2024-12-16 19:00:00	f	2024-10-23 23:44:37.242794	2024-10-23 23:44:37.242794
57855	25	2024-12-17 11:00:00	2024-12-17 12:00:00	f	2024-10-23 23:44:37.245564	2024-10-23 23:44:37.245564
57856	25	2024-12-17 12:00:00	2024-12-17 13:00:00	f	2024-10-23 23:44:37.248771	2024-10-23 23:44:37.248771
57857	25	2024-12-17 13:00:00	2024-12-17 14:00:00	f	2024-10-23 23:44:37.251654	2024-10-23 23:44:37.251654
57858	25	2024-12-17 14:00:00	2024-12-17 15:00:00	f	2024-10-23 23:44:37.254841	2024-10-23 23:44:37.254841
57859	25	2024-12-17 15:00:00	2024-12-17 16:00:00	f	2024-10-23 23:44:37.257877	2024-10-23 23:44:37.257877
57860	25	2024-12-17 16:00:00	2024-12-17 17:00:00	f	2024-10-23 23:44:37.262082	2024-10-23 23:44:37.262082
57861	25	2024-12-17 17:00:00	2024-12-17 18:00:00	f	2024-10-23 23:44:37.265409	2024-10-23 23:44:37.265409
57862	25	2024-12-17 18:00:00	2024-12-17 19:00:00	f	2024-10-23 23:44:37.269135	2024-10-23 23:44:37.269135
57863	25	2024-12-18 11:00:00	2024-12-18 12:00:00	f	2024-10-23 23:44:37.272796	2024-10-23 23:44:37.272796
57864	25	2024-12-18 12:00:00	2024-12-18 13:00:00	f	2024-10-23 23:44:37.276973	2024-10-23 23:44:37.276973
57865	25	2024-12-18 13:00:00	2024-12-18 14:00:00	f	2024-10-23 23:44:37.28144	2024-10-23 23:44:37.28144
57866	25	2024-12-18 14:00:00	2024-12-18 15:00:00	f	2024-10-23 23:44:37.284028	2024-10-23 23:44:37.284028
57867	25	2024-12-18 15:00:00	2024-12-18 16:00:00	f	2024-10-23 23:44:37.286817	2024-10-23 23:44:37.286817
57868	25	2024-12-18 16:00:00	2024-12-18 17:00:00	f	2024-10-23 23:44:37.290422	2024-10-23 23:44:37.290422
57869	25	2024-12-18 17:00:00	2024-12-18 18:00:00	f	2024-10-23 23:44:37.292733	2024-10-23 23:44:37.292733
57870	25	2024-12-18 18:00:00	2024-12-18 19:00:00	f	2024-10-23 23:44:37.297316	2024-10-23 23:44:37.297316
57871	25	2024-12-19 11:00:00	2024-12-19 12:00:00	f	2024-10-23 23:44:37.300774	2024-10-23 23:44:37.300774
57872	25	2024-12-19 12:00:00	2024-12-19 13:00:00	f	2024-10-23 23:44:37.304494	2024-10-23 23:44:37.304494
57873	25	2024-12-19 13:00:00	2024-12-19 14:00:00	f	2024-10-23 23:44:37.308327	2024-10-23 23:44:37.308327
57874	25	2024-12-19 14:00:00	2024-12-19 15:00:00	f	2024-10-23 23:44:37.31148	2024-10-23 23:44:37.31148
57875	25	2024-12-19 15:00:00	2024-12-19 16:00:00	f	2024-10-23 23:44:37.314513	2024-10-23 23:44:37.314513
57876	25	2024-12-19 16:00:00	2024-12-19 17:00:00	f	2024-10-23 23:44:37.31815	2024-10-23 23:44:37.31815
57877	25	2024-12-19 17:00:00	2024-12-19 18:00:00	f	2024-10-23 23:44:37.321	2024-10-23 23:44:37.321
57878	25	2024-12-19 18:00:00	2024-12-19 19:00:00	f	2024-10-23 23:44:37.324854	2024-10-23 23:44:37.324854
57879	25	2024-12-20 11:00:00	2024-12-20 12:00:00	f	2024-10-23 23:44:37.327372	2024-10-23 23:44:37.327372
57880	25	2024-12-20 12:00:00	2024-12-20 13:00:00	f	2024-10-23 23:44:37.331456	2024-10-23 23:44:37.331456
57881	25	2024-12-20 13:00:00	2024-12-20 14:00:00	f	2024-10-23 23:44:37.334366	2024-10-23 23:44:37.334366
57882	25	2024-12-20 14:00:00	2024-12-20 15:00:00	f	2024-10-23 23:44:37.338709	2024-10-23 23:44:37.338709
57883	25	2024-12-20 15:00:00	2024-12-20 16:00:00	f	2024-10-23 23:44:37.341973	2024-10-23 23:44:37.341973
57884	25	2024-12-20 16:00:00	2024-12-20 17:00:00	f	2024-10-23 23:44:37.345637	2024-10-23 23:44:37.345637
57885	25	2024-12-20 17:00:00	2024-12-20 18:00:00	f	2024-10-23 23:44:37.348651	2024-10-23 23:44:37.348651
57886	25	2024-12-20 18:00:00	2024-12-20 19:00:00	f	2024-10-23 23:44:37.352766	2024-10-23 23:44:37.352766
57887	25	2024-12-21 11:00:00	2024-12-21 12:00:00	f	2024-10-23 23:44:37.355196	2024-10-23 23:44:37.355196
57888	25	2024-12-21 12:00:00	2024-12-21 13:00:00	f	2024-10-23 23:44:37.357464	2024-10-23 23:44:37.357464
57889	25	2024-12-21 13:00:00	2024-12-21 14:00:00	f	2024-10-23 23:44:37.361034	2024-10-23 23:44:37.361034
57890	25	2024-12-21 14:00:00	2024-12-21 15:00:00	f	2024-10-23 23:44:37.363399	2024-10-23 23:44:37.363399
57891	25	2024-12-21 15:00:00	2024-12-21 16:00:00	f	2024-10-23 23:44:37.366856	2024-10-23 23:44:37.366856
57892	25	2024-12-21 16:00:00	2024-12-21 17:00:00	f	2024-10-23 23:44:37.370768	2024-10-23 23:44:37.370768
57893	25	2024-12-21 17:00:00	2024-12-21 18:00:00	f	2024-10-23 23:44:37.37513	2024-10-23 23:44:37.37513
57894	25	2024-12-21 18:00:00	2024-12-21 19:00:00	f	2024-10-23 23:44:37.377884	2024-10-23 23:44:37.377884
57895	25	2024-12-23 11:00:00	2024-12-23 12:00:00	f	2024-10-23 23:44:37.381595	2024-10-23 23:44:37.381595
57896	25	2024-12-23 12:00:00	2024-12-23 13:00:00	f	2024-10-23 23:44:37.384946	2024-10-23 23:44:37.384946
57897	25	2024-12-23 13:00:00	2024-12-23 14:00:00	f	2024-10-23 23:44:37.388738	2024-10-23 23:44:37.388738
57898	25	2024-12-23 14:00:00	2024-12-23 15:00:00	f	2024-10-23 23:44:37.39154	2024-10-23 23:44:37.39154
57899	25	2024-12-23 15:00:00	2024-12-23 16:00:00	f	2024-10-23 23:44:37.394989	2024-10-23 23:44:37.394989
57900	25	2024-12-23 16:00:00	2024-12-23 17:00:00	f	2024-10-23 23:44:37.397903	2024-10-23 23:44:37.397903
57901	25	2024-12-23 17:00:00	2024-12-23 18:00:00	f	2024-10-23 23:44:37.402715	2024-10-23 23:44:37.402715
57902	25	2024-12-23 18:00:00	2024-12-23 19:00:00	f	2024-10-23 23:44:37.406414	2024-10-23 23:44:37.406414
57903	25	2024-12-24 11:00:00	2024-12-24 12:00:00	f	2024-10-23 23:44:37.410347	2024-10-23 23:44:37.410347
57904	25	2024-12-24 12:00:00	2024-12-24 13:00:00	f	2024-10-23 23:44:37.414007	2024-10-23 23:44:37.414007
57905	25	2024-12-24 13:00:00	2024-12-24 14:00:00	f	2024-10-23 23:44:37.417039	2024-10-23 23:44:37.417039
57906	25	2024-12-24 14:00:00	2024-12-24 15:00:00	f	2024-10-23 23:44:37.420549	2024-10-23 23:44:37.420549
57907	25	2024-12-24 15:00:00	2024-12-24 16:00:00	f	2024-10-23 23:44:37.423609	2024-10-23 23:44:37.423609
57908	25	2024-12-24 16:00:00	2024-12-24 17:00:00	f	2024-10-23 23:44:37.428369	2024-10-23 23:44:37.428369
57909	25	2024-12-24 17:00:00	2024-12-24 18:00:00	f	2024-10-23 23:44:37.4323	2024-10-23 23:44:37.4323
57910	25	2024-12-24 18:00:00	2024-12-24 19:00:00	f	2024-10-23 23:44:37.437767	2024-10-23 23:44:37.437767
57911	25	2024-12-25 11:00:00	2024-12-25 12:00:00	f	2024-10-23 23:44:37.440395	2024-10-23 23:44:37.440395
57912	25	2024-12-25 12:00:00	2024-12-25 13:00:00	f	2024-10-23 23:44:37.444687	2024-10-23 23:44:37.444687
57913	25	2024-12-25 13:00:00	2024-12-25 14:00:00	f	2024-10-23 23:44:37.448763	2024-10-23 23:44:37.448763
57914	25	2024-12-25 14:00:00	2024-12-25 15:00:00	f	2024-10-23 23:44:37.451296	2024-10-23 23:44:37.451296
57915	25	2024-12-25 15:00:00	2024-12-25 16:00:00	f	2024-10-23 23:44:37.455178	2024-10-23 23:44:37.455178
57916	25	2024-12-25 16:00:00	2024-12-25 17:00:00	f	2024-10-23 23:44:37.457726	2024-10-23 23:44:37.457726
57917	25	2024-12-25 17:00:00	2024-12-25 18:00:00	f	2024-10-23 23:44:37.461112	2024-10-23 23:44:37.461112
57918	25	2024-12-25 18:00:00	2024-12-25 19:00:00	f	2024-10-23 23:44:37.465694	2024-10-23 23:44:37.465694
57919	25	2024-12-26 11:00:00	2024-12-26 12:00:00	f	2024-10-23 23:44:37.470956	2024-10-23 23:44:37.470956
57920	25	2024-12-26 12:00:00	2024-12-26 13:00:00	f	2024-10-23 23:44:37.474887	2024-10-23 23:44:37.474887
57921	25	2024-12-26 13:00:00	2024-12-26 14:00:00	f	2024-10-23 23:44:37.478478	2024-10-23 23:44:37.478478
57922	25	2024-12-26 14:00:00	2024-12-26 15:00:00	f	2024-10-23 23:44:37.481641	2024-10-23 23:44:37.481641
57923	25	2024-12-26 15:00:00	2024-12-26 16:00:00	f	2024-10-23 23:44:37.484968	2024-10-23 23:44:37.484968
57924	25	2024-12-26 16:00:00	2024-12-26 17:00:00	f	2024-10-23 23:44:37.488392	2024-10-23 23:44:37.488392
57925	25	2024-12-26 17:00:00	2024-12-26 18:00:00	f	2024-10-23 23:44:37.492119	2024-10-23 23:44:37.492119
57926	25	2024-12-26 18:00:00	2024-12-26 19:00:00	f	2024-10-23 23:44:37.494515	2024-10-23 23:44:37.494515
57927	25	2024-12-27 11:00:00	2024-12-27 12:00:00	f	2024-10-23 23:44:37.496897	2024-10-23 23:44:37.496897
57928	25	2024-12-27 12:00:00	2024-12-27 13:00:00	f	2024-10-23 23:44:37.500864	2024-10-23 23:44:37.500864
57929	25	2024-12-27 13:00:00	2024-12-27 14:00:00	f	2024-10-23 23:44:37.503926	2024-10-23 23:44:37.503926
57930	25	2024-12-27 14:00:00	2024-12-27 15:00:00	f	2024-10-23 23:44:37.506989	2024-10-23 23:44:37.506989
57931	25	2024-12-27 15:00:00	2024-12-27 16:00:00	f	2024-10-23 23:44:37.510872	2024-10-23 23:44:37.510872
57932	25	2024-12-27 16:00:00	2024-12-27 17:00:00	f	2024-10-23 23:44:37.514973	2024-10-23 23:44:37.514973
57933	25	2024-12-27 17:00:00	2024-12-27 18:00:00	f	2024-10-23 23:44:37.517297	2024-10-23 23:44:37.517297
57934	25	2024-12-27 18:00:00	2024-12-27 19:00:00	f	2024-10-23 23:44:37.520611	2024-10-23 23:44:37.520611
57935	25	2024-12-28 11:00:00	2024-12-28 12:00:00	f	2024-10-23 23:44:37.524355	2024-10-23 23:44:37.524355
57936	25	2024-12-28 12:00:00	2024-12-28 13:00:00	f	2024-10-23 23:44:37.526719	2024-10-23 23:44:37.526719
57937	25	2024-12-28 13:00:00	2024-12-28 14:00:00	f	2024-10-23 23:44:37.529232	2024-10-23 23:44:37.529232
57938	25	2024-12-28 14:00:00	2024-12-28 15:00:00	f	2024-10-23 23:44:37.531709	2024-10-23 23:44:37.531709
57939	25	2024-12-28 15:00:00	2024-12-28 16:00:00	f	2024-10-23 23:44:37.534882	2024-10-23 23:44:37.534882
57940	25	2024-12-28 16:00:00	2024-12-28 17:00:00	f	2024-10-23 23:44:37.54002	2024-10-23 23:44:37.54002
57941	25	2024-12-28 17:00:00	2024-12-28 18:00:00	f	2024-10-23 23:44:37.54314	2024-10-23 23:44:37.54314
57942	25	2024-12-28 18:00:00	2024-12-28 19:00:00	f	2024-10-23 23:44:37.545896	2024-10-23 23:44:37.545896
57943	25	2024-12-30 11:00:00	2024-12-30 12:00:00	f	2024-10-23 23:44:37.549625	2024-10-23 23:44:37.549625
57944	25	2024-12-30 12:00:00	2024-12-30 13:00:00	f	2024-10-23 23:44:37.553573	2024-10-23 23:44:37.553573
57945	25	2024-12-30 13:00:00	2024-12-30 14:00:00	f	2024-10-23 23:44:37.556412	2024-10-23 23:44:37.556412
57946	25	2024-12-30 14:00:00	2024-12-30 15:00:00	f	2024-10-23 23:44:37.560043	2024-10-23 23:44:37.560043
57947	25	2024-12-30 15:00:00	2024-12-30 16:00:00	f	2024-10-23 23:44:37.56268	2024-10-23 23:44:37.56268
57948	25	2024-12-30 16:00:00	2024-12-30 17:00:00	f	2024-10-23 23:44:37.566819	2024-10-23 23:44:37.566819
57949	25	2024-12-30 17:00:00	2024-12-30 18:00:00	f	2024-10-23 23:44:37.569463	2024-10-23 23:44:37.569463
57950	25	2024-12-30 18:00:00	2024-12-30 19:00:00	f	2024-10-23 23:44:37.572512	2024-10-23 23:44:37.572512
57951	25	2024-12-31 11:00:00	2024-12-31 12:00:00	f	2024-10-23 23:44:37.576837	2024-10-23 23:44:37.576837
57952	25	2024-12-31 12:00:00	2024-12-31 13:00:00	f	2024-10-23 23:44:37.580657	2024-10-23 23:44:37.580657
57953	25	2024-12-31 13:00:00	2024-12-31 14:00:00	f	2024-10-23 23:44:37.584164	2024-10-23 23:44:37.584164
57954	25	2024-12-31 14:00:00	2024-12-31 15:00:00	f	2024-10-23 23:44:37.586648	2024-10-23 23:44:37.586648
57955	25	2024-12-31 15:00:00	2024-12-31 16:00:00	f	2024-10-23 23:44:37.590611	2024-10-23 23:44:37.590611
57956	25	2024-12-31 16:00:00	2024-12-31 17:00:00	f	2024-10-23 23:44:37.594857	2024-10-23 23:44:37.594857
57957	25	2024-12-31 17:00:00	2024-12-31 18:00:00	f	2024-10-23 23:44:37.601553	2024-10-23 23:44:37.601553
57958	25	2024-12-31 18:00:00	2024-12-31 19:00:00	f	2024-10-23 23:44:37.603998	2024-10-23 23:44:37.603998
57959	25	2025-01-01 11:00:00	2025-01-01 12:00:00	f	2024-10-23 23:44:37.608384	2024-10-23 23:44:37.608384
57960	25	2025-01-01 12:00:00	2025-01-01 13:00:00	f	2024-10-23 23:44:37.611712	2024-10-23 23:44:37.611712
57961	25	2025-01-01 13:00:00	2025-01-01 14:00:00	f	2024-10-23 23:44:37.615095	2024-10-23 23:44:37.615095
57962	25	2025-01-01 14:00:00	2025-01-01 15:00:00	f	2024-10-23 23:44:37.619004	2024-10-23 23:44:37.619004
57963	25	2025-01-01 15:00:00	2025-01-01 16:00:00	f	2024-10-23 23:44:37.62201	2024-10-23 23:44:37.62201
57964	25	2025-01-01 16:00:00	2025-01-01 17:00:00	f	2024-10-23 23:44:37.624958	2024-10-23 23:44:37.624958
57965	25	2025-01-01 17:00:00	2025-01-01 18:00:00	f	2024-10-23 23:44:37.628662	2024-10-23 23:44:37.628662
57966	25	2025-01-01 18:00:00	2025-01-01 19:00:00	f	2024-10-23 23:44:37.631156	2024-10-23 23:44:37.631156
57967	25	2025-01-02 11:00:00	2025-01-02 12:00:00	f	2024-10-23 23:44:37.634948	2024-10-23 23:44:37.634948
57968	25	2025-01-02 12:00:00	2025-01-02 13:00:00	f	2024-10-23 23:44:37.638413	2024-10-23 23:44:37.638413
57969	25	2025-01-02 13:00:00	2025-01-02 14:00:00	f	2024-10-23 23:44:37.642515	2024-10-23 23:44:37.642515
57970	25	2025-01-02 14:00:00	2025-01-02 15:00:00	f	2024-10-23 23:44:37.64482	2024-10-23 23:44:37.64482
57971	25	2025-01-02 15:00:00	2025-01-02 16:00:00	f	2024-10-23 23:44:37.648466	2024-10-23 23:44:37.648466
57972	25	2025-01-02 16:00:00	2025-01-02 17:00:00	f	2024-10-23 23:44:37.652085	2024-10-23 23:44:37.652085
57973	25	2025-01-02 17:00:00	2025-01-02 18:00:00	f	2024-10-23 23:44:37.656572	2024-10-23 23:44:37.656572
57974	25	2025-01-02 18:00:00	2025-01-02 19:00:00	f	2024-10-23 23:44:37.659532	2024-10-23 23:44:37.659532
57975	25	2025-01-03 11:00:00	2025-01-03 12:00:00	f	2024-10-23 23:44:37.663981	2024-10-23 23:44:37.663981
57976	25	2025-01-03 12:00:00	2025-01-03 13:00:00	f	2024-10-23 23:44:37.667142	2024-10-23 23:44:37.667142
57977	25	2025-01-03 13:00:00	2025-01-03 14:00:00	f	2024-10-23 23:44:37.671767	2024-10-23 23:44:37.671767
57978	25	2025-01-03 14:00:00	2025-01-03 15:00:00	f	2024-10-23 23:44:37.675236	2024-10-23 23:44:37.675236
57979	25	2025-01-03 15:00:00	2025-01-03 16:00:00	f	2024-10-23 23:44:37.679248	2024-10-23 23:44:37.679248
57980	25	2025-01-03 16:00:00	2025-01-03 17:00:00	f	2024-10-23 23:44:37.682548	2024-10-23 23:44:37.682548
57981	25	2025-01-03 17:00:00	2025-01-03 18:00:00	f	2024-10-23 23:44:37.685921	2024-10-23 23:44:37.685921
57982	25	2025-01-03 18:00:00	2025-01-03 19:00:00	f	2024-10-23 23:44:37.688533	2024-10-23 23:44:37.688533
57983	25	2025-01-04 11:00:00	2025-01-04 12:00:00	f	2024-10-23 23:44:37.691159	2024-10-23 23:44:37.691159
57984	25	2025-01-04 12:00:00	2025-01-04 13:00:00	f	2024-10-23 23:44:37.695136	2024-10-23 23:44:37.695136
57985	25	2025-01-04 13:00:00	2025-01-04 14:00:00	f	2024-10-23 23:44:37.697514	2024-10-23 23:44:37.697514
57986	25	2025-01-04 14:00:00	2025-01-04 15:00:00	f	2024-10-23 23:44:37.7001	2024-10-23 23:44:37.7001
57987	25	2025-01-04 15:00:00	2025-01-04 16:00:00	f	2024-10-23 23:44:37.704826	2024-10-23 23:44:37.704826
57988	25	2025-01-04 16:00:00	2025-01-04 17:00:00	f	2024-10-23 23:44:37.709341	2024-10-23 23:44:37.709341
57989	25	2025-01-04 17:00:00	2025-01-04 18:00:00	f	2024-10-23 23:44:37.712013	2024-10-23 23:44:37.712013
57990	25	2025-01-04 18:00:00	2025-01-04 19:00:00	f	2024-10-23 23:44:37.715885	2024-10-23 23:44:37.715885
57991	25	2025-01-06 11:00:00	2025-01-06 12:00:00	f	2024-10-23 23:44:37.718239	2024-10-23 23:44:37.718239
57992	25	2025-01-06 12:00:00	2025-01-06 13:00:00	f	2024-10-23 23:44:37.721951	2024-10-23 23:44:37.721951
57993	25	2025-01-06 13:00:00	2025-01-06 14:00:00	f	2024-10-23 23:44:37.725152	2024-10-23 23:44:37.725152
57994	25	2025-01-06 14:00:00	2025-01-06 15:00:00	f	2024-10-23 23:44:37.728902	2024-10-23 23:44:37.728902
57995	25	2025-01-06 15:00:00	2025-01-06 16:00:00	f	2024-10-23 23:44:37.731798	2024-10-23 23:44:37.731798
57996	25	2025-01-06 16:00:00	2025-01-06 17:00:00	f	2024-10-23 23:44:37.735492	2024-10-23 23:44:37.735492
57997	25	2025-01-06 17:00:00	2025-01-06 18:00:00	f	2024-10-23 23:44:37.738349	2024-10-23 23:44:37.738349
57998	25	2025-01-06 18:00:00	2025-01-06 19:00:00	f	2024-10-23 23:44:37.743941	2024-10-23 23:44:37.743941
57999	25	2025-01-07 11:00:00	2025-01-07 12:00:00	f	2024-10-23 23:44:37.748435	2024-10-23 23:44:37.748435
58000	25	2025-01-07 12:00:00	2025-01-07 13:00:00	f	2024-10-23 23:44:37.75133	2024-10-23 23:44:37.75133
58001	25	2025-01-07 13:00:00	2025-01-07 14:00:00	f	2024-10-23 23:44:37.754854	2024-10-23 23:44:37.754854
58002	25	2025-01-07 14:00:00	2025-01-07 15:00:00	f	2024-10-23 23:44:37.757533	2024-10-23 23:44:37.757533
58003	25	2025-01-07 15:00:00	2025-01-07 16:00:00	f	2024-10-23 23:44:37.76006	2024-10-23 23:44:37.76006
58004	25	2025-01-07 16:00:00	2025-01-07 17:00:00	f	2024-10-23 23:44:37.763449	2024-10-23 23:44:37.763449
58005	25	2025-01-07 17:00:00	2025-01-07 18:00:00	f	2024-10-23 23:44:37.765964	2024-10-23 23:44:37.765964
58006	25	2025-01-07 18:00:00	2025-01-07 19:00:00	f	2024-10-23 23:44:37.768431	2024-10-23 23:44:37.768431
58007	25	2025-01-08 11:00:00	2025-01-08 12:00:00	f	2024-10-23 23:44:37.772426	2024-10-23 23:44:37.772426
58008	25	2025-01-08 12:00:00	2025-01-08 13:00:00	f	2024-10-23 23:44:37.777122	2024-10-23 23:44:37.777122
58009	25	2025-01-08 13:00:00	2025-01-08 14:00:00	f	2024-10-23 23:44:37.78061	2024-10-23 23:44:37.78061
58010	25	2025-01-08 14:00:00	2025-01-08 15:00:00	f	2024-10-23 23:44:37.784285	2024-10-23 23:44:37.784285
58011	25	2025-01-08 15:00:00	2025-01-08 16:00:00	f	2024-10-23 23:44:37.788755	2024-10-23 23:44:37.788755
58012	25	2025-01-08 16:00:00	2025-01-08 17:00:00	f	2024-10-23 23:44:37.792328	2024-10-23 23:44:37.792328
58013	25	2025-01-08 17:00:00	2025-01-08 18:00:00	f	2024-10-23 23:44:37.796038	2024-10-23 23:44:37.796038
58014	25	2025-01-08 18:00:00	2025-01-08 19:00:00	f	2024-10-23 23:44:37.798534	2024-10-23 23:44:37.798534
58015	25	2025-01-09 11:00:00	2025-01-09 12:00:00	f	2024-10-23 23:44:37.802641	2024-10-23 23:44:37.802641
58016	25	2025-01-09 12:00:00	2025-01-09 13:00:00	f	2024-10-23 23:44:37.805146	2024-10-23 23:44:37.805146
58017	25	2025-01-09 13:00:00	2025-01-09 14:00:00	f	2024-10-23 23:44:37.808818	2024-10-23 23:44:37.808818
58018	25	2025-01-09 14:00:00	2025-01-09 15:00:00	f	2024-10-23 23:44:37.813111	2024-10-23 23:44:37.813111
58019	25	2025-01-09 15:00:00	2025-01-09 16:00:00	f	2024-10-23 23:44:37.816372	2024-10-23 23:44:37.816372
58020	25	2025-01-09 16:00:00	2025-01-09 17:00:00	f	2024-10-23 23:44:37.820717	2024-10-23 23:44:37.820717
58021	25	2025-01-09 17:00:00	2025-01-09 18:00:00	f	2024-10-23 23:44:37.823752	2024-10-23 23:44:37.823752
58022	25	2025-01-09 18:00:00	2025-01-09 19:00:00	f	2024-10-23 23:44:37.827524	2024-10-23 23:44:37.827524
58023	25	2025-01-10 11:00:00	2025-01-10 12:00:00	f	2024-10-23 23:44:37.831268	2024-10-23 23:44:37.831268
58024	25	2025-01-10 12:00:00	2025-01-10 13:00:00	f	2024-10-23 23:44:37.833955	2024-10-23 23:44:37.833955
58025	25	2025-01-10 13:00:00	2025-01-10 14:00:00	f	2024-10-23 23:44:37.837604	2024-10-23 23:44:37.837604
58026	25	2025-01-10 14:00:00	2025-01-10 15:00:00	f	2024-10-23 23:44:37.840051	2024-10-23 23:44:37.840051
58027	25	2025-01-10 15:00:00	2025-01-10 16:00:00	f	2024-10-23 23:44:37.84475	2024-10-23 23:44:37.84475
58028	25	2025-01-10 16:00:00	2025-01-10 17:00:00	f	2024-10-23 23:44:37.848551	2024-10-23 23:44:37.848551
58029	25	2025-01-10 17:00:00	2025-01-10 18:00:00	f	2024-10-23 23:44:37.853023	2024-10-23 23:44:37.853023
58030	25	2025-01-10 18:00:00	2025-01-10 19:00:00	f	2024-10-23 23:44:37.855996	2024-10-23 23:44:37.855996
58031	25	2025-01-11 11:00:00	2025-01-11 12:00:00	f	2024-10-23 23:44:37.859726	2024-10-23 23:44:37.859726
58032	25	2025-01-11 12:00:00	2025-01-11 13:00:00	f	2024-10-23 23:44:37.862211	2024-10-23 23:44:37.862211
58033	25	2025-01-11 13:00:00	2025-01-11 14:00:00	f	2024-10-23 23:44:37.864707	2024-10-23 23:44:37.864707
58034	25	2025-01-11 14:00:00	2025-01-11 15:00:00	f	2024-10-23 23:44:37.867955	2024-10-23 23:44:37.867955
58035	25	2025-01-11 15:00:00	2025-01-11 16:00:00	f	2024-10-23 23:44:37.870113	2024-10-23 23:44:37.870113
58036	25	2025-01-11 16:00:00	2025-01-11 17:00:00	f	2024-10-23 23:44:37.87235	2024-10-23 23:44:37.87235
58037	25	2025-01-11 17:00:00	2025-01-11 18:00:00	f	2024-10-23 23:44:37.875628	2024-10-23 23:44:37.875628
58038	25	2025-01-11 18:00:00	2025-01-11 19:00:00	f	2024-10-23 23:44:37.880255	2024-10-23 23:44:37.880255
58039	25	2025-01-13 11:00:00	2025-01-13 12:00:00	f	2024-10-23 23:44:37.883006	2024-10-23 23:44:37.883006
58040	25	2025-01-13 12:00:00	2025-01-13 13:00:00	f	2024-10-23 23:44:37.885732	2024-10-23 23:44:37.885732
58041	25	2025-01-13 13:00:00	2025-01-13 14:00:00	f	2024-10-23 23:44:37.889884	2024-10-23 23:44:37.889884
58042	25	2025-01-13 14:00:00	2025-01-13 15:00:00	f	2024-10-23 23:44:37.893841	2024-10-23 23:44:37.893841
58043	25	2025-01-13 15:00:00	2025-01-13 16:00:00	f	2024-10-23 23:44:37.896772	2024-10-23 23:44:37.896772
58044	25	2025-01-13 16:00:00	2025-01-13 17:00:00	f	2024-10-23 23:44:37.900825	2024-10-23 23:44:37.900825
58045	25	2025-01-13 17:00:00	2025-01-13 18:00:00	f	2024-10-23 23:44:37.903782	2024-10-23 23:44:37.903782
58046	25	2025-01-13 18:00:00	2025-01-13 19:00:00	f	2024-10-23 23:44:37.906616	2024-10-23 23:44:37.906616
58047	25	2025-01-14 11:00:00	2025-01-14 12:00:00	f	2024-10-23 23:44:37.910352	2024-10-23 23:44:37.910352
58048	25	2025-01-14 12:00:00	2025-01-14 13:00:00	f	2024-10-23 23:44:37.91306	2024-10-23 23:44:37.91306
58049	25	2025-01-14 13:00:00	2025-01-14 14:00:00	f	2024-10-23 23:44:37.917543	2024-10-23 23:44:37.917543
58050	25	2025-01-14 14:00:00	2025-01-14 15:00:00	f	2024-10-23 23:44:37.920821	2024-10-23 23:44:37.920821
58051	25	2025-01-14 15:00:00	2025-01-14 16:00:00	f	2024-10-23 23:44:37.924754	2024-10-23 23:44:37.924754
58052	25	2025-01-14 16:00:00	2025-01-14 17:00:00	f	2024-10-23 23:44:37.927871	2024-10-23 23:44:37.927871
58053	25	2025-01-14 17:00:00	2025-01-14 18:00:00	f	2024-10-23 23:44:37.931102	2024-10-23 23:44:37.931102
58054	25	2025-01-14 18:00:00	2025-01-14 19:00:00	f	2024-10-23 23:44:37.934945	2024-10-23 23:44:37.934945
58055	25	2025-01-15 11:00:00	2025-01-15 12:00:00	f	2024-10-23 23:44:37.937397	2024-10-23 23:44:37.937397
58056	25	2025-01-15 12:00:00	2025-01-15 13:00:00	f	2024-10-23 23:44:37.940995	2024-10-23 23:44:37.940995
58057	25	2025-01-15 13:00:00	2025-01-15 14:00:00	f	2024-10-23 23:44:37.943705	2024-10-23 23:44:37.943705
58058	25	2025-01-15 14:00:00	2025-01-15 15:00:00	f	2024-10-23 23:44:37.946946	2024-10-23 23:44:37.946946
58059	25	2025-01-15 15:00:00	2025-01-15 16:00:00	f	2024-10-23 23:44:37.950992	2024-10-23 23:44:37.950992
58060	25	2025-01-15 16:00:00	2025-01-15 17:00:00	f	2024-10-23 23:44:37.955547	2024-10-23 23:44:37.955547
58061	25	2025-01-15 17:00:00	2025-01-15 18:00:00	f	2024-10-23 23:44:37.958287	2024-10-23 23:44:37.958287
58062	25	2025-01-15 18:00:00	2025-01-15 19:00:00	f	2024-10-23 23:44:37.962186	2024-10-23 23:44:37.962186
58063	25	2025-01-16 11:00:00	2025-01-16 12:00:00	f	2024-10-23 23:44:37.964935	2024-10-23 23:44:37.964935
58064	25	2025-01-16 12:00:00	2025-01-16 13:00:00	f	2024-10-23 23:44:37.971354	2024-10-23 23:44:37.971354
58065	25	2025-01-16 13:00:00	2025-01-16 14:00:00	f	2024-10-23 23:44:37.973764	2024-10-23 23:44:37.973764
58066	25	2025-01-16 14:00:00	2025-01-16 15:00:00	f	2024-10-23 23:44:37.97639	2024-10-23 23:44:37.97639
58067	25	2025-01-16 15:00:00	2025-01-16 16:00:00	f	2024-10-23 23:44:37.978278	2024-10-23 23:44:37.978278
58068	25	2025-01-16 16:00:00	2025-01-16 17:00:00	f	2024-10-23 23:44:37.980686	2024-10-23 23:44:37.980686
58069	25	2025-01-16 17:00:00	2025-01-16 18:00:00	f	2024-10-23 23:44:37.984323	2024-10-23 23:44:37.984323
58070	25	2025-01-16 18:00:00	2025-01-16 19:00:00	f	2024-10-23 23:44:37.986989	2024-10-23 23:44:37.986989
58071	25	2025-01-17 11:00:00	2025-01-17 12:00:00	f	2024-10-23 23:44:37.989208	2024-10-23 23:44:37.989208
58072	25	2025-01-17 12:00:00	2025-01-17 13:00:00	f	2024-10-23 23:44:37.993272	2024-10-23 23:44:37.993272
58073	25	2025-01-17 13:00:00	2025-01-17 14:00:00	f	2024-10-23 23:44:37.995682	2024-10-23 23:44:37.995682
58074	25	2025-01-17 14:00:00	2025-01-17 15:00:00	f	2024-10-23 23:44:37.999542	2024-10-23 23:44:37.999542
58075	25	2025-01-17 15:00:00	2025-01-17 16:00:00	f	2024-10-23 23:44:38.002209	2024-10-23 23:44:38.002209
58076	25	2025-01-17 16:00:00	2025-01-17 17:00:00	f	2024-10-23 23:44:38.00582	2024-10-23 23:44:38.00582
58077	25	2025-01-17 17:00:00	2025-01-17 18:00:00	f	2024-10-23 23:44:38.008889	2024-10-23 23:44:38.008889
58078	25	2025-01-17 18:00:00	2025-01-17 19:00:00	f	2024-10-23 23:44:38.012831	2024-10-23 23:44:38.012831
58079	25	2025-01-18 11:00:00	2025-01-18 12:00:00	f	2024-10-23 23:44:38.016051	2024-10-23 23:44:38.016051
58080	25	2025-01-18 12:00:00	2025-01-18 13:00:00	f	2024-10-23 23:44:38.020545	2024-10-23 23:44:38.020545
58081	25	2025-01-18 13:00:00	2025-01-18 14:00:00	f	2024-10-23 23:44:38.025213	2024-10-23 23:44:38.025213
58082	25	2025-01-18 14:00:00	2025-01-18 15:00:00	f	2024-10-23 23:44:38.028459	2024-10-23 23:44:38.028459
58083	25	2025-01-18 15:00:00	2025-01-18 16:00:00	f	2024-10-23 23:44:38.032815	2024-10-23 23:44:38.032815
58084	25	2025-01-18 16:00:00	2025-01-18 17:00:00	f	2024-10-23 23:44:38.035723	2024-10-23 23:44:38.035723
58085	25	2025-01-18 17:00:00	2025-01-18 18:00:00	f	2024-10-23 23:44:38.03936	2024-10-23 23:44:38.03936
58086	25	2025-01-18 18:00:00	2025-01-18 19:00:00	f	2024-10-23 23:44:38.042008	2024-10-23 23:44:38.042008
58087	25	2025-01-20 11:00:00	2025-01-20 12:00:00	f	2024-10-23 23:44:38.045677	2024-10-23 23:44:38.045677
58088	25	2025-01-20 12:00:00	2025-01-20 13:00:00	f	2024-10-23 23:44:38.047942	2024-10-23 23:44:38.047942
58089	25	2025-01-20 13:00:00	2025-01-20 14:00:00	f	2024-10-23 23:44:38.051569	2024-10-23 23:44:38.051569
58090	25	2025-01-20 14:00:00	2025-01-20 15:00:00	f	2024-10-23 23:44:38.056564	2024-10-23 23:44:38.056564
58091	25	2025-01-20 15:00:00	2025-01-20 16:00:00	f	2024-10-23 23:44:38.061047	2024-10-23 23:44:38.061047
58092	25	2025-01-20 16:00:00	2025-01-20 17:00:00	f	2024-10-23 23:44:38.06434	2024-10-23 23:44:38.06434
58093	25	2025-01-20 17:00:00	2025-01-20 18:00:00	f	2024-10-23 23:44:38.068118	2024-10-23 23:44:38.068118
58094	25	2025-01-20 18:00:00	2025-01-20 19:00:00	f	2024-10-23 23:44:38.071416	2024-10-23 23:44:38.071416
58095	25	2025-01-21 11:00:00	2025-01-21 12:00:00	f	2024-10-23 23:44:38.075495	2024-10-23 23:44:38.075495
58096	25	2025-01-21 12:00:00	2025-01-21 13:00:00	f	2024-10-23 23:44:38.078594	2024-10-23 23:44:38.078594
58097	25	2025-01-21 13:00:00	2025-01-21 14:00:00	f	2024-10-23 23:44:38.081867	2024-10-23 23:44:38.081867
58098	25	2025-01-21 14:00:00	2025-01-21 15:00:00	f	2024-10-23 23:44:38.084026	2024-10-23 23:44:38.084026
58099	25	2025-01-21 15:00:00	2025-01-21 16:00:00	f	2024-10-23 23:44:38.08792	2024-10-23 23:44:38.08792
58100	25	2025-01-21 16:00:00	2025-01-21 17:00:00	f	2024-10-23 23:44:38.091033	2024-10-23 23:44:38.091033
58101	25	2025-01-21 17:00:00	2025-01-21 18:00:00	f	2024-10-23 23:44:38.094792	2024-10-23 23:44:38.094792
58102	25	2025-01-21 18:00:00	2025-01-21 19:00:00	f	2024-10-23 23:44:38.097578	2024-10-23 23:44:38.097578
58103	25	2025-01-22 11:00:00	2025-01-22 12:00:00	f	2024-10-23 23:44:38.103098	2024-10-23 23:44:38.103098
58104	25	2025-01-22 12:00:00	2025-01-22 13:00:00	f	2024-10-23 23:44:38.107767	2024-10-23 23:44:38.107767
58105	25	2025-01-22 13:00:00	2025-01-22 14:00:00	f	2024-10-23 23:44:38.111326	2024-10-23 23:44:38.111326
58106	25	2025-01-22 14:00:00	2025-01-22 15:00:00	f	2024-10-23 23:44:38.117466	2024-10-23 23:44:38.117466
58107	25	2025-01-22 15:00:00	2025-01-22 16:00:00	f	2024-10-23 23:44:38.122382	2024-10-23 23:44:38.122382
58108	25	2025-01-22 16:00:00	2025-01-22 17:00:00	f	2024-10-23 23:44:38.126355	2024-10-23 23:44:38.126355
58109	25	2025-01-22 17:00:00	2025-01-22 18:00:00	f	2024-10-23 23:44:38.132964	2024-10-23 23:44:38.132964
58110	25	2025-01-22 18:00:00	2025-01-22 19:00:00	f	2024-10-23 23:44:38.137034	2024-10-23 23:44:38.137034
58111	25	2025-01-23 11:00:00	2025-01-23 12:00:00	f	2024-10-23 23:44:38.143438	2024-10-23 23:44:38.143438
58112	25	2025-01-23 12:00:00	2025-01-23 13:00:00	f	2024-10-23 23:44:38.147831	2024-10-23 23:44:38.147831
58113	25	2025-01-23 13:00:00	2025-01-23 14:00:00	f	2024-10-23 23:44:38.151907	2024-10-23 23:44:38.151907
58114	25	2025-01-23 14:00:00	2025-01-23 15:00:00	f	2024-10-23 23:44:38.15688	2024-10-23 23:44:38.15688
58115	25	2025-01-23 15:00:00	2025-01-23 16:00:00	f	2024-10-23 23:44:38.161029	2024-10-23 23:44:38.161029
58116	25	2025-01-23 16:00:00	2025-01-23 17:00:00	f	2024-10-23 23:44:38.166417	2024-10-23 23:44:38.166417
58117	25	2025-01-23 17:00:00	2025-01-23 18:00:00	f	2024-10-23 23:44:38.169893	2024-10-23 23:44:38.169893
58118	25	2025-01-23 18:00:00	2025-01-23 19:00:00	f	2024-10-23 23:44:38.171961	2024-10-23 23:44:38.171961
58119	25	2025-01-24 11:00:00	2025-01-24 12:00:00	f	2024-10-23 23:44:38.174709	2024-10-23 23:44:38.174709
58120	25	2025-01-24 12:00:00	2025-01-24 13:00:00	f	2024-10-23 23:44:38.177651	2024-10-23 23:44:38.177651
58121	25	2025-01-24 13:00:00	2025-01-24 14:00:00	f	2024-10-23 23:44:38.182579	2024-10-23 23:44:38.182579
58122	25	2025-01-24 14:00:00	2025-01-24 15:00:00	f	2024-10-23 23:44:38.191587	2024-10-23 23:44:38.191587
58123	25	2025-01-24 15:00:00	2025-01-24 16:00:00	f	2024-10-23 23:44:38.199324	2024-10-23 23:44:38.199324
58124	25	2025-01-24 16:00:00	2025-01-24 17:00:00	f	2024-10-23 23:44:38.202745	2024-10-23 23:44:38.202745
58125	25	2025-01-24 17:00:00	2025-01-24 18:00:00	f	2024-10-23 23:44:38.20501	2024-10-23 23:44:38.20501
58126	25	2025-01-24 18:00:00	2025-01-24 19:00:00	f	2024-10-23 23:44:38.20699	2024-10-23 23:44:38.20699
58127	25	2025-01-25 11:00:00	2025-01-25 12:00:00	f	2024-10-23 23:44:38.211312	2024-10-23 23:44:38.211312
58128	25	2025-01-25 12:00:00	2025-01-25 13:00:00	f	2024-10-23 23:44:38.21397	2024-10-23 23:44:38.21397
58129	25	2025-01-25 13:00:00	2025-01-25 14:00:00	f	2024-10-23 23:44:38.216591	2024-10-23 23:44:38.216591
58130	25	2025-01-25 14:00:00	2025-01-25 15:00:00	f	2024-10-23 23:44:38.21963	2024-10-23 23:44:38.21963
58131	25	2025-01-25 15:00:00	2025-01-25 16:00:00	f	2024-10-23 23:44:38.223935	2024-10-23 23:44:38.223935
58132	25	2025-01-25 16:00:00	2025-01-25 17:00:00	f	2024-10-23 23:44:38.226382	2024-10-23 23:44:38.226382
58133	25	2025-01-25 17:00:00	2025-01-25 18:00:00	f	2024-10-23 23:44:38.228352	2024-10-23 23:44:38.228352
58134	25	2025-01-25 18:00:00	2025-01-25 19:00:00	f	2024-10-23 23:44:38.232694	2024-10-23 23:44:38.232694
58135	25	2025-01-27 11:00:00	2025-01-27 12:00:00	f	2024-10-23 23:44:38.236022	2024-10-23 23:44:38.236022
58136	25	2025-01-27 12:00:00	2025-01-27 13:00:00	f	2024-10-23 23:44:38.239754	2024-10-23 23:44:38.239754
58137	25	2025-01-27 13:00:00	2025-01-27 14:00:00	f	2024-10-23 23:44:38.242797	2024-10-23 23:44:38.242797
58138	25	2025-01-27 14:00:00	2025-01-27 15:00:00	f	2024-10-23 23:44:38.246316	2024-10-23 23:44:38.246316
58139	25	2025-01-27 15:00:00	2025-01-27 16:00:00	f	2024-10-23 23:44:38.248379	2024-10-23 23:44:38.248379
58140	25	2025-01-27 16:00:00	2025-01-27 17:00:00	f	2024-10-23 23:44:38.252603	2024-10-23 23:44:38.252603
58141	25	2025-01-27 17:00:00	2025-01-27 18:00:00	f	2024-10-23 23:44:38.255667	2024-10-23 23:44:38.255667
58142	25	2025-01-27 18:00:00	2025-01-27 19:00:00	f	2024-10-23 23:44:38.259597	2024-10-23 23:44:38.259597
58143	25	2025-01-28 11:00:00	2025-01-28 12:00:00	f	2024-10-23 23:44:38.262726	2024-10-23 23:44:38.262726
58144	25	2025-01-28 12:00:00	2025-01-28 13:00:00	f	2024-10-23 23:44:38.266719	2024-10-23 23:44:38.266719
58145	25	2025-01-28 13:00:00	2025-01-28 14:00:00	f	2024-10-23 23:44:38.26936	2024-10-23 23:44:38.26936
58146	25	2025-01-28 14:00:00	2025-01-28 15:00:00	f	2024-10-23 23:44:38.272599	2024-10-23 23:44:38.272599
58147	25	2025-01-28 15:00:00	2025-01-28 16:00:00	f	2024-10-23 23:44:38.275674	2024-10-23 23:44:38.275674
58148	25	2025-01-28 16:00:00	2025-01-28 17:00:00	f	2024-10-23 23:44:38.279048	2024-10-23 23:44:38.279048
58149	25	2025-01-28 17:00:00	2025-01-28 18:00:00	f	2024-10-23 23:44:38.282728	2024-10-23 23:44:38.282728
58150	25	2025-01-28 18:00:00	2025-01-28 19:00:00	f	2024-10-23 23:44:38.285424	2024-10-23 23:44:38.285424
58151	25	2025-01-29 11:00:00	2025-01-29 12:00:00	f	2024-10-23 23:44:38.288434	2024-10-23 23:44:38.288434
58152	25	2025-01-29 12:00:00	2025-01-29 13:00:00	f	2024-10-23 23:44:38.292332	2024-10-23 23:44:38.292332
58153	25	2025-01-29 13:00:00	2025-01-29 14:00:00	f	2024-10-23 23:44:38.296115	2024-10-23 23:44:38.296115
58154	25	2025-01-29 14:00:00	2025-01-29 15:00:00	f	2024-10-23 23:44:38.300591	2024-10-23 23:44:38.300591
58155	25	2025-01-29 15:00:00	2025-01-29 16:00:00	f	2024-10-23 23:44:38.30376	2024-10-23 23:44:38.30376
58156	25	2025-01-29 16:00:00	2025-01-29 17:00:00	f	2024-10-23 23:44:38.307414	2024-10-23 23:44:38.307414
58157	25	2025-01-29 17:00:00	2025-01-29 18:00:00	f	2024-10-23 23:44:38.310175	2024-10-23 23:44:38.310175
58158	25	2025-01-29 18:00:00	2025-01-29 19:00:00	f	2024-10-23 23:44:38.314777	2024-10-23 23:44:38.314777
58159	25	2025-01-30 11:00:00	2025-01-30 12:00:00	f	2024-10-23 23:44:38.318092	2024-10-23 23:44:38.318092
58160	25	2025-01-30 12:00:00	2025-01-30 13:00:00	f	2024-10-23 23:44:38.322197	2024-10-23 23:44:38.322197
58161	25	2025-01-30 13:00:00	2025-01-30 14:00:00	f	2024-10-23 23:44:38.326642	2024-10-23 23:44:38.326642
58162	25	2025-01-30 14:00:00	2025-01-30 15:00:00	f	2024-10-23 23:44:38.330386	2024-10-23 23:44:38.330386
58163	25	2025-01-30 15:00:00	2025-01-30 16:00:00	f	2024-10-23 23:44:38.333465	2024-10-23 23:44:38.333465
58164	25	2025-01-30 16:00:00	2025-01-30 17:00:00	f	2024-10-23 23:44:38.33701	2024-10-23 23:44:38.33701
58165	25	2025-01-30 17:00:00	2025-01-30 18:00:00	f	2024-10-23 23:44:38.339592	2024-10-23 23:44:38.339592
58166	25	2025-01-30 18:00:00	2025-01-30 19:00:00	f	2024-10-23 23:44:38.344801	2024-10-23 23:44:38.344801
58167	25	2025-01-31 11:00:00	2025-01-31 12:00:00	f	2024-10-23 23:44:38.348225	2024-10-23 23:44:38.348225
58168	25	2025-01-31 12:00:00	2025-01-31 13:00:00	f	2024-10-23 23:44:38.351447	2024-10-23 23:44:38.351447
58169	25	2025-01-31 13:00:00	2025-01-31 14:00:00	f	2024-10-23 23:44:38.353977	2024-10-23 23:44:38.353977
58170	25	2025-01-31 14:00:00	2025-01-31 15:00:00	f	2024-10-23 23:44:38.363301	2024-10-23 23:44:38.363301
58171	25	2025-01-31 15:00:00	2025-01-31 16:00:00	f	2024-10-23 23:44:38.368077	2024-10-23 23:44:38.368077
58172	25	2025-01-31 16:00:00	2025-01-31 17:00:00	f	2024-10-23 23:44:38.372601	2024-10-23 23:44:38.372601
58173	25	2025-01-31 17:00:00	2025-01-31 18:00:00	f	2024-10-23 23:44:38.37514	2024-10-23 23:44:38.37514
58174	25	2025-01-31 18:00:00	2025-01-31 19:00:00	f	2024-10-23 23:44:38.379142	2024-10-23 23:44:38.379142
58175	25	2025-02-01 11:00:00	2025-02-01 12:00:00	f	2024-10-23 23:44:38.382308	2024-10-23 23:44:38.382308
58176	25	2025-02-01 12:00:00	2025-02-01 13:00:00	f	2024-10-23 23:44:38.386196	2024-10-23 23:44:38.386196
58177	25	2025-02-01 13:00:00	2025-02-01 14:00:00	f	2024-10-23 23:44:38.388789	2024-10-23 23:44:38.388789
58178	25	2025-02-01 14:00:00	2025-02-01 15:00:00	f	2024-10-23 23:44:38.392851	2024-10-23 23:44:38.392851
58179	25	2025-02-01 15:00:00	2025-02-01 16:00:00	f	2024-10-23 23:44:38.396863	2024-10-23 23:44:38.396863
58180	25	2025-02-01 16:00:00	2025-02-01 17:00:00	f	2024-10-23 23:44:38.401134	2024-10-23 23:44:38.401134
58181	25	2025-02-01 17:00:00	2025-02-01 18:00:00	f	2024-10-23 23:44:38.404258	2024-10-23 23:44:38.404258
58182	25	2025-02-01 18:00:00	2025-02-01 19:00:00	f	2024-10-23 23:44:38.40788	2024-10-23 23:44:38.40788
58183	25	2025-02-03 11:00:00	2025-02-03 12:00:00	f	2024-10-23 23:44:38.410733	2024-10-23 23:44:38.410733
58184	25	2025-02-03 12:00:00	2025-02-03 13:00:00	f	2024-10-23 23:44:38.414132	2024-10-23 23:44:38.414132
58185	25	2025-02-03 13:00:00	2025-02-03 14:00:00	f	2024-10-23 23:44:38.416734	2024-10-23 23:44:38.416734
58186	25	2025-02-03 14:00:00	2025-02-03 15:00:00	f	2024-10-23 23:44:38.420904	2024-10-23 23:44:38.420904
58187	25	2025-02-03 15:00:00	2025-02-03 16:00:00	f	2024-10-23 23:44:38.423816	2024-10-23 23:44:38.423816
58188	25	2025-02-03 16:00:00	2025-02-03 17:00:00	f	2024-10-23 23:44:38.428353	2024-10-23 23:44:38.428353
58189	25	2025-02-03 17:00:00	2025-02-03 18:00:00	f	2024-10-23 23:44:38.431383	2024-10-23 23:44:38.431383
58190	25	2025-02-03 18:00:00	2025-02-03 19:00:00	f	2024-10-23 23:44:38.435275	2024-10-23 23:44:38.435275
58191	25	2025-02-04 11:00:00	2025-02-04 12:00:00	f	2024-10-23 23:44:38.439594	2024-10-23 23:44:38.439594
58192	25	2025-02-04 12:00:00	2025-02-04 13:00:00	f	2024-10-23 23:44:38.442479	2024-10-23 23:44:38.442479
58193	25	2025-02-04 13:00:00	2025-02-04 14:00:00	f	2024-10-23 23:44:38.445211	2024-10-23 23:44:38.445211
58194	25	2025-02-04 14:00:00	2025-02-04 15:00:00	f	2024-10-23 23:44:38.44921	2024-10-23 23:44:38.44921
58195	25	2025-02-04 15:00:00	2025-02-04 16:00:00	f	2024-10-23 23:44:38.452073	2024-10-23 23:44:38.452073
58196	25	2025-02-04 16:00:00	2025-02-04 17:00:00	f	2024-10-23 23:44:38.45577	2024-10-23 23:44:38.45577
58197	25	2025-02-04 17:00:00	2025-02-04 18:00:00	f	2024-10-23 23:44:38.458717	2024-10-23 23:44:38.458717
58198	25	2025-02-04 18:00:00	2025-02-04 19:00:00	f	2024-10-23 23:44:38.463643	2024-10-23 23:44:38.463643
58199	25	2025-02-05 11:00:00	2025-02-05 12:00:00	f	2024-10-23 23:44:38.467541	2024-10-23 23:44:38.467541
58200	25	2025-02-05 12:00:00	2025-02-05 13:00:00	f	2024-10-23 23:44:38.470821	2024-10-23 23:44:38.470821
58201	25	2025-02-05 13:00:00	2025-02-05 14:00:00	f	2024-10-23 23:44:38.473993	2024-10-23 23:44:38.473993
58202	25	2025-02-05 14:00:00	2025-02-05 15:00:00	f	2024-10-23 23:44:38.478009	2024-10-23 23:44:38.478009
58203	25	2025-02-05 15:00:00	2025-02-05 16:00:00	f	2024-10-23 23:44:38.482319	2024-10-23 23:44:38.482319
58204	25	2025-02-05 16:00:00	2025-02-05 17:00:00	f	2024-10-23 23:44:38.485513	2024-10-23 23:44:38.485513
58205	25	2025-02-05 17:00:00	2025-02-05 18:00:00	f	2024-10-23 23:44:38.4893	2024-10-23 23:44:38.4893
58206	25	2025-02-05 18:00:00	2025-02-05 19:00:00	f	2024-10-23 23:44:38.491806	2024-10-23 23:44:38.491806
58207	25	2025-02-06 11:00:00	2025-02-06 12:00:00	f	2024-10-23 23:44:38.494221	2024-10-23 23:44:38.494221
58208	25	2025-02-06 12:00:00	2025-02-06 13:00:00	f	2024-10-23 23:44:38.497672	2024-10-23 23:44:38.497672
58209	25	2025-02-06 13:00:00	2025-02-06 14:00:00	f	2024-10-23 23:44:38.501208	2024-10-23 23:44:38.501208
58210	25	2025-02-06 14:00:00	2025-02-06 15:00:00	f	2024-10-23 23:44:38.505369	2024-10-23 23:44:38.505369
58211	25	2025-02-06 15:00:00	2025-02-06 16:00:00	f	2024-10-23 23:44:38.509429	2024-10-23 23:44:38.509429
58212	25	2025-02-06 16:00:00	2025-02-06 17:00:00	f	2024-10-23 23:44:38.512617	2024-10-23 23:44:38.512617
58213	25	2025-02-06 17:00:00	2025-02-06 18:00:00	f	2024-10-23 23:44:38.51655	2024-10-23 23:44:38.51655
58214	25	2025-02-06 18:00:00	2025-02-06 19:00:00	f	2024-10-23 23:44:38.519471	2024-10-23 23:44:38.519471
58215	25	2025-02-07 11:00:00	2025-02-07 12:00:00	f	2024-10-23 23:44:38.522387	2024-10-23 23:44:38.522387
58216	25	2025-02-07 12:00:00	2025-02-07 13:00:00	f	2024-10-23 23:44:38.526811	2024-10-23 23:44:38.526811
58217	25	2025-02-07 13:00:00	2025-02-07 14:00:00	f	2024-10-23 23:44:38.531578	2024-10-23 23:44:38.531578
58218	25	2025-02-07 14:00:00	2025-02-07 15:00:00	f	2024-10-23 23:44:38.535593	2024-10-23 23:44:38.535593
58219	25	2025-02-07 15:00:00	2025-02-07 16:00:00	f	2024-10-23 23:44:38.540177	2024-10-23 23:44:38.540177
58220	25	2025-02-07 16:00:00	2025-02-07 17:00:00	f	2024-10-23 23:44:38.54452	2024-10-23 23:44:38.54452
58221	25	2025-02-07 17:00:00	2025-02-07 18:00:00	f	2024-10-23 23:44:38.546866	2024-10-23 23:44:38.546866
58222	25	2025-02-07 18:00:00	2025-02-07 19:00:00	f	2024-10-23 23:44:38.54904	2024-10-23 23:44:38.54904
58223	25	2025-02-08 11:00:00	2025-02-08 12:00:00	f	2024-10-23 23:44:38.552946	2024-10-23 23:44:38.552946
58224	25	2025-02-08 12:00:00	2025-02-08 13:00:00	f	2024-10-23 23:44:38.555892	2024-10-23 23:44:38.555892
58225	25	2025-02-08 13:00:00	2025-02-08 14:00:00	f	2024-10-23 23:44:38.559595	2024-10-23 23:44:38.559595
58226	25	2025-02-08 14:00:00	2025-02-08 15:00:00	f	2024-10-23 23:44:38.563309	2024-10-23 23:44:38.563309
58227	25	2025-02-08 15:00:00	2025-02-08 16:00:00	f	2024-10-23 23:44:38.567389	2024-10-23 23:44:38.567389
58228	25	2025-02-08 16:00:00	2025-02-08 17:00:00	f	2024-10-23 23:44:38.571421	2024-10-23 23:44:38.571421
58229	25	2025-02-08 17:00:00	2025-02-08 18:00:00	f	2024-10-23 23:44:38.574911	2024-10-23 23:44:38.574911
58230	25	2025-02-08 18:00:00	2025-02-08 19:00:00	f	2024-10-23 23:44:38.578908	2024-10-23 23:44:38.578908
58231	25	2025-02-10 11:00:00	2025-02-10 12:00:00	f	2024-10-23 23:44:38.581395	2024-10-23 23:44:38.581395
58232	25	2025-02-10 12:00:00	2025-02-10 13:00:00	f	2024-10-23 23:44:38.583821	2024-10-23 23:44:38.583821
58233	25	2025-02-10 13:00:00	2025-02-10 14:00:00	f	2024-10-23 23:44:38.58746	2024-10-23 23:44:38.58746
58234	25	2025-02-10 14:00:00	2025-02-10 15:00:00	f	2024-10-23 23:44:38.5899	2024-10-23 23:44:38.5899
58235	25	2025-02-10 15:00:00	2025-02-10 16:00:00	f	2024-10-23 23:44:38.593493	2024-10-23 23:44:38.593493
58236	25	2025-02-10 16:00:00	2025-02-10 17:00:00	f	2024-10-23 23:44:38.596205	2024-10-23 23:44:38.596205
58237	25	2025-02-10 17:00:00	2025-02-10 18:00:00	f	2024-10-23 23:44:38.600825	2024-10-23 23:44:38.600825
58238	25	2025-02-10 18:00:00	2025-02-10 19:00:00	f	2024-10-23 23:44:38.603046	2024-10-23 23:44:38.603046
58239	25	2025-02-11 11:00:00	2025-02-11 12:00:00	f	2024-10-23 23:44:38.607061	2024-10-23 23:44:38.607061
58240	25	2025-02-11 12:00:00	2025-02-11 13:00:00	f	2024-10-23 23:44:38.609549	2024-10-23 23:44:38.609549
58241	25	2025-02-11 13:00:00	2025-02-11 14:00:00	f	2024-10-23 23:44:38.614095	2024-10-23 23:44:38.614095
58242	25	2025-02-11 14:00:00	2025-02-11 15:00:00	f	2024-10-23 23:44:38.616422	2024-10-23 23:44:38.616422
58243	25	2025-02-11 15:00:00	2025-02-11 16:00:00	f	2024-10-23 23:44:38.61891	2024-10-23 23:44:38.61891
58244	25	2025-02-11 16:00:00	2025-02-11 17:00:00	f	2024-10-23 23:44:38.622776	2024-10-23 23:44:38.622776
58245	25	2025-02-11 17:00:00	2025-02-11 18:00:00	f	2024-10-23 23:44:38.62549	2024-10-23 23:44:38.62549
58246	25	2025-02-11 18:00:00	2025-02-11 19:00:00	f	2024-10-23 23:44:38.630276	2024-10-23 23:44:38.630276
58247	25	2025-02-12 11:00:00	2025-02-12 12:00:00	f	2024-10-23 23:44:38.634516	2024-10-23 23:44:38.634516
58248	25	2025-02-12 12:00:00	2025-02-12 13:00:00	f	2024-10-23 23:44:38.637855	2024-10-23 23:44:38.637855
58249	25	2025-02-12 13:00:00	2025-02-12 14:00:00	f	2024-10-23 23:44:38.641618	2024-10-23 23:44:38.641618
58250	25	2025-02-12 14:00:00	2025-02-12 15:00:00	f	2024-10-23 23:44:38.644061	2024-10-23 23:44:38.644061
58251	25	2025-02-12 15:00:00	2025-02-12 16:00:00	f	2024-10-23 23:44:38.647059	2024-10-23 23:44:38.647059
58252	25	2025-02-12 16:00:00	2025-02-12 17:00:00	f	2024-10-23 23:44:38.651017	2024-10-23 23:44:38.651017
58253	25	2025-02-12 17:00:00	2025-02-12 18:00:00	f	2024-10-23 23:44:38.655192	2024-10-23 23:44:38.655192
58254	25	2025-02-12 18:00:00	2025-02-12 19:00:00	f	2024-10-23 23:44:38.658275	2024-10-23 23:44:38.658275
58255	25	2025-02-13 11:00:00	2025-02-13 12:00:00	f	2024-10-23 23:44:38.661199	2024-10-23 23:44:38.661199
58256	25	2025-02-13 12:00:00	2025-02-13 13:00:00	f	2024-10-23 23:44:38.665684	2024-10-23 23:44:38.665684
58257	25	2025-02-13 13:00:00	2025-02-13 14:00:00	f	2024-10-23 23:44:38.669957	2024-10-23 23:44:38.669957
58258	25	2025-02-13 14:00:00	2025-02-13 15:00:00	f	2024-10-23 23:44:38.673223	2024-10-23 23:44:38.673223
58259	25	2025-02-13 15:00:00	2025-02-13 16:00:00	f	2024-10-23 23:44:38.676919	2024-10-23 23:44:38.676919
58260	25	2025-02-13 16:00:00	2025-02-13 17:00:00	f	2024-10-23 23:44:38.679308	2024-10-23 23:44:38.679308
58261	25	2025-02-13 17:00:00	2025-02-13 18:00:00	f	2024-10-23 23:44:38.682991	2024-10-23 23:44:38.682991
58262	25	2025-02-13 18:00:00	2025-02-13 19:00:00	f	2024-10-23 23:44:38.685205	2024-10-23 23:44:38.685205
58263	25	2025-02-14 11:00:00	2025-02-14 12:00:00	f	2024-10-23 23:44:38.687511	2024-10-23 23:44:38.687511
58264	25	2025-02-14 12:00:00	2025-02-14 13:00:00	f	2024-10-23 23:44:38.690764	2024-10-23 23:44:38.690764
58265	25	2025-02-14 13:00:00	2025-02-14 14:00:00	f	2024-10-23 23:44:38.69308	2024-10-23 23:44:38.69308
58266	25	2025-02-14 14:00:00	2025-02-14 15:00:00	f	2024-10-23 23:44:38.697312	2024-10-23 23:44:38.697312
58267	25	2025-02-14 15:00:00	2025-02-14 16:00:00	f	2024-10-23 23:44:38.700378	2024-10-23 23:44:38.700378
58268	25	2025-02-14 16:00:00	2025-02-14 17:00:00	f	2024-10-23 23:44:38.705168	2024-10-23 23:44:38.705168
58269	25	2025-02-14 17:00:00	2025-02-14 18:00:00	f	2024-10-23 23:44:38.709206	2024-10-23 23:44:38.709206
58270	25	2025-02-14 18:00:00	2025-02-14 19:00:00	f	2024-10-23 23:44:38.713742	2024-10-23 23:44:38.713742
58271	25	2025-02-15 11:00:00	2025-02-15 12:00:00	f	2024-10-23 23:44:38.717774	2024-10-23 23:44:38.717774
58272	25	2025-02-15 12:00:00	2025-02-15 13:00:00	f	2024-10-23 23:44:38.720565	2024-10-23 23:44:38.720565
58273	25	2025-02-15 13:00:00	2025-02-15 14:00:00	f	2024-10-23 23:44:38.72371	2024-10-23 23:44:38.72371
58274	25	2025-02-15 14:00:00	2025-02-15 15:00:00	f	2024-10-23 23:44:38.727171	2024-10-23 23:44:38.727171
58275	25	2025-02-15 15:00:00	2025-02-15 16:00:00	f	2024-10-23 23:44:38.729899	2024-10-23 23:44:38.729899
58276	25	2025-02-15 16:00:00	2025-02-15 17:00:00	f	2024-10-23 23:44:38.740392	2024-10-23 23:44:38.740392
58277	25	2025-02-15 17:00:00	2025-02-15 18:00:00	f	2024-10-23 23:44:38.744113	2024-10-23 23:44:38.744113
58278	25	2025-02-15 18:00:00	2025-02-15 19:00:00	f	2024-10-23 23:44:38.749736	2024-10-23 23:44:38.749736
58279	25	2025-02-17 11:00:00	2025-02-17 12:00:00	f	2024-10-23 23:44:38.753734	2024-10-23 23:44:38.753734
58280	25	2025-02-17 12:00:00	2025-02-17 13:00:00	f	2024-10-23 23:44:38.755987	2024-10-23 23:44:38.755987
58281	25	2025-02-17 13:00:00	2025-02-17 14:00:00	f	2024-10-23 23:44:38.759816	2024-10-23 23:44:38.759816
58282	25	2025-02-17 14:00:00	2025-02-17 15:00:00	f	2024-10-23 23:44:38.762044	2024-10-23 23:44:38.762044
58283	25	2025-02-17 15:00:00	2025-02-17 16:00:00	f	2024-10-23 23:44:38.764651	2024-10-23 23:44:38.764651
58284	25	2025-02-17 16:00:00	2025-02-17 17:00:00	f	2024-10-23 23:44:38.767219	2024-10-23 23:44:38.767219
58285	25	2025-02-17 17:00:00	2025-02-17 18:00:00	f	2024-10-23 23:44:38.770681	2024-10-23 23:44:38.770681
58286	25	2025-02-17 18:00:00	2025-02-17 19:00:00	f	2024-10-23 23:44:38.77428	2024-10-23 23:44:38.77428
58287	25	2025-02-18 11:00:00	2025-02-18 12:00:00	f	2024-10-23 23:44:38.776771	2024-10-23 23:44:38.776771
58288	25	2025-02-18 12:00:00	2025-02-18 13:00:00	f	2024-10-23 23:44:38.781657	2024-10-23 23:44:38.781657
58289	25	2025-02-18 13:00:00	2025-02-18 14:00:00	f	2024-10-23 23:44:38.784268	2024-10-23 23:44:38.784268
58290	25	2025-02-18 14:00:00	2025-02-18 15:00:00	f	2024-10-23 23:44:38.788913	2024-10-23 23:44:38.788913
58291	25	2025-02-18 15:00:00	2025-02-18 16:00:00	f	2024-10-23 23:44:38.791527	2024-10-23 23:44:38.791527
58292	25	2025-02-18 16:00:00	2025-02-18 17:00:00	f	2024-10-23 23:44:38.795572	2024-10-23 23:44:38.795572
58293	25	2025-02-18 17:00:00	2025-02-18 18:00:00	f	2024-10-23 23:44:38.797851	2024-10-23 23:44:38.797851
58294	25	2025-02-18 18:00:00	2025-02-18 19:00:00	f	2024-10-23 23:44:38.802139	2024-10-23 23:44:38.802139
58295	25	2025-02-19 11:00:00	2025-02-19 12:00:00	f	2024-10-23 23:44:38.804727	2024-10-23 23:44:38.804727
58296	25	2025-02-19 12:00:00	2025-02-19 13:00:00	f	2024-10-23 23:44:38.809186	2024-10-23 23:44:38.809186
58297	25	2025-02-19 13:00:00	2025-02-19 14:00:00	f	2024-10-23 23:44:38.811528	2024-10-23 23:44:38.811528
58298	25	2025-02-19 14:00:00	2025-02-19 15:00:00	f	2024-10-23 23:44:38.814885	2024-10-23 23:44:38.814885
58299	25	2025-02-19 15:00:00	2025-02-19 16:00:00	f	2024-10-23 23:44:38.817291	2024-10-23 23:44:38.817291
58300	25	2025-02-19 16:00:00	2025-02-19 17:00:00	f	2024-10-23 23:44:38.81936	2024-10-23 23:44:38.81936
58301	25	2025-02-19 17:00:00	2025-02-19 18:00:00	f	2024-10-23 23:44:38.823294	2024-10-23 23:44:38.823294
58302	25	2025-02-19 18:00:00	2025-02-19 19:00:00	f	2024-10-23 23:44:38.82569	2024-10-23 23:44:38.82569
58303	25	2025-02-20 11:00:00	2025-02-20 12:00:00	f	2024-10-23 23:44:38.829914	2024-10-23 23:44:38.829914
58304	25	2025-02-20 12:00:00	2025-02-20 13:00:00	f	2024-10-23 23:44:38.832403	2024-10-23 23:44:38.832403
58305	25	2025-02-20 13:00:00	2025-02-20 14:00:00	f	2024-10-23 23:44:38.836115	2024-10-23 23:44:38.836115
58306	25	2025-02-20 14:00:00	2025-02-20 15:00:00	f	2024-10-23 23:44:38.839716	2024-10-23 23:44:38.839716
58307	25	2025-02-20 15:00:00	2025-02-20 16:00:00	f	2024-10-23 23:44:38.843602	2024-10-23 23:44:38.843602
58308	25	2025-02-20 16:00:00	2025-02-20 17:00:00	f	2024-10-23 23:44:38.846539	2024-10-23 23:44:38.846539
58309	25	2025-02-20 17:00:00	2025-02-20 18:00:00	f	2024-10-23 23:44:38.850546	2024-10-23 23:44:38.850546
58310	25	2025-02-20 18:00:00	2025-02-20 19:00:00	f	2024-10-23 23:44:38.852979	2024-10-23 23:44:38.852979
58311	25	2025-02-21 11:00:00	2025-02-21 12:00:00	f	2024-10-23 23:44:38.856212	2024-10-23 23:44:38.856212
58312	25	2025-02-21 12:00:00	2025-02-21 13:00:00	f	2024-10-23 23:44:38.858577	2024-10-23 23:44:38.858577
58313	25	2025-02-21 13:00:00	2025-02-21 14:00:00	f	2024-10-23 23:44:38.861259	2024-10-23 23:44:38.861259
58314	25	2025-02-21 14:00:00	2025-02-21 15:00:00	f	2024-10-23 23:44:38.865007	2024-10-23 23:44:38.865007
58315	25	2025-02-21 15:00:00	2025-02-21 16:00:00	f	2024-10-23 23:44:38.868285	2024-10-23 23:44:38.868285
58316	25	2025-02-21 16:00:00	2025-02-21 17:00:00	f	2024-10-23 23:44:38.872614	2024-10-23 23:44:38.872614
58317	25	2025-02-21 17:00:00	2025-02-21 18:00:00	f	2024-10-23 23:44:38.876176	2024-10-23 23:44:38.876176
58318	25	2025-02-21 18:00:00	2025-02-21 19:00:00	f	2024-10-23 23:44:38.880104	2024-10-23 23:44:38.880104
58319	26	2024-10-24 10:00:00	2024-10-24 11:00:00	f	2024-10-23 23:57:57.751866	2024-10-23 23:57:57.751866
58320	26	2024-10-24 11:00:00	2024-10-24 12:00:00	f	2024-10-23 23:57:57.754267	2024-10-23 23:57:57.754267
58321	26	2024-10-24 12:00:00	2024-10-24 13:00:00	f	2024-10-23 23:57:57.758537	2024-10-23 23:57:57.758537
58322	26	2024-10-24 13:00:00	2024-10-24 14:00:00	f	2024-10-23 23:57:57.761616	2024-10-23 23:57:57.761616
58323	26	2024-10-24 14:00:00	2024-10-24 15:00:00	f	2024-10-23 23:57:57.771292	2024-10-23 23:57:57.771292
58324	26	2024-10-24 15:00:00	2024-10-24 16:00:00	f	2024-10-23 23:57:57.773387	2024-10-23 23:57:57.773387
58325	26	2024-10-24 16:00:00	2024-10-24 17:00:00	f	2024-10-23 23:57:57.77669	2024-10-23 23:57:57.77669
58326	26	2024-10-24 17:00:00	2024-10-24 18:00:00	f	2024-10-23 23:57:57.77938	2024-10-23 23:57:57.77938
58327	26	2024-10-24 18:00:00	2024-10-24 19:00:00	f	2024-10-23 23:57:57.782009	2024-10-23 23:57:57.782009
58328	26	2024-10-24 19:00:00	2024-10-24 20:00:00	f	2024-10-23 23:57:57.785761	2024-10-23 23:57:57.785761
58329	26	2024-10-24 20:00:00	2024-10-24 21:00:00	f	2024-10-23 23:57:57.789993	2024-10-23 23:57:57.789993
58330	26	2024-10-25 10:00:00	2024-10-25 11:00:00	f	2024-10-23 23:57:57.793485	2024-10-23 23:57:57.793485
58331	26	2024-10-25 11:00:00	2024-10-25 12:00:00	f	2024-10-23 23:57:57.797688	2024-10-23 23:57:57.797688
58332	26	2024-10-25 12:00:00	2024-10-25 13:00:00	f	2024-10-23 23:57:57.800945	2024-10-23 23:57:57.800945
58333	26	2024-10-25 13:00:00	2024-10-25 14:00:00	f	2024-10-23 23:57:57.804919	2024-10-23 23:57:57.804919
58334	26	2024-10-25 14:00:00	2024-10-25 15:00:00	f	2024-10-23 23:57:57.807775	2024-10-23 23:57:57.807775
58335	26	2024-10-25 15:00:00	2024-10-25 16:00:00	f	2024-10-23 23:57:57.81156	2024-10-23 23:57:57.81156
58336	26	2024-10-25 16:00:00	2024-10-25 17:00:00	f	2024-10-23 23:57:57.815024	2024-10-23 23:57:57.815024
58337	26	2024-10-25 17:00:00	2024-10-25 18:00:00	f	2024-10-23 23:57:57.81923	2024-10-23 23:57:57.81923
58338	26	2024-10-25 18:00:00	2024-10-25 19:00:00	f	2024-10-23 23:57:57.822153	2024-10-23 23:57:57.822153
58339	26	2024-10-25 19:00:00	2024-10-25 20:00:00	f	2024-10-23 23:57:57.826387	2024-10-23 23:57:57.826387
58340	26	2024-10-25 20:00:00	2024-10-25 21:00:00	f	2024-10-23 23:57:57.82934	2024-10-23 23:57:57.82934
58341	26	2024-10-26 10:00:00	2024-10-26 11:00:00	f	2024-10-23 23:57:57.833037	2024-10-23 23:57:57.833037
58342	26	2024-10-26 11:00:00	2024-10-26 12:00:00	f	2024-10-23 23:57:57.835514	2024-10-23 23:57:57.835514
58343	26	2024-10-26 12:00:00	2024-10-26 13:00:00	f	2024-10-23 23:57:57.838705	2024-10-23 23:57:57.838705
58344	26	2024-10-26 13:00:00	2024-10-26 14:00:00	f	2024-10-23 23:57:57.841043	2024-10-23 23:57:57.841043
58345	26	2024-10-26 14:00:00	2024-10-26 15:00:00	f	2024-10-23 23:57:57.843167	2024-10-23 23:57:57.843167
58346	26	2024-10-26 15:00:00	2024-10-26 16:00:00	f	2024-10-23 23:57:57.845905	2024-10-23 23:57:57.845905
58347	26	2024-10-26 16:00:00	2024-10-26 17:00:00	f	2024-10-23 23:57:57.848925	2024-10-23 23:57:57.848925
58348	26	2024-10-26 17:00:00	2024-10-26 18:00:00	f	2024-10-23 23:57:57.852303	2024-10-23 23:57:57.852303
58349	26	2024-10-26 18:00:00	2024-10-26 19:00:00	f	2024-10-23 23:57:57.855441	2024-10-23 23:57:57.855441
58350	26	2024-10-26 19:00:00	2024-10-26 20:00:00	f	2024-10-23 23:57:57.858602	2024-10-23 23:57:57.858602
58351	26	2024-10-26 20:00:00	2024-10-26 21:00:00	f	2024-10-23 23:57:57.862978	2024-10-23 23:57:57.862978
58352	26	2024-10-28 10:00:00	2024-10-28 11:00:00	f	2024-10-23 23:57:57.866959	2024-10-23 23:57:57.866959
58353	26	2024-10-28 11:00:00	2024-10-28 12:00:00	f	2024-10-23 23:57:57.870426	2024-10-23 23:57:57.870426
58354	26	2024-10-28 12:00:00	2024-10-28 13:00:00	f	2024-10-23 23:57:57.873878	2024-10-23 23:57:57.873878
58355	26	2024-10-28 13:00:00	2024-10-28 14:00:00	f	2024-10-23 23:57:57.876309	2024-10-23 23:57:57.876309
58356	26	2024-10-28 14:00:00	2024-10-28 15:00:00	f	2024-10-23 23:57:57.878998	2024-10-23 23:57:57.878998
58357	26	2024-10-28 15:00:00	2024-10-28 16:00:00	f	2024-10-23 23:57:57.883913	2024-10-23 23:57:57.883913
58358	26	2024-10-28 16:00:00	2024-10-28 17:00:00	f	2024-10-23 23:57:57.88781	2024-10-23 23:57:57.88781
58359	26	2024-10-28 17:00:00	2024-10-28 18:00:00	f	2024-10-23 23:57:57.891329	2024-10-23 23:57:57.891329
58360	26	2024-10-28 18:00:00	2024-10-28 19:00:00	f	2024-10-23 23:57:57.895411	2024-10-23 23:57:57.895411
58361	26	2024-10-28 19:00:00	2024-10-28 20:00:00	f	2024-10-23 23:57:57.898862	2024-10-23 23:57:57.898862
58362	26	2024-10-28 20:00:00	2024-10-28 21:00:00	f	2024-10-23 23:57:57.902421	2024-10-23 23:57:57.902421
58363	26	2024-10-29 10:00:00	2024-10-29 11:00:00	f	2024-10-23 23:57:57.905678	2024-10-23 23:57:57.905678
58364	26	2024-10-29 11:00:00	2024-10-29 12:00:00	f	2024-10-23 23:57:57.909304	2024-10-23 23:57:57.909304
58365	26	2024-10-29 12:00:00	2024-10-29 13:00:00	f	2024-10-23 23:57:57.913701	2024-10-23 23:57:57.913701
58366	26	2024-10-29 13:00:00	2024-10-29 14:00:00	f	2024-10-23 23:57:57.918064	2024-10-23 23:57:57.918064
58367	26	2024-10-29 14:00:00	2024-10-29 15:00:00	f	2024-10-23 23:57:57.922514	2024-10-23 23:57:57.922514
58368	26	2024-10-29 15:00:00	2024-10-29 16:00:00	f	2024-10-23 23:57:57.925575	2024-10-23 23:57:57.925575
58369	26	2024-10-29 16:00:00	2024-10-29 17:00:00	f	2024-10-23 23:57:57.930208	2024-10-23 23:57:57.930208
58370	26	2024-10-29 17:00:00	2024-10-29 18:00:00	f	2024-10-23 23:57:57.93343	2024-10-23 23:57:57.93343
58371	26	2024-10-29 18:00:00	2024-10-29 19:00:00	f	2024-10-23 23:57:57.937201	2024-10-23 23:57:57.937201
58372	26	2024-10-29 19:00:00	2024-10-29 20:00:00	f	2024-10-23 23:57:57.940367	2024-10-23 23:57:57.940367
58373	26	2024-10-29 20:00:00	2024-10-29 21:00:00	f	2024-10-23 23:57:57.944561	2024-10-23 23:57:57.944561
58374	26	2024-10-30 10:00:00	2024-10-30 11:00:00	f	2024-10-23 23:57:57.949664	2024-10-23 23:57:57.949664
58375	26	2024-10-30 11:00:00	2024-10-30 12:00:00	f	2024-10-23 23:57:57.952507	2024-10-23 23:57:57.952507
58376	26	2024-10-30 12:00:00	2024-10-30 13:00:00	f	2024-10-23 23:57:57.956651	2024-10-23 23:57:57.956651
58377	26	2024-10-30 13:00:00	2024-10-30 14:00:00	f	2024-10-23 23:57:57.959328	2024-10-23 23:57:57.959328
58378	26	2024-10-30 14:00:00	2024-10-30 15:00:00	f	2024-10-23 23:57:57.961844	2024-10-23 23:57:57.961844
58379	26	2024-10-30 15:00:00	2024-10-30 16:00:00	f	2024-10-23 23:57:57.965034	2024-10-23 23:57:57.965034
58380	26	2024-10-30 16:00:00	2024-10-30 17:00:00	f	2024-10-23 23:57:57.967603	2024-10-23 23:57:57.967603
58381	26	2024-10-30 17:00:00	2024-10-30 18:00:00	f	2024-10-23 23:57:57.971783	2024-10-23 23:57:57.971783
58382	26	2024-10-30 18:00:00	2024-10-30 19:00:00	f	2024-10-23 23:57:57.975679	2024-10-23 23:57:57.975679
58383	26	2024-10-30 19:00:00	2024-10-30 20:00:00	f	2024-10-23 23:57:57.979904	2024-10-23 23:57:57.979904
58384	26	2024-10-30 20:00:00	2024-10-30 21:00:00	f	2024-10-23 23:57:57.983089	2024-10-23 23:57:57.983089
58385	26	2024-10-31 10:00:00	2024-10-31 11:00:00	f	2024-10-23 23:57:57.986873	2024-10-23 23:57:57.986873
58386	26	2024-10-31 11:00:00	2024-10-31 12:00:00	f	2024-10-23 23:57:57.991443	2024-10-23 23:57:57.991443
58387	26	2024-10-31 12:00:00	2024-10-31 13:00:00	f	2024-10-23 23:57:57.99404	2024-10-23 23:57:57.99404
58388	26	2024-10-31 13:00:00	2024-10-31 14:00:00	f	2024-10-23 23:57:57.996475	2024-10-23 23:57:57.996475
58389	26	2024-10-31 14:00:00	2024-10-31 15:00:00	f	2024-10-23 23:57:58.000254	2024-10-23 23:57:58.000254
58390	26	2024-10-31 15:00:00	2024-10-31 16:00:00	f	2024-10-23 23:57:58.003186	2024-10-23 23:57:58.003186
58391	26	2024-10-31 16:00:00	2024-10-31 17:00:00	f	2024-10-23 23:57:58.007894	2024-10-23 23:57:58.007894
58392	26	2024-10-31 17:00:00	2024-10-31 18:00:00	f	2024-10-23 23:57:58.010822	2024-10-23 23:57:58.010822
58393	26	2024-10-31 18:00:00	2024-10-31 19:00:00	f	2024-10-23 23:57:58.014801	2024-10-23 23:57:58.014801
58394	26	2024-10-31 19:00:00	2024-10-31 20:00:00	f	2024-10-23 23:57:58.017937	2024-10-23 23:57:58.017937
58395	26	2024-10-31 20:00:00	2024-10-31 21:00:00	f	2024-10-23 23:57:58.021877	2024-10-23 23:57:58.021877
58396	26	2024-11-01 10:00:00	2024-11-01 11:00:00	f	2024-10-23 23:57:58.024684	2024-10-23 23:57:58.024684
58397	26	2024-11-01 11:00:00	2024-11-01 12:00:00	f	2024-10-23 23:57:58.02853	2024-10-23 23:57:58.02853
58398	26	2024-11-01 12:00:00	2024-11-01 13:00:00	f	2024-10-23 23:57:58.031406	2024-10-23 23:57:58.031406
58399	26	2024-11-01 13:00:00	2024-11-01 14:00:00	f	2024-10-23 23:57:58.034928	2024-10-23 23:57:58.034928
58400	26	2024-11-01 14:00:00	2024-11-01 15:00:00	f	2024-10-23 23:57:58.039994	2024-10-23 23:57:58.039994
58401	26	2024-11-01 15:00:00	2024-11-01 16:00:00	f	2024-10-23 23:57:58.043378	2024-10-23 23:57:58.043378
58402	26	2024-11-01 16:00:00	2024-11-01 17:00:00	f	2024-10-23 23:57:58.046919	2024-10-23 23:57:58.046919
58403	26	2024-11-01 17:00:00	2024-11-01 18:00:00	f	2024-10-23 23:57:58.04908	2024-10-23 23:57:58.04908
58404	26	2024-11-01 18:00:00	2024-11-01 19:00:00	f	2024-10-23 23:57:58.051272	2024-10-23 23:57:58.051272
58405	26	2024-11-01 19:00:00	2024-11-01 20:00:00	f	2024-10-23 23:57:58.054397	2024-10-23 23:57:58.054397
58406	26	2024-11-01 20:00:00	2024-11-01 21:00:00	f	2024-10-23 23:57:58.057057	2024-10-23 23:57:58.057057
58407	26	2024-11-02 10:00:00	2024-11-02 11:00:00	f	2024-10-23 23:57:58.060067	2024-10-23 23:57:58.060067
58408	26	2024-11-02 11:00:00	2024-11-02 12:00:00	f	2024-10-23 23:57:58.063274	2024-10-23 23:57:58.063274
58409	26	2024-11-02 12:00:00	2024-11-02 13:00:00	f	2024-10-23 23:57:58.066161	2024-10-23 23:57:58.066161
58410	26	2024-11-02 13:00:00	2024-11-02 14:00:00	f	2024-10-23 23:57:58.070566	2024-10-23 23:57:58.070566
58411	26	2024-11-02 14:00:00	2024-11-02 15:00:00	f	2024-10-23 23:57:58.073769	2024-10-23 23:57:58.073769
58412	26	2024-11-02 15:00:00	2024-11-02 16:00:00	f	2024-10-23 23:57:58.077304	2024-10-23 23:57:58.077304
58413	26	2024-11-02 16:00:00	2024-11-02 17:00:00	f	2024-10-23 23:57:58.079995	2024-10-23 23:57:58.079995
58414	26	2024-11-02 17:00:00	2024-11-02 18:00:00	f	2024-10-23 23:57:58.083144	2024-10-23 23:57:58.083144
58415	26	2024-11-02 18:00:00	2024-11-02 19:00:00	f	2024-10-23 23:57:58.085487	2024-10-23 23:57:58.085487
58416	26	2024-11-02 19:00:00	2024-11-02 20:00:00	f	2024-10-23 23:57:58.08821	2024-10-23 23:57:58.08821
58417	26	2024-11-02 20:00:00	2024-11-02 21:00:00	f	2024-10-23 23:57:58.09124	2024-10-23 23:57:58.09124
58418	26	2024-11-04 10:00:00	2024-11-04 11:00:00	f	2024-10-23 23:57:58.093347	2024-10-23 23:57:58.093347
58419	26	2024-11-04 11:00:00	2024-11-04 12:00:00	f	2024-10-23 23:57:58.096774	2024-10-23 23:57:58.096774
58420	26	2024-11-04 12:00:00	2024-11-04 13:00:00	f	2024-10-23 23:57:58.099818	2024-10-23 23:57:58.099818
58421	26	2024-11-04 13:00:00	2024-11-04 14:00:00	f	2024-10-23 23:57:58.103935	2024-10-23 23:57:58.103935
58422	26	2024-11-04 14:00:00	2024-11-04 15:00:00	f	2024-10-23 23:57:58.107303	2024-10-23 23:57:58.107303
58423	26	2024-11-04 15:00:00	2024-11-04 16:00:00	f	2024-10-23 23:57:58.114287	2024-10-23 23:57:58.114287
58424	26	2024-11-04 16:00:00	2024-11-04 17:00:00	f	2024-10-23 23:57:58.117496	2024-10-23 23:57:58.117496
58425	26	2024-11-04 17:00:00	2024-11-04 18:00:00	f	2024-10-23 23:57:58.119826	2024-10-23 23:57:58.119826
58426	26	2024-11-04 18:00:00	2024-11-04 19:00:00	f	2024-10-23 23:57:58.122295	2024-10-23 23:57:58.122295
58427	26	2024-11-04 19:00:00	2024-11-04 20:00:00	f	2024-10-23 23:57:58.125175	2024-10-23 23:57:58.125175
58428	26	2024-11-04 20:00:00	2024-11-04 21:00:00	f	2024-10-23 23:57:58.127103	2024-10-23 23:57:58.127103
58429	26	2024-11-05 10:00:00	2024-11-05 11:00:00	f	2024-10-23 23:57:58.130132	2024-10-23 23:57:58.130132
58430	26	2024-11-05 11:00:00	2024-11-05 12:00:00	f	2024-10-23 23:57:58.133492	2024-10-23 23:57:58.133492
58431	26	2024-11-05 12:00:00	2024-11-05 13:00:00	f	2024-10-23 23:57:58.13601	2024-10-23 23:57:58.13601
58432	26	2024-11-05 13:00:00	2024-11-05 14:00:00	f	2024-10-23 23:57:58.140172	2024-10-23 23:57:58.140172
58433	26	2024-11-05 14:00:00	2024-11-05 15:00:00	f	2024-10-23 23:57:58.143883	2024-10-23 23:57:58.143883
58434	26	2024-11-05 15:00:00	2024-11-05 16:00:00	f	2024-10-23 23:57:58.14721	2024-10-23 23:57:58.14721
58435	26	2024-11-05 16:00:00	2024-11-05 17:00:00	f	2024-10-23 23:57:58.149757	2024-10-23 23:57:58.149757
58436	26	2024-11-05 17:00:00	2024-11-05 18:00:00	f	2024-10-23 23:57:58.152724	2024-10-23 23:57:58.152724
58437	26	2024-11-05 18:00:00	2024-11-05 19:00:00	f	2024-10-23 23:57:58.154945	2024-10-23 23:57:58.154945
58438	26	2024-11-05 19:00:00	2024-11-05 20:00:00	f	2024-10-23 23:57:58.157671	2024-10-23 23:57:58.157671
58439	26	2024-11-05 20:00:00	2024-11-05 21:00:00	f	2024-10-23 23:57:58.161078	2024-10-23 23:57:58.161078
58440	26	2024-11-06 10:00:00	2024-11-06 11:00:00	f	2024-10-23 23:57:58.164214	2024-10-23 23:57:58.164214
58441	26	2024-11-06 11:00:00	2024-11-06 12:00:00	f	2024-10-23 23:57:58.167801	2024-10-23 23:57:58.167801
58442	26	2024-11-06 12:00:00	2024-11-06 13:00:00	f	2024-10-23 23:57:58.170729	2024-10-23 23:57:58.170729
58443	26	2024-11-06 13:00:00	2024-11-06 14:00:00	f	2024-10-23 23:57:58.173773	2024-10-23 23:57:58.173773
58444	26	2024-11-06 14:00:00	2024-11-06 15:00:00	f	2024-10-23 23:57:58.176098	2024-10-23 23:57:58.176098
58445	26	2024-11-06 15:00:00	2024-11-06 16:00:00	f	2024-10-23 23:57:58.179295	2024-10-23 23:57:58.179295
58446	26	2024-11-06 16:00:00	2024-11-06 17:00:00	f	2024-10-23 23:57:58.181854	2024-10-23 23:57:58.181854
58447	26	2024-11-06 17:00:00	2024-11-06 18:00:00	f	2024-10-23 23:57:58.184218	2024-10-23 23:57:58.184218
58448	26	2024-11-06 18:00:00	2024-11-06 19:00:00	f	2024-10-23 23:57:58.187523	2024-10-23 23:57:58.187523
58449	26	2024-11-06 19:00:00	2024-11-06 20:00:00	f	2024-10-23 23:57:58.189561	2024-10-23 23:57:58.189561
58450	26	2024-11-06 20:00:00	2024-11-06 21:00:00	f	2024-10-23 23:57:58.193278	2024-10-23 23:57:58.193278
58451	26	2024-11-07 10:00:00	2024-11-07 11:00:00	f	2024-10-23 23:57:58.19603	2024-10-23 23:57:58.19603
58452	26	2024-11-07 11:00:00	2024-11-07 12:00:00	f	2024-10-23 23:57:58.198843	2024-10-23 23:57:58.198843
58453	26	2024-11-07 12:00:00	2024-11-07 13:00:00	f	2024-10-23 23:57:58.202398	2024-10-23 23:57:58.202398
58454	26	2024-11-07 13:00:00	2024-11-07 14:00:00	f	2024-10-23 23:57:58.204728	2024-10-23 23:57:58.204728
58455	26	2024-11-07 14:00:00	2024-11-07 15:00:00	f	2024-10-23 23:57:58.20834	2024-10-23 23:57:58.20834
58456	26	2024-11-07 15:00:00	2024-11-07 16:00:00	f	2024-10-23 23:57:58.210664	2024-10-23 23:57:58.210664
58457	26	2024-11-07 16:00:00	2024-11-07 17:00:00	f	2024-10-23 23:57:58.21414	2024-10-23 23:57:58.21414
58458	26	2024-11-07 17:00:00	2024-11-07 18:00:00	f	2024-10-23 23:57:58.216996	2024-10-23 23:57:58.216996
58459	26	2024-11-07 18:00:00	2024-11-07 19:00:00	f	2024-10-23 23:57:58.220493	2024-10-23 23:57:58.220493
58460	26	2024-11-07 19:00:00	2024-11-07 20:00:00	f	2024-10-23 23:57:58.224439	2024-10-23 23:57:58.224439
58461	26	2024-11-07 20:00:00	2024-11-07 21:00:00	f	2024-10-23 23:57:58.229912	2024-10-23 23:57:58.229912
58462	26	2024-11-08 10:00:00	2024-11-08 11:00:00	f	2024-10-23 23:57:58.234163	2024-10-23 23:57:58.234163
58463	26	2024-11-08 11:00:00	2024-11-08 12:00:00	f	2024-10-23 23:57:58.23718	2024-10-23 23:57:58.23718
58464	26	2024-11-08 12:00:00	2024-11-08 13:00:00	f	2024-10-23 23:57:58.239842	2024-10-23 23:57:58.239842
58465	26	2024-11-08 13:00:00	2024-11-08 14:00:00	f	2024-10-23 23:57:58.243543	2024-10-23 23:57:58.243543
58466	26	2024-11-08 14:00:00	2024-11-08 15:00:00	f	2024-10-23 23:57:58.245698	2024-10-23 23:57:58.245698
58467	26	2024-11-08 15:00:00	2024-11-08 16:00:00	f	2024-10-23 23:57:58.248975	2024-10-23 23:57:58.248975
58468	26	2024-11-08 16:00:00	2024-11-08 17:00:00	f	2024-10-23 23:57:58.251754	2024-10-23 23:57:58.251754
58469	26	2024-11-08 17:00:00	2024-11-08 18:00:00	f	2024-10-23 23:57:58.255614	2024-10-23 23:57:58.255614
58470	26	2024-11-08 18:00:00	2024-11-08 19:00:00	f	2024-10-23 23:57:58.258623	2024-10-23 23:57:58.258623
58471	26	2024-11-08 19:00:00	2024-11-08 20:00:00	f	2024-10-23 23:57:58.262395	2024-10-23 23:57:58.262395
58472	26	2024-11-08 20:00:00	2024-11-08 21:00:00	f	2024-10-23 23:57:58.265518	2024-10-23 23:57:58.265518
58473	26	2024-11-09 10:00:00	2024-11-09 11:00:00	f	2024-10-23 23:57:58.268867	2024-10-23 23:57:58.268867
58474	26	2024-11-09 11:00:00	2024-11-09 12:00:00	f	2024-10-23 23:57:58.272118	2024-10-23 23:57:58.272118
58475	26	2024-11-09 12:00:00	2024-11-09 13:00:00	f	2024-10-23 23:57:58.274614	2024-10-23 23:57:58.274614
58476	26	2024-11-09 13:00:00	2024-11-09 14:00:00	f	2024-10-23 23:57:58.277539	2024-10-23 23:57:58.277539
58477	26	2024-11-09 14:00:00	2024-11-09 15:00:00	f	2024-10-23 23:57:58.280469	2024-10-23 23:57:58.280469
58478	26	2024-11-09 15:00:00	2024-11-09 16:00:00	f	2024-10-23 23:57:58.283905	2024-10-23 23:57:58.283905
58479	26	2024-11-09 16:00:00	2024-11-09 17:00:00	f	2024-10-23 23:57:58.286919	2024-10-23 23:57:58.286919
58480	26	2024-11-09 17:00:00	2024-11-09 18:00:00	f	2024-10-23 23:57:58.291151	2024-10-23 23:57:58.291151
58481	26	2024-11-09 18:00:00	2024-11-09 19:00:00	f	2024-10-23 23:57:58.293931	2024-10-23 23:57:58.293931
58482	26	2024-11-09 19:00:00	2024-11-09 20:00:00	f	2024-10-23 23:57:58.297713	2024-10-23 23:57:58.297713
58483	26	2024-11-09 20:00:00	2024-11-09 21:00:00	f	2024-10-23 23:57:58.30046	2024-10-23 23:57:58.30046
58484	26	2024-11-11 10:00:00	2024-11-11 11:00:00	f	2024-10-23 23:57:58.304478	2024-10-23 23:57:58.304478
58485	26	2024-11-11 11:00:00	2024-11-11 12:00:00	f	2024-10-23 23:57:58.306908	2024-10-23 23:57:58.306908
58486	26	2024-11-11 12:00:00	2024-11-11 13:00:00	f	2024-10-23 23:57:58.3106	2024-10-23 23:57:58.3106
58487	26	2024-11-11 13:00:00	2024-11-11 14:00:00	f	2024-10-23 23:57:58.313076	2024-10-23 23:57:58.313076
58488	26	2024-11-11 14:00:00	2024-11-11 15:00:00	f	2024-10-23 23:57:58.315156	2024-10-23 23:57:58.315156
58489	26	2024-11-11 15:00:00	2024-11-11 16:00:00	f	2024-10-23 23:57:58.318866	2024-10-23 23:57:58.318866
58490	26	2024-11-11 16:00:00	2024-11-11 17:00:00	f	2024-10-23 23:57:58.321265	2024-10-23 23:57:58.321265
58491	26	2024-11-11 17:00:00	2024-11-11 18:00:00	f	2024-10-23 23:57:58.325458	2024-10-23 23:57:58.325458
58492	26	2024-11-11 18:00:00	2024-11-11 19:00:00	f	2024-10-23 23:57:58.329757	2024-10-23 23:57:58.329757
58493	26	2024-11-11 19:00:00	2024-11-11 20:00:00	f	2024-10-23 23:57:58.335223	2024-10-23 23:57:58.335223
58494	26	2024-11-11 20:00:00	2024-11-11 21:00:00	f	2024-10-23 23:57:58.340459	2024-10-23 23:57:58.340459
58495	26	2024-11-12 10:00:00	2024-11-12 11:00:00	f	2024-10-23 23:57:58.344598	2024-10-23 23:57:58.344598
58496	26	2024-11-12 11:00:00	2024-11-12 12:00:00	f	2024-10-23 23:57:58.350033	2024-10-23 23:57:58.350033
58497	26	2024-11-12 12:00:00	2024-11-12 13:00:00	f	2024-10-23 23:57:58.354926	2024-10-23 23:57:58.354926
58498	26	2024-11-12 13:00:00	2024-11-12 14:00:00	f	2024-10-23 23:57:58.358677	2024-10-23 23:57:58.358677
58499	26	2024-11-12 14:00:00	2024-11-12 15:00:00	f	2024-10-23 23:57:58.36501	2024-10-23 23:57:58.36501
58500	26	2024-11-12 15:00:00	2024-11-12 16:00:00	f	2024-10-23 23:57:58.370293	2024-10-23 23:57:58.370293
58501	26	2024-11-12 16:00:00	2024-11-12 17:00:00	f	2024-10-23 23:57:58.375953	2024-10-23 23:57:58.375953
58502	26	2024-11-12 17:00:00	2024-11-12 18:00:00	f	2024-10-23 23:57:58.381763	2024-10-23 23:57:58.381763
58503	26	2024-11-12 18:00:00	2024-11-12 19:00:00	f	2024-10-23 23:57:58.385411	2024-10-23 23:57:58.385411
58504	26	2024-11-12 19:00:00	2024-11-12 20:00:00	f	2024-10-23 23:57:58.390043	2024-10-23 23:57:58.390043
58505	26	2024-11-12 20:00:00	2024-11-12 21:00:00	f	2024-10-23 23:57:58.395058	2024-10-23 23:57:58.395058
58506	26	2024-11-13 10:00:00	2024-11-13 11:00:00	f	2024-10-23 23:57:58.400585	2024-10-23 23:57:58.400585
58507	26	2024-11-13 11:00:00	2024-11-13 12:00:00	f	2024-10-23 23:57:58.404978	2024-10-23 23:57:58.404978
58508	26	2024-11-13 12:00:00	2024-11-13 13:00:00	f	2024-10-23 23:57:58.410582	2024-10-23 23:57:58.410582
58509	26	2024-11-13 13:00:00	2024-11-13 14:00:00	f	2024-10-23 23:57:58.414311	2024-10-23 23:57:58.414311
58510	26	2024-11-13 14:00:00	2024-11-13 15:00:00	f	2024-10-23 23:57:58.418793	2024-10-23 23:57:58.418793
58511	26	2024-11-13 15:00:00	2024-11-13 16:00:00	f	2024-10-23 23:57:58.425131	2024-10-23 23:57:58.425131
58512	26	2024-11-13 16:00:00	2024-11-13 17:00:00	f	2024-10-23 23:57:58.430113	2024-10-23 23:57:58.430113
58513	26	2024-11-13 17:00:00	2024-11-13 18:00:00	f	2024-10-23 23:57:58.434945	2024-10-23 23:57:58.434945
58514	26	2024-11-13 18:00:00	2024-11-13 19:00:00	f	2024-10-23 23:57:58.439254	2024-10-23 23:57:58.439254
58515	26	2024-11-13 19:00:00	2024-11-13 20:00:00	f	2024-10-23 23:57:58.443902	2024-10-23 23:57:58.443902
58516	26	2024-11-13 20:00:00	2024-11-13 21:00:00	f	2024-10-23 23:57:58.447606	2024-10-23 23:57:58.447606
58517	26	2024-11-14 10:00:00	2024-11-14 11:00:00	f	2024-10-23 23:57:58.45374	2024-10-23 23:57:58.45374
58518	26	2024-11-14 11:00:00	2024-11-14 12:00:00	f	2024-10-23 23:57:58.459914	2024-10-23 23:57:58.459914
58519	26	2024-11-14 12:00:00	2024-11-14 13:00:00	f	2024-10-23 23:57:58.466698	2024-10-23 23:57:58.466698
58520	26	2024-11-14 13:00:00	2024-11-14 14:00:00	f	2024-10-23 23:57:58.471655	2024-10-23 23:57:58.471655
58521	26	2024-11-14 14:00:00	2024-11-14 15:00:00	f	2024-10-23 23:57:58.474788	2024-10-23 23:57:58.474788
58522	26	2024-11-14 15:00:00	2024-11-14 16:00:00	f	2024-10-23 23:57:58.479808	2024-10-23 23:57:58.479808
58523	26	2024-11-14 16:00:00	2024-11-14 17:00:00	f	2024-10-23 23:57:58.493365	2024-10-23 23:57:58.493365
58524	26	2024-11-14 17:00:00	2024-11-14 18:00:00	f	2024-10-23 23:57:58.497047	2024-10-23 23:57:58.497047
58525	26	2024-11-14 18:00:00	2024-11-14 19:00:00	f	2024-10-23 23:57:58.502403	2024-10-23 23:57:58.502403
58526	26	2024-11-14 19:00:00	2024-11-14 20:00:00	f	2024-10-23 23:57:58.507588	2024-10-23 23:57:58.507588
58527	26	2024-11-14 20:00:00	2024-11-14 21:00:00	f	2024-10-23 23:57:58.51112	2024-10-23 23:57:58.51112
58528	26	2024-11-15 10:00:00	2024-11-15 11:00:00	f	2024-10-23 23:57:58.516084	2024-10-23 23:57:58.516084
58529	26	2024-11-15 11:00:00	2024-11-15 12:00:00	f	2024-10-23 23:57:58.521179	2024-10-23 23:57:58.521179
58530	26	2024-11-15 12:00:00	2024-11-15 13:00:00	f	2024-10-23 23:57:58.524315	2024-10-23 23:57:58.524315
58531	26	2024-11-15 13:00:00	2024-11-15 14:00:00	f	2024-10-23 23:57:58.529921	2024-10-23 23:57:58.529921
58532	26	2024-11-15 14:00:00	2024-11-15 15:00:00	f	2024-10-23 23:57:58.535105	2024-10-23 23:57:58.535105
58533	26	2024-11-15 15:00:00	2024-11-15 16:00:00	f	2024-10-23 23:57:58.539348	2024-10-23 23:57:58.539348
58534	26	2024-11-15 16:00:00	2024-11-15 17:00:00	f	2024-10-23 23:57:58.54406	2024-10-23 23:57:58.54406
58535	26	2024-11-15 17:00:00	2024-11-15 18:00:00	f	2024-10-23 23:57:58.550708	2024-10-23 23:57:58.550708
58536	26	2024-11-15 18:00:00	2024-11-15 19:00:00	f	2024-10-23 23:57:58.556268	2024-10-23 23:57:58.556268
58537	26	2024-11-15 19:00:00	2024-11-15 20:00:00	f	2024-10-23 23:57:58.560346	2024-10-23 23:57:58.560346
58538	26	2024-11-15 20:00:00	2024-11-15 21:00:00	f	2024-10-23 23:57:58.564313	2024-10-23 23:57:58.564313
58539	26	2024-11-16 10:00:00	2024-11-16 11:00:00	f	2024-10-23 23:57:58.568923	2024-10-23 23:57:58.568923
58540	26	2024-11-16 11:00:00	2024-11-16 12:00:00	f	2024-10-23 23:57:58.572101	2024-10-23 23:57:58.572101
58541	26	2024-11-16 12:00:00	2024-11-16 13:00:00	f	2024-10-23 23:57:58.577178	2024-10-23 23:57:58.577178
58542	26	2024-11-16 13:00:00	2024-11-16 14:00:00	f	2024-10-23 23:57:58.581803	2024-10-23 23:57:58.581803
58543	26	2024-11-16 14:00:00	2024-11-16 15:00:00	f	2024-10-23 23:57:58.58656	2024-10-23 23:57:58.58656
58544	26	2024-11-16 15:00:00	2024-11-16 16:00:00	f	2024-10-23 23:57:58.592	2024-10-23 23:57:58.592
58545	26	2024-11-16 16:00:00	2024-11-16 17:00:00	f	2024-10-23 23:57:58.595953	2024-10-23 23:57:58.595953
58546	26	2024-11-16 17:00:00	2024-11-16 18:00:00	f	2024-10-23 23:57:58.599368	2024-10-23 23:57:58.599368
58547	26	2024-11-16 18:00:00	2024-11-16 19:00:00	f	2024-10-23 23:57:58.604001	2024-10-23 23:57:58.604001
58548	26	2024-11-16 19:00:00	2024-11-16 20:00:00	f	2024-10-23 23:57:58.607905	2024-10-23 23:57:58.607905
58549	26	2024-11-16 20:00:00	2024-11-16 21:00:00	f	2024-10-23 23:57:58.613091	2024-10-23 23:57:58.613091
58550	26	2024-11-18 10:00:00	2024-11-18 11:00:00	f	2024-10-23 23:57:58.618088	2024-10-23 23:57:58.618088
58551	26	2024-11-18 11:00:00	2024-11-18 12:00:00	f	2024-10-23 23:57:58.62363	2024-10-23 23:57:58.62363
58552	26	2024-11-18 12:00:00	2024-11-18 13:00:00	f	2024-10-23 23:57:58.626387	2024-10-23 23:57:58.626387
58553	26	2024-11-18 13:00:00	2024-11-18 14:00:00	f	2024-10-23 23:57:58.628611	2024-10-23 23:57:58.628611
58554	26	2024-11-18 14:00:00	2024-11-18 15:00:00	f	2024-10-23 23:57:58.63275	2024-10-23 23:57:58.63275
58555	26	2024-11-18 15:00:00	2024-11-18 16:00:00	f	2024-10-23 23:57:58.63532	2024-10-23 23:57:58.63532
58556	26	2024-11-18 16:00:00	2024-11-18 17:00:00	f	2024-10-23 23:57:58.637895	2024-10-23 23:57:58.637895
58557	26	2024-11-18 17:00:00	2024-11-18 18:00:00	f	2024-10-23 23:57:58.642037	2024-10-23 23:57:58.642037
58558	26	2024-11-18 18:00:00	2024-11-18 19:00:00	f	2024-10-23 23:57:58.645796	2024-10-23 23:57:58.645796
58559	26	2024-11-18 19:00:00	2024-11-18 20:00:00	f	2024-10-23 23:57:58.648718	2024-10-23 23:57:58.648718
58560	26	2024-11-18 20:00:00	2024-11-18 21:00:00	f	2024-10-23 23:57:58.65145	2024-10-23 23:57:58.65145
58561	26	2024-11-19 10:00:00	2024-11-19 11:00:00	f	2024-10-23 23:57:58.654976	2024-10-23 23:57:58.654976
58562	26	2024-11-19 11:00:00	2024-11-19 12:00:00	f	2024-10-23 23:57:58.657908	2024-10-23 23:57:58.657908
58563	26	2024-11-19 12:00:00	2024-11-19 13:00:00	f	2024-10-23 23:57:58.660929	2024-10-23 23:57:58.660929
58564	26	2024-11-19 13:00:00	2024-11-19 14:00:00	f	2024-10-23 23:57:58.663238	2024-10-23 23:57:58.663238
58565	26	2024-11-19 14:00:00	2024-11-19 15:00:00	f	2024-10-23 23:57:58.665786	2024-10-23 23:57:58.665786
58566	26	2024-11-19 15:00:00	2024-11-19 16:00:00	f	2024-10-23 23:57:58.668331	2024-10-23 23:57:58.668331
58567	26	2024-11-19 16:00:00	2024-11-19 17:00:00	f	2024-10-23 23:57:58.671741	2024-10-23 23:57:58.671741
58568	26	2024-11-19 17:00:00	2024-11-19 18:00:00	f	2024-10-23 23:57:58.675419	2024-10-23 23:57:58.675419
58569	26	2024-11-19 18:00:00	2024-11-19 19:00:00	f	2024-10-23 23:57:58.67874	2024-10-23 23:57:58.67874
58570	26	2024-11-19 19:00:00	2024-11-19 20:00:00	f	2024-10-23 23:57:58.681798	2024-10-23 23:57:58.681798
58571	26	2024-11-19 20:00:00	2024-11-19 21:00:00	f	2024-10-23 23:57:58.684677	2024-10-23 23:57:58.684677
58572	26	2024-11-20 10:00:00	2024-11-20 11:00:00	f	2024-10-23 23:57:58.687843	2024-10-23 23:57:58.687843
58573	26	2024-11-20 11:00:00	2024-11-20 12:00:00	f	2024-10-23 23:57:58.69039	2024-10-23 23:57:58.69039
58574	26	2024-11-20 12:00:00	2024-11-20 13:00:00	f	2024-10-23 23:57:58.69368	2024-10-23 23:57:58.69368
58575	26	2024-11-20 13:00:00	2024-11-20 14:00:00	f	2024-10-23 23:57:58.696024	2024-10-23 23:57:58.696024
58576	26	2024-11-20 14:00:00	2024-11-20 15:00:00	f	2024-10-23 23:57:58.698281	2024-10-23 23:57:58.698281
58577	26	2024-11-20 15:00:00	2024-11-20 16:00:00	f	2024-10-23 23:57:58.702008	2024-10-23 23:57:58.702008
58578	26	2024-11-20 16:00:00	2024-11-20 17:00:00	f	2024-10-23 23:57:58.705285	2024-10-23 23:57:58.705285
58579	26	2024-11-20 17:00:00	2024-11-20 18:00:00	f	2024-10-23 23:57:58.709842	2024-10-23 23:57:58.709842
58580	26	2024-11-20 18:00:00	2024-11-20 19:00:00	f	2024-10-23 23:57:58.712976	2024-10-23 23:57:58.712976
58581	26	2024-11-20 19:00:00	2024-11-20 20:00:00	f	2024-10-23 23:57:58.720131	2024-10-23 23:57:58.720131
58582	26	2024-11-20 20:00:00	2024-11-20 21:00:00	f	2024-10-23 23:57:58.730446	2024-10-23 23:57:58.730446
58583	26	2024-11-21 10:00:00	2024-11-21 11:00:00	f	2024-10-23 23:57:58.738689	2024-10-23 23:57:58.738689
58584	26	2024-11-21 11:00:00	2024-11-21 12:00:00	f	2024-10-23 23:57:58.744591	2024-10-23 23:57:58.744591
58585	26	2024-11-21 12:00:00	2024-11-21 13:00:00	f	2024-10-23 23:57:58.751477	2024-10-23 23:57:58.751477
58586	26	2024-11-21 13:00:00	2024-11-21 14:00:00	f	2024-10-23 23:57:58.759389	2024-10-23 23:57:58.759389
58587	26	2024-11-21 14:00:00	2024-11-21 15:00:00	f	2024-10-23 23:57:58.765755	2024-10-23 23:57:58.765755
58588	26	2024-11-21 15:00:00	2024-11-21 16:00:00	f	2024-10-23 23:57:58.770757	2024-10-23 23:57:58.770757
58589	26	2024-11-21 16:00:00	2024-11-21 17:00:00	f	2024-10-23 23:57:58.776973	2024-10-23 23:57:58.776973
58590	26	2024-11-21 17:00:00	2024-11-21 18:00:00	f	2024-10-23 23:57:58.783378	2024-10-23 23:57:58.783378
58591	26	2024-11-21 18:00:00	2024-11-21 19:00:00	f	2024-10-23 23:57:58.791303	2024-10-23 23:57:58.791303
58592	26	2024-11-21 19:00:00	2024-11-21 20:00:00	f	2024-10-23 23:57:58.797103	2024-10-23 23:57:58.797103
58593	26	2024-11-21 20:00:00	2024-11-21 21:00:00	f	2024-10-23 23:57:58.804503	2024-10-23 23:57:58.804503
58594	26	2024-11-22 10:00:00	2024-11-22 11:00:00	f	2024-10-23 23:57:58.80997	2024-10-23 23:57:58.80997
58595	26	2024-11-22 11:00:00	2024-11-22 12:00:00	f	2024-10-23 23:57:58.816243	2024-10-23 23:57:58.816243
58596	26	2024-11-22 12:00:00	2024-11-22 13:00:00	f	2024-10-23 23:57:58.822139	2024-10-23 23:57:58.822139
58597	26	2024-11-22 13:00:00	2024-11-22 14:00:00	f	2024-10-23 23:57:58.828438	2024-10-23 23:57:58.828438
58598	26	2024-11-22 14:00:00	2024-11-22 15:00:00	f	2024-10-23 23:57:58.835005	2024-10-23 23:57:58.835005
58599	26	2024-11-22 15:00:00	2024-11-22 16:00:00	f	2024-10-23 23:57:58.841282	2024-10-23 23:57:58.841282
58600	26	2024-11-22 16:00:00	2024-11-22 17:00:00	f	2024-10-23 23:57:58.847723	2024-10-23 23:57:58.847723
58601	26	2024-11-22 17:00:00	2024-11-22 18:00:00	f	2024-10-23 23:57:58.852945	2024-10-23 23:57:58.852945
58602	26	2024-11-22 18:00:00	2024-11-22 19:00:00	f	2024-10-23 23:57:58.859868	2024-10-23 23:57:58.859868
58603	26	2024-11-22 19:00:00	2024-11-22 20:00:00	f	2024-10-23 23:57:58.864277	2024-10-23 23:57:58.864277
58604	26	2024-11-22 20:00:00	2024-11-22 21:00:00	f	2024-10-23 23:57:58.872551	2024-10-23 23:57:58.872551
58605	26	2024-11-23 10:00:00	2024-11-23 11:00:00	f	2024-10-23 23:57:58.877539	2024-10-23 23:57:58.877539
58606	26	2024-11-23 11:00:00	2024-11-23 12:00:00	f	2024-10-23 23:57:58.887393	2024-10-23 23:57:58.887393
58607	26	2024-11-23 12:00:00	2024-11-23 13:00:00	f	2024-10-23 23:57:58.895845	2024-10-23 23:57:58.895845
58608	26	2024-11-23 13:00:00	2024-11-23 14:00:00	f	2024-10-23 23:57:58.901339	2024-10-23 23:57:58.901339
58609	26	2024-11-23 14:00:00	2024-11-23 15:00:00	f	2024-10-23 23:57:58.909265	2024-10-23 23:57:58.909265
58610	26	2024-11-23 15:00:00	2024-11-23 16:00:00	f	2024-10-23 23:57:58.915536	2024-10-23 23:57:58.915536
58611	26	2024-11-23 16:00:00	2024-11-23 17:00:00	f	2024-10-23 23:57:58.919108	2024-10-23 23:57:58.919108
58612	26	2024-11-23 17:00:00	2024-11-23 18:00:00	f	2024-10-23 23:57:58.925354	2024-10-23 23:57:58.925354
58613	26	2024-11-23 18:00:00	2024-11-23 19:00:00	f	2024-10-23 23:57:58.931734	2024-10-23 23:57:58.931734
58614	26	2024-11-23 19:00:00	2024-11-23 20:00:00	f	2024-10-23 23:57:58.938697	2024-10-23 23:57:58.938697
58615	26	2024-11-23 20:00:00	2024-11-23 21:00:00	f	2024-10-23 23:57:58.945801	2024-10-23 23:57:58.945801
58616	26	2024-11-25 10:00:00	2024-11-25 11:00:00	f	2024-10-23 23:57:58.953216	2024-10-23 23:57:58.953216
58617	26	2024-11-25 11:00:00	2024-11-25 12:00:00	f	2024-10-23 23:57:58.959268	2024-10-23 23:57:58.959268
58618	26	2024-11-25 12:00:00	2024-11-25 13:00:00	f	2024-10-23 23:57:58.967594	2024-10-23 23:57:58.967594
58619	26	2024-11-25 13:00:00	2024-11-25 14:00:00	f	2024-10-23 23:57:58.974294	2024-10-23 23:57:58.974294
58620	26	2024-11-25 14:00:00	2024-11-25 15:00:00	f	2024-10-23 23:57:58.981364	2024-10-23 23:57:58.981364
58621	26	2024-11-25 15:00:00	2024-11-25 16:00:00	f	2024-10-23 23:57:58.987652	2024-10-23 23:57:58.987652
58622	26	2024-11-25 16:00:00	2024-11-25 17:00:00	f	2024-10-23 23:57:58.994293	2024-10-23 23:57:58.994293
58623	26	2024-11-25 17:00:00	2024-11-25 18:00:00	f	2024-10-23 23:57:59.007397	2024-10-23 23:57:59.007397
58624	26	2024-11-25 18:00:00	2024-11-25 19:00:00	f	2024-10-23 23:57:59.014304	2024-10-23 23:57:59.014304
58625	26	2024-11-25 19:00:00	2024-11-25 20:00:00	f	2024-10-23 23:57:59.019789	2024-10-23 23:57:59.019789
58626	26	2024-11-25 20:00:00	2024-11-25 21:00:00	f	2024-10-23 23:57:59.027065	2024-10-23 23:57:59.027065
58627	26	2024-11-26 10:00:00	2024-11-26 11:00:00	f	2024-10-23 23:57:59.036308	2024-10-23 23:57:59.036308
58628	26	2024-11-26 11:00:00	2024-11-26 12:00:00	f	2024-10-23 23:57:59.042295	2024-10-23 23:57:59.042295
58629	26	2024-11-26 12:00:00	2024-11-26 13:00:00	f	2024-10-23 23:57:59.04928	2024-10-23 23:57:59.04928
58630	26	2024-11-26 13:00:00	2024-11-26 14:00:00	f	2024-10-23 23:57:59.055624	2024-10-23 23:57:59.055624
58631	26	2024-11-26 14:00:00	2024-11-26 15:00:00	f	2024-10-23 23:57:59.061317	2024-10-23 23:57:59.061317
58632	26	2024-11-26 15:00:00	2024-11-26 16:00:00	f	2024-10-23 23:57:59.068211	2024-10-23 23:57:59.068211
58633	26	2024-11-26 16:00:00	2024-11-26 17:00:00	f	2024-10-23 23:57:59.075085	2024-10-23 23:57:59.075085
58634	26	2024-11-26 17:00:00	2024-11-26 18:00:00	f	2024-10-23 23:57:59.082325	2024-10-23 23:57:59.082325
58635	26	2024-11-26 18:00:00	2024-11-26 19:00:00	f	2024-10-23 23:57:59.089859	2024-10-23 23:57:59.089859
58636	26	2024-11-26 19:00:00	2024-11-26 20:00:00	f	2024-10-23 23:57:59.096655	2024-10-23 23:57:59.096655
58637	26	2024-11-26 20:00:00	2024-11-26 21:00:00	f	2024-10-23 23:57:59.103087	2024-10-23 23:57:59.103087
58638	26	2024-11-27 10:00:00	2024-11-27 11:00:00	f	2024-10-23 23:57:59.110166	2024-10-23 23:57:59.110166
58639	26	2024-11-27 11:00:00	2024-11-27 12:00:00	f	2024-10-23 23:57:59.116871	2024-10-23 23:57:59.116871
58640	26	2024-11-27 12:00:00	2024-11-27 13:00:00	f	2024-10-23 23:57:59.124052	2024-10-23 23:57:59.124052
58641	26	2024-11-27 13:00:00	2024-11-27 14:00:00	f	2024-10-23 23:57:59.131478	2024-10-23 23:57:59.131478
58642	26	2024-11-27 14:00:00	2024-11-27 15:00:00	f	2024-10-23 23:57:59.138398	2024-10-23 23:57:59.138398
58643	26	2024-11-27 15:00:00	2024-11-27 16:00:00	f	2024-10-23 23:57:59.143993	2024-10-23 23:57:59.143993
58644	26	2024-11-27 16:00:00	2024-11-27 17:00:00	f	2024-10-23 23:57:59.152469	2024-10-23 23:57:59.152469
58645	26	2024-11-27 17:00:00	2024-11-27 18:00:00	f	2024-10-23 23:57:59.159461	2024-10-23 23:57:59.159461
58646	26	2024-11-27 18:00:00	2024-11-27 19:00:00	f	2024-10-23 23:57:59.166756	2024-10-23 23:57:59.166756
58647	26	2024-11-27 19:00:00	2024-11-27 20:00:00	f	2024-10-23 23:57:59.174391	2024-10-23 23:57:59.174391
58648	26	2024-11-27 20:00:00	2024-11-27 21:00:00	f	2024-10-23 23:57:59.178688	2024-10-23 23:57:59.178688
58649	26	2024-11-28 10:00:00	2024-11-28 11:00:00	f	2024-10-23 23:57:59.182501	2024-10-23 23:57:59.182501
58650	26	2024-11-28 11:00:00	2024-11-28 12:00:00	f	2024-10-23 23:57:59.186442	2024-10-23 23:57:59.186442
58651	26	2024-11-28 12:00:00	2024-11-28 13:00:00	f	2024-10-23 23:57:59.189684	2024-10-23 23:57:59.189684
58652	26	2024-11-28 13:00:00	2024-11-28 14:00:00	f	2024-10-23 23:57:59.19268	2024-10-23 23:57:59.19268
58653	26	2024-11-28 14:00:00	2024-11-28 15:00:00	f	2024-10-23 23:57:59.195535	2024-10-23 23:57:59.195535
58654	26	2024-11-28 15:00:00	2024-11-28 16:00:00	f	2024-10-23 23:57:59.198243	2024-10-23 23:57:59.198243
58655	26	2024-11-28 16:00:00	2024-11-28 17:00:00	f	2024-10-23 23:57:59.201511	2024-10-23 23:57:59.201511
58656	26	2024-11-28 17:00:00	2024-11-28 18:00:00	f	2024-10-23 23:57:59.204261	2024-10-23 23:57:59.204261
58657	26	2024-11-28 18:00:00	2024-11-28 19:00:00	f	2024-10-23 23:57:59.208419	2024-10-23 23:57:59.208419
58658	26	2024-11-28 19:00:00	2024-11-28 20:00:00	f	2024-10-23 23:57:59.211247	2024-10-23 23:57:59.211247
58659	26	2024-11-28 20:00:00	2024-11-28 21:00:00	f	2024-10-23 23:57:59.215056	2024-10-23 23:57:59.215056
58660	26	2024-11-29 10:00:00	2024-11-29 11:00:00	f	2024-10-23 23:57:59.218135	2024-10-23 23:57:59.218135
58661	26	2024-11-29 11:00:00	2024-11-29 12:00:00	f	2024-10-23 23:57:59.221911	2024-10-23 23:57:59.221911
58662	26	2024-11-29 12:00:00	2024-11-29 13:00:00	f	2024-10-23 23:57:59.224184	2024-10-23 23:57:59.224184
58663	26	2024-11-29 13:00:00	2024-11-29 14:00:00	f	2024-10-23 23:57:59.226679	2024-10-23 23:57:59.226679
58664	26	2024-11-29 14:00:00	2024-11-29 15:00:00	f	2024-10-23 23:57:59.230026	2024-10-23 23:57:59.230026
58665	26	2024-11-29 15:00:00	2024-11-29 16:00:00	f	2024-10-23 23:57:59.233632	2024-10-23 23:57:59.233632
58666	26	2024-11-29 16:00:00	2024-11-29 17:00:00	f	2024-10-23 23:57:59.237491	2024-10-23 23:57:59.237491
58667	26	2024-11-29 17:00:00	2024-11-29 18:00:00	f	2024-10-23 23:57:59.240768	2024-10-23 23:57:59.240768
58668	26	2024-11-29 18:00:00	2024-11-29 19:00:00	f	2024-10-23 23:57:59.244274	2024-10-23 23:57:59.244274
58669	26	2024-11-29 19:00:00	2024-11-29 20:00:00	f	2024-10-23 23:57:59.247127	2024-10-23 23:57:59.247127
58670	26	2024-11-29 20:00:00	2024-11-29 21:00:00	f	2024-10-23 23:57:59.249306	2024-10-23 23:57:59.249306
58671	26	2024-11-30 10:00:00	2024-11-30 11:00:00	f	2024-10-23 23:57:59.251474	2024-10-23 23:57:59.251474
58672	26	2024-11-30 11:00:00	2024-11-30 12:00:00	f	2024-10-23 23:57:59.254629	2024-10-23 23:57:59.254629
58673	26	2024-11-30 12:00:00	2024-11-30 13:00:00	f	2024-10-23 23:57:59.258105	2024-10-23 23:57:59.258105
58674	26	2024-11-30 13:00:00	2024-11-30 14:00:00	f	2024-10-23 23:57:59.26185	2024-10-23 23:57:59.26185
58675	26	2024-11-30 14:00:00	2024-11-30 15:00:00	f	2024-10-23 23:57:59.266122	2024-10-23 23:57:59.266122
58676	26	2024-11-30 15:00:00	2024-11-30 16:00:00	f	2024-10-23 23:57:59.269623	2024-10-23 23:57:59.269623
58677	26	2024-11-30 16:00:00	2024-11-30 17:00:00	f	2024-10-23 23:57:59.27267	2024-10-23 23:57:59.27267
58678	26	2024-11-30 17:00:00	2024-11-30 18:00:00	f	2024-10-23 23:57:59.276108	2024-10-23 23:57:59.276108
58679	26	2024-11-30 18:00:00	2024-11-30 19:00:00	f	2024-10-23 23:57:59.279816	2024-10-23 23:57:59.279816
58680	26	2024-11-30 19:00:00	2024-11-30 20:00:00	f	2024-10-23 23:57:59.283017	2024-10-23 23:57:59.283017
58681	26	2024-11-30 20:00:00	2024-11-30 21:00:00	f	2024-10-23 23:57:59.285972	2024-10-23 23:57:59.285972
58682	26	2024-12-02 10:00:00	2024-12-02 11:00:00	f	2024-10-23 23:57:59.28841	2024-10-23 23:57:59.28841
58683	26	2024-12-02 11:00:00	2024-12-02 12:00:00	f	2024-10-23 23:57:59.290838	2024-10-23 23:57:59.290838
58684	26	2024-12-02 12:00:00	2024-12-02 13:00:00	f	2024-10-23 23:57:59.294278	2024-10-23 23:57:59.294278
58685	26	2024-12-02 13:00:00	2024-12-02 14:00:00	f	2024-10-23 23:57:59.298262	2024-10-23 23:57:59.298262
58686	26	2024-12-02 14:00:00	2024-12-02 15:00:00	f	2024-10-23 23:57:59.300967	2024-10-23 23:57:59.300967
58687	26	2024-12-02 15:00:00	2024-12-02 16:00:00	f	2024-10-23 23:57:59.304451	2024-10-23 23:57:59.304451
58688	26	2024-12-02 16:00:00	2024-12-02 17:00:00	f	2024-10-23 23:57:59.307195	2024-10-23 23:57:59.307195
58689	26	2024-12-02 17:00:00	2024-12-02 18:00:00	f	2024-10-23 23:57:59.310173	2024-10-23 23:57:59.310173
58690	26	2024-12-02 18:00:00	2024-12-02 19:00:00	f	2024-10-23 23:57:59.312742	2024-10-23 23:57:59.312742
58691	26	2024-12-02 19:00:00	2024-12-02 20:00:00	f	2024-10-23 23:57:59.315853	2024-10-23 23:57:59.315853
58692	26	2024-12-02 20:00:00	2024-12-02 21:00:00	f	2024-10-23 23:57:59.31963	2024-10-23 23:57:59.31963
58693	26	2024-12-03 10:00:00	2024-12-03 11:00:00	f	2024-10-23 23:57:59.322186	2024-10-23 23:57:59.322186
58694	26	2024-12-03 11:00:00	2024-12-03 12:00:00	f	2024-10-23 23:57:59.32622	2024-10-23 23:57:59.32622
58695	26	2024-12-03 12:00:00	2024-12-03 13:00:00	f	2024-10-23 23:57:59.328943	2024-10-23 23:57:59.328943
58696	26	2024-12-03 13:00:00	2024-12-03 14:00:00	f	2024-10-23 23:57:59.333026	2024-10-23 23:57:59.333026
58697	26	2024-12-03 14:00:00	2024-12-03 15:00:00	f	2024-10-23 23:57:59.33587	2024-10-23 23:57:59.33587
58698	26	2024-12-03 15:00:00	2024-12-03 16:00:00	f	2024-10-23 23:57:59.338704	2024-10-23 23:57:59.338704
58699	26	2024-12-03 16:00:00	2024-12-03 17:00:00	f	2024-10-23 23:57:59.341696	2024-10-23 23:57:59.341696
58700	26	2024-12-03 17:00:00	2024-12-03 18:00:00	f	2024-10-23 23:57:59.34445	2024-10-23 23:57:59.34445
58701	26	2024-12-03 18:00:00	2024-12-03 19:00:00	f	2024-10-23 23:57:59.347226	2024-10-23 23:57:59.347226
58702	26	2024-12-03 19:00:00	2024-12-03 20:00:00	f	2024-10-23 23:57:59.350291	2024-10-23 23:57:59.350291
58703	26	2024-12-03 20:00:00	2024-12-03 21:00:00	f	2024-10-23 23:57:59.352973	2024-10-23 23:57:59.352973
58704	26	2024-12-04 10:00:00	2024-12-04 11:00:00	f	2024-10-23 23:57:59.355662	2024-10-23 23:57:59.355662
58705	26	2024-12-04 11:00:00	2024-12-04 12:00:00	f	2024-10-23 23:57:59.359618	2024-10-23 23:57:59.359618
58706	26	2024-12-04 12:00:00	2024-12-04 13:00:00	f	2024-10-23 23:57:59.362845	2024-10-23 23:57:59.362845
58707	26	2024-12-04 13:00:00	2024-12-04 14:00:00	f	2024-10-23 23:57:59.365619	2024-10-23 23:57:59.365619
58708	26	2024-12-04 14:00:00	2024-12-04 15:00:00	f	2024-10-23 23:57:59.368926	2024-10-23 23:57:59.368926
58709	26	2024-12-04 15:00:00	2024-12-04 16:00:00	f	2024-10-23 23:57:59.371732	2024-10-23 23:57:59.371732
58710	26	2024-12-04 16:00:00	2024-12-04 17:00:00	f	2024-10-23 23:57:59.37514	2024-10-23 23:57:59.37514
58711	26	2024-12-04 17:00:00	2024-12-04 18:00:00	f	2024-10-23 23:57:59.377251	2024-10-23 23:57:59.377251
58712	26	2024-12-04 18:00:00	2024-12-04 19:00:00	f	2024-10-23 23:57:59.380363	2024-10-23 23:57:59.380363
58713	26	2024-12-04 19:00:00	2024-12-04 20:00:00	f	2024-10-23 23:57:59.383106	2024-10-23 23:57:59.383106
58714	26	2024-12-04 20:00:00	2024-12-04 21:00:00	f	2024-10-23 23:57:59.386063	2024-10-23 23:57:59.386063
58715	26	2024-12-05 10:00:00	2024-12-05 11:00:00	f	2024-10-23 23:57:59.389507	2024-10-23 23:57:59.389507
58716	26	2024-12-05 11:00:00	2024-12-05 12:00:00	f	2024-10-23 23:57:59.393552	2024-10-23 23:57:59.393552
58717	26	2024-12-05 12:00:00	2024-12-05 13:00:00	f	2024-10-23 23:57:59.397664	2024-10-23 23:57:59.397664
58718	26	2024-12-05 13:00:00	2024-12-05 14:00:00	f	2024-10-23 23:57:59.400918	2024-10-23 23:57:59.400918
58719	26	2024-12-05 14:00:00	2024-12-05 15:00:00	f	2024-10-23 23:57:59.404224	2024-10-23 23:57:59.404224
58720	26	2024-12-05 15:00:00	2024-12-05 16:00:00	f	2024-10-23 23:57:59.407767	2024-10-23 23:57:59.407767
58721	26	2024-12-05 16:00:00	2024-12-05 17:00:00	f	2024-10-23 23:57:59.411021	2024-10-23 23:57:59.411021
58722	26	2024-12-05 17:00:00	2024-12-05 18:00:00	f	2024-10-23 23:57:59.418347	2024-10-23 23:57:59.418347
58723	26	2024-12-05 18:00:00	2024-12-05 19:00:00	f	2024-10-23 23:57:59.421709	2024-10-23 23:57:59.421709
58724	26	2024-12-05 19:00:00	2024-12-05 20:00:00	f	2024-10-23 23:57:59.425389	2024-10-23 23:57:59.425389
58725	26	2024-12-05 20:00:00	2024-12-05 21:00:00	f	2024-10-23 23:57:59.428169	2024-10-23 23:57:59.428169
58726	26	2024-12-06 10:00:00	2024-12-06 11:00:00	f	2024-10-23 23:57:59.430785	2024-10-23 23:57:59.430785
58727	26	2024-12-06 11:00:00	2024-12-06 12:00:00	f	2024-10-23 23:57:59.434605	2024-10-23 23:57:59.434605
58728	26	2024-12-06 12:00:00	2024-12-06 13:00:00	f	2024-10-23 23:57:59.436933	2024-10-23 23:57:59.436933
58729	26	2024-12-06 13:00:00	2024-12-06 14:00:00	f	2024-10-23 23:57:59.440528	2024-10-23 23:57:59.440528
58730	26	2024-12-06 14:00:00	2024-12-06 15:00:00	f	2024-10-23 23:57:59.443449	2024-10-23 23:57:59.443449
58731	26	2024-12-06 15:00:00	2024-12-06 16:00:00	f	2024-10-23 23:57:59.446774	2024-10-23 23:57:59.446774
58732	26	2024-12-06 16:00:00	2024-12-06 17:00:00	f	2024-10-23 23:57:59.451132	2024-10-23 23:57:59.451132
58733	26	2024-12-06 17:00:00	2024-12-06 18:00:00	f	2024-10-23 23:57:59.453944	2024-10-23 23:57:59.453944
58734	26	2024-12-06 18:00:00	2024-12-06 19:00:00	f	2024-10-23 23:57:59.458834	2024-10-23 23:57:59.458834
58735	26	2024-12-06 19:00:00	2024-12-06 20:00:00	f	2024-10-23 23:57:59.461155	2024-10-23 23:57:59.461155
58736	26	2024-12-06 20:00:00	2024-12-06 21:00:00	f	2024-10-23 23:57:59.464848	2024-10-23 23:57:59.464848
58737	26	2024-12-07 10:00:00	2024-12-07 11:00:00	f	2024-10-23 23:57:59.467866	2024-10-23 23:57:59.467866
58738	26	2024-12-07 11:00:00	2024-12-07 12:00:00	f	2024-10-23 23:57:59.471764	2024-10-23 23:57:59.471764
58739	26	2024-12-07 12:00:00	2024-12-07 13:00:00	f	2024-10-23 23:57:59.474305	2024-10-23 23:57:59.474305
58740	26	2024-12-07 13:00:00	2024-12-07 14:00:00	f	2024-10-23 23:57:59.477112	2024-10-23 23:57:59.477112
58741	26	2024-12-07 14:00:00	2024-12-07 15:00:00	f	2024-10-23 23:57:59.480692	2024-10-23 23:57:59.480692
58742	26	2024-12-07 15:00:00	2024-12-07 16:00:00	f	2024-10-23 23:57:59.483591	2024-10-23 23:57:59.483591
58743	26	2024-12-07 16:00:00	2024-12-07 17:00:00	f	2024-10-23 23:57:59.487346	2024-10-23 23:57:59.487346
58744	26	2024-12-07 17:00:00	2024-12-07 18:00:00	f	2024-10-23 23:57:59.491051	2024-10-23 23:57:59.491051
58745	26	2024-12-07 18:00:00	2024-12-07 19:00:00	f	2024-10-23 23:57:59.494465	2024-10-23 23:57:59.494465
58746	26	2024-12-07 19:00:00	2024-12-07 20:00:00	f	2024-10-23 23:57:59.498988	2024-10-23 23:57:59.498988
58747	26	2024-12-07 20:00:00	2024-12-07 21:00:00	f	2024-10-23 23:57:59.502108	2024-10-23 23:57:59.502108
58748	26	2024-12-09 10:00:00	2024-12-09 11:00:00	f	2024-10-23 23:57:59.50604	2024-10-23 23:57:59.50604
58749	26	2024-12-09 11:00:00	2024-12-09 12:00:00	f	2024-10-23 23:57:59.508956	2024-10-23 23:57:59.508956
58750	26	2024-12-09 12:00:00	2024-12-09 13:00:00	f	2024-10-23 23:57:59.5122	2024-10-23 23:57:59.5122
58751	26	2024-12-09 13:00:00	2024-12-09 14:00:00	f	2024-10-23 23:57:59.515974	2024-10-23 23:57:59.515974
58752	26	2024-12-09 14:00:00	2024-12-09 15:00:00	f	2024-10-23 23:57:59.51935	2024-10-23 23:57:59.51935
58753	26	2024-12-09 15:00:00	2024-12-09 16:00:00	f	2024-10-23 23:57:59.522771	2024-10-23 23:57:59.522771
58754	26	2024-12-09 16:00:00	2024-12-09 17:00:00	f	2024-10-23 23:57:59.525698	2024-10-23 23:57:59.525698
58755	26	2024-12-09 17:00:00	2024-12-09 18:00:00	f	2024-10-23 23:57:59.528835	2024-10-23 23:57:59.528835
58756	26	2024-12-09 18:00:00	2024-12-09 19:00:00	f	2024-10-23 23:57:59.532382	2024-10-23 23:57:59.532382
58757	26	2024-12-09 19:00:00	2024-12-09 20:00:00	f	2024-10-23 23:57:59.535238	2024-10-23 23:57:59.535238
58758	26	2024-12-09 20:00:00	2024-12-09 21:00:00	f	2024-10-23 23:57:59.539177	2024-10-23 23:57:59.539177
58759	26	2024-12-10 10:00:00	2024-12-10 11:00:00	f	2024-10-23 23:57:59.542499	2024-10-23 23:57:59.542499
58760	26	2024-12-10 11:00:00	2024-12-10 12:00:00	f	2024-10-23 23:57:59.546368	2024-10-23 23:57:59.546368
58761	26	2024-12-10 12:00:00	2024-12-10 13:00:00	f	2024-10-23 23:57:59.550178	2024-10-23 23:57:59.550178
58762	26	2024-12-10 13:00:00	2024-12-10 14:00:00	f	2024-10-23 23:57:59.55351	2024-10-23 23:57:59.55351
58763	26	2024-12-10 14:00:00	2024-12-10 15:00:00	f	2024-10-23 23:57:59.556795	2024-10-23 23:57:59.556795
58764	26	2024-12-10 15:00:00	2024-12-10 16:00:00	f	2024-10-23 23:57:59.559526	2024-10-23 23:57:59.559526
58765	26	2024-12-10 16:00:00	2024-12-10 17:00:00	f	2024-10-23 23:57:59.562058	2024-10-23 23:57:59.562058
58766	26	2024-12-10 17:00:00	2024-12-10 18:00:00	f	2024-10-23 23:57:59.565595	2024-10-23 23:57:59.565595
58767	26	2024-12-10 18:00:00	2024-12-10 19:00:00	f	2024-10-23 23:57:59.568506	2024-10-23 23:57:59.568506
58768	26	2024-12-10 19:00:00	2024-12-10 20:00:00	f	2024-10-23 23:57:59.571939	2024-10-23 23:57:59.571939
58769	26	2024-12-10 20:00:00	2024-12-10 21:00:00	f	2024-10-23 23:57:59.576918	2024-10-23 23:57:59.576918
58770	26	2024-12-11 10:00:00	2024-12-11 11:00:00	f	2024-10-23 23:57:59.579547	2024-10-23 23:57:59.579547
58771	26	2024-12-11 11:00:00	2024-12-11 12:00:00	f	2024-10-23 23:57:59.58347	2024-10-23 23:57:59.58347
58772	26	2024-12-11 12:00:00	2024-12-11 13:00:00	f	2024-10-23 23:57:59.585858	2024-10-23 23:57:59.585858
58773	26	2024-12-11 13:00:00	2024-12-11 14:00:00	f	2024-10-23 23:57:59.589435	2024-10-23 23:57:59.589435
58774	26	2024-12-11 14:00:00	2024-12-11 15:00:00	f	2024-10-23 23:57:59.592072	2024-10-23 23:57:59.592072
58775	26	2024-12-11 15:00:00	2024-12-11 16:00:00	f	2024-10-23 23:57:59.594665	2024-10-23 23:57:59.594665
58776	26	2024-12-11 16:00:00	2024-12-11 17:00:00	f	2024-10-23 23:57:59.597759	2024-10-23 23:57:59.597759
58777	26	2024-12-11 17:00:00	2024-12-11 18:00:00	f	2024-10-23 23:57:59.59973	2024-10-23 23:57:59.59973
58778	26	2024-12-11 18:00:00	2024-12-11 19:00:00	f	2024-10-23 23:57:59.602746	2024-10-23 23:57:59.602746
58779	26	2024-12-11 19:00:00	2024-12-11 20:00:00	f	2024-10-23 23:57:59.605499	2024-10-23 23:57:59.605499
58780	26	2024-12-11 20:00:00	2024-12-11 21:00:00	f	2024-10-23 23:57:59.609524	2024-10-23 23:57:59.609524
58781	26	2024-12-12 10:00:00	2024-12-12 11:00:00	f	2024-10-23 23:57:59.613267	2024-10-23 23:57:59.613267
58782	26	2024-12-12 11:00:00	2024-12-12 12:00:00	f	2024-10-23 23:57:59.617753	2024-10-23 23:57:59.617753
58783	26	2024-12-12 12:00:00	2024-12-12 13:00:00	f	2024-10-23 23:57:59.620993	2024-10-23 23:57:59.620993
58784	26	2024-12-12 13:00:00	2024-12-12 14:00:00	f	2024-10-23 23:57:59.624892	2024-10-23 23:57:59.624892
58785	26	2024-12-12 14:00:00	2024-12-12 15:00:00	f	2024-10-23 23:57:59.627494	2024-10-23 23:57:59.627494
58786	26	2024-12-12 15:00:00	2024-12-12 16:00:00	f	2024-10-23 23:57:59.630485	2024-10-23 23:57:59.630485
58787	26	2024-12-12 16:00:00	2024-12-12 17:00:00	f	2024-10-23 23:57:59.633349	2024-10-23 23:57:59.633349
58788	26	2024-12-12 17:00:00	2024-12-12 18:00:00	f	2024-10-23 23:57:59.636227	2024-10-23 23:57:59.636227
58789	26	2024-12-12 18:00:00	2024-12-12 19:00:00	f	2024-10-23 23:57:59.639726	2024-10-23 23:57:59.639726
58790	26	2024-12-12 19:00:00	2024-12-12 20:00:00	f	2024-10-23 23:57:59.642864	2024-10-23 23:57:59.642864
58791	26	2024-12-12 20:00:00	2024-12-12 21:00:00	f	2024-10-23 23:57:59.646744	2024-10-23 23:57:59.646744
58792	26	2024-12-13 10:00:00	2024-12-13 11:00:00	f	2024-10-23 23:57:59.649937	2024-10-23 23:57:59.649937
58793	26	2024-12-13 11:00:00	2024-12-13 12:00:00	f	2024-10-23 23:57:59.653051	2024-10-23 23:57:59.653051
58794	26	2024-12-13 12:00:00	2024-12-13 13:00:00	f	2024-10-23 23:57:59.656923	2024-10-23 23:57:59.656923
58795	26	2024-12-13 13:00:00	2024-12-13 14:00:00	f	2024-10-23 23:57:59.660427	2024-10-23 23:57:59.660427
58796	26	2024-12-13 14:00:00	2024-12-13 15:00:00	f	2024-10-23 23:57:59.662703	2024-10-23 23:57:59.662703
58797	26	2024-12-13 15:00:00	2024-12-13 16:00:00	f	2024-10-23 23:57:59.666317	2024-10-23 23:57:59.666317
58798	26	2024-12-13 16:00:00	2024-12-13 17:00:00	f	2024-10-23 23:57:59.668561	2024-10-23 23:57:59.668561
58799	26	2024-12-13 17:00:00	2024-12-13 18:00:00	f	2024-10-23 23:57:59.671877	2024-10-23 23:57:59.671877
58800	26	2024-12-13 18:00:00	2024-12-13 19:00:00	f	2024-10-23 23:57:59.674871	2024-10-23 23:57:59.674871
58801	26	2024-12-13 19:00:00	2024-12-13 20:00:00	f	2024-10-23 23:57:59.677567	2024-10-23 23:57:59.677567
58802	26	2024-12-13 20:00:00	2024-12-13 21:00:00	f	2024-10-23 23:57:59.681033	2024-10-23 23:57:59.681033
58803	26	2024-12-14 10:00:00	2024-12-14 11:00:00	f	2024-10-23 23:57:59.683461	2024-10-23 23:57:59.683461
58804	26	2024-12-14 11:00:00	2024-12-14 12:00:00	f	2024-10-23 23:57:59.686267	2024-10-23 23:57:59.686267
58805	26	2024-12-14 12:00:00	2024-12-14 13:00:00	f	2024-10-23 23:57:59.689108	2024-10-23 23:57:59.689108
58806	26	2024-12-14 13:00:00	2024-12-14 14:00:00	f	2024-10-23 23:57:59.691695	2024-10-23 23:57:59.691695
58807	26	2024-12-14 14:00:00	2024-12-14 15:00:00	f	2024-10-23 23:57:59.694525	2024-10-23 23:57:59.694525
58808	26	2024-12-14 15:00:00	2024-12-14 16:00:00	f	2024-10-23 23:57:59.696527	2024-10-23 23:57:59.696527
58809	26	2024-12-14 16:00:00	2024-12-14 17:00:00	f	2024-10-23 23:57:59.699049	2024-10-23 23:57:59.699049
58810	26	2024-12-14 17:00:00	2024-12-14 18:00:00	f	2024-10-23 23:57:59.702157	2024-10-23 23:57:59.702157
58811	26	2024-12-14 18:00:00	2024-12-14 19:00:00	f	2024-10-23 23:57:59.705343	2024-10-23 23:57:59.705343
58812	26	2024-12-14 19:00:00	2024-12-14 20:00:00	f	2024-10-23 23:57:59.709844	2024-10-23 23:57:59.709844
58813	26	2024-12-14 20:00:00	2024-12-14 21:00:00	f	2024-10-23 23:57:59.713108	2024-10-23 23:57:59.713108
58814	26	2024-12-16 10:00:00	2024-12-16 11:00:00	f	2024-10-23 23:57:59.71777	2024-10-23 23:57:59.71777
58815	26	2024-12-16 11:00:00	2024-12-16 12:00:00	f	2024-10-23 23:57:59.721122	2024-10-23 23:57:59.721122
58816	26	2024-12-16 12:00:00	2024-12-16 13:00:00	f	2024-10-23 23:57:59.724665	2024-10-23 23:57:59.724665
58817	26	2024-12-16 13:00:00	2024-12-16 14:00:00	f	2024-10-23 23:57:59.727729	2024-10-23 23:57:59.727729
58818	26	2024-12-16 14:00:00	2024-12-16 15:00:00	f	2024-10-23 23:57:59.731245	2024-10-23 23:57:59.731245
58819	26	2024-12-16 15:00:00	2024-12-16 16:00:00	f	2024-10-23 23:57:59.734635	2024-10-23 23:57:59.734635
58820	26	2024-12-16 16:00:00	2024-12-16 17:00:00	f	2024-10-23 23:57:59.741359	2024-10-23 23:57:59.741359
58821	26	2024-12-16 17:00:00	2024-12-16 18:00:00	f	2024-10-23 23:57:59.745249	2024-10-23 23:57:59.745249
58822	26	2024-12-16 18:00:00	2024-12-16 19:00:00	f	2024-10-23 23:57:59.748672	2024-10-23 23:57:59.748672
58823	26	2024-12-16 19:00:00	2024-12-16 20:00:00	f	2024-10-23 23:57:59.751795	2024-10-23 23:57:59.751795
58824	26	2024-12-16 20:00:00	2024-12-16 21:00:00	f	2024-10-23 23:57:59.754659	2024-10-23 23:57:59.754659
58825	26	2024-12-17 10:00:00	2024-12-17 11:00:00	f	2024-10-23 23:57:59.757154	2024-10-23 23:57:59.757154
58826	26	2024-12-17 11:00:00	2024-12-17 12:00:00	f	2024-10-23 23:57:59.760473	2024-10-23 23:57:59.760473
58827	26	2024-12-17 12:00:00	2024-12-17 13:00:00	f	2024-10-23 23:57:59.763135	2024-10-23 23:57:59.763135
58828	26	2024-12-17 13:00:00	2024-12-17 14:00:00	f	2024-10-23 23:57:59.765938	2024-10-23 23:57:59.765938
58829	26	2024-12-17 14:00:00	2024-12-17 15:00:00	f	2024-10-23 23:57:59.769522	2024-10-23 23:57:59.769522
58830	26	2024-12-17 15:00:00	2024-12-17 16:00:00	f	2024-10-23 23:57:59.772978	2024-10-23 23:57:59.772978
58831	26	2024-12-17 16:00:00	2024-12-17 17:00:00	f	2024-10-23 23:57:59.776194	2024-10-23 23:57:59.776194
58832	26	2024-12-17 17:00:00	2024-12-17 18:00:00	f	2024-10-23 23:57:59.779514	2024-10-23 23:57:59.779514
58833	26	2024-12-17 18:00:00	2024-12-17 19:00:00	f	2024-10-23 23:57:59.782394	2024-10-23 23:57:59.782394
58834	26	2024-12-17 19:00:00	2024-12-17 20:00:00	f	2024-10-23 23:57:59.78549	2024-10-23 23:57:59.78549
58835	26	2024-12-17 20:00:00	2024-12-17 21:00:00	f	2024-10-23 23:57:59.78748	2024-10-23 23:57:59.78748
58836	26	2024-12-18 10:00:00	2024-12-18 11:00:00	f	2024-10-23 23:57:59.790833	2024-10-23 23:57:59.790833
58837	26	2024-12-18 11:00:00	2024-12-18 12:00:00	f	2024-10-23 23:57:59.793241	2024-10-23 23:57:59.793241
58838	26	2024-12-18 12:00:00	2024-12-18 13:00:00	f	2024-10-23 23:57:59.79595	2024-10-23 23:57:59.79595
58839	26	2024-12-18 13:00:00	2024-12-18 14:00:00	f	2024-10-23 23:57:59.79985	2024-10-23 23:57:59.79985
58840	26	2024-12-18 14:00:00	2024-12-18 15:00:00	f	2024-10-23 23:57:59.802809	2024-10-23 23:57:59.802809
58841	26	2024-12-18 15:00:00	2024-12-18 16:00:00	f	2024-10-23 23:57:59.805562	2024-10-23 23:57:59.805562
58842	26	2024-12-18 16:00:00	2024-12-18 17:00:00	f	2024-10-23 23:57:59.808697	2024-10-23 23:57:59.808697
58843	26	2024-12-18 17:00:00	2024-12-18 18:00:00	f	2024-10-23 23:57:59.811486	2024-10-23 23:57:59.811486
58844	26	2024-12-18 18:00:00	2024-12-18 19:00:00	f	2024-10-23 23:57:59.814358	2024-10-23 23:57:59.814358
58845	26	2024-12-18 19:00:00	2024-12-18 20:00:00	f	2024-10-23 23:57:59.816713	2024-10-23 23:57:59.816713
58846	26	2024-12-18 20:00:00	2024-12-18 21:00:00	f	2024-10-23 23:57:59.820224	2024-10-23 23:57:59.820224
58847	26	2024-12-19 10:00:00	2024-12-19 11:00:00	f	2024-10-23 23:57:59.822623	2024-10-23 23:57:59.822623
58848	26	2024-12-19 11:00:00	2024-12-19 12:00:00	f	2024-10-23 23:57:59.825688	2024-10-23 23:57:59.825688
58849	26	2024-12-19 12:00:00	2024-12-19 13:00:00	f	2024-10-23 23:57:59.828726	2024-10-23 23:57:59.828726
58850	26	2024-12-19 13:00:00	2024-12-19 14:00:00	f	2024-10-23 23:57:59.832872	2024-10-23 23:57:59.832872
58851	26	2024-12-19 14:00:00	2024-12-19 15:00:00	f	2024-10-23 23:57:59.835452	2024-10-23 23:57:59.835452
58852	26	2024-12-19 15:00:00	2024-12-19 16:00:00	f	2024-10-23 23:57:59.838021	2024-10-23 23:57:59.838021
58853	26	2024-12-19 16:00:00	2024-12-19 17:00:00	f	2024-10-23 23:57:59.840666	2024-10-23 23:57:59.840666
58854	26	2024-12-19 17:00:00	2024-12-19 18:00:00	f	2024-10-23 23:57:59.843558	2024-10-23 23:57:59.843558
58855	26	2024-12-19 18:00:00	2024-12-19 19:00:00	f	2024-10-23 23:57:59.845978	2024-10-23 23:57:59.845978
58856	26	2024-12-19 19:00:00	2024-12-19 20:00:00	f	2024-10-23 23:57:59.848881	2024-10-23 23:57:59.848881
58857	26	2024-12-19 20:00:00	2024-12-19 21:00:00	f	2024-10-23 23:57:59.852368	2024-10-23 23:57:59.852368
58858	26	2024-12-20 10:00:00	2024-12-20 11:00:00	f	2024-10-23 23:57:59.85545	2024-10-23 23:57:59.85545
58859	26	2024-12-20 11:00:00	2024-12-20 12:00:00	f	2024-10-23 23:57:59.858804	2024-10-23 23:57:59.858804
58860	26	2024-12-20 12:00:00	2024-12-20 13:00:00	f	2024-10-23 23:57:59.862299	2024-10-23 23:57:59.862299
58861	26	2024-12-20 13:00:00	2024-12-20 14:00:00	f	2024-10-23 23:57:59.864467	2024-10-23 23:57:59.864467
58862	26	2024-12-20 14:00:00	2024-12-20 15:00:00	f	2024-10-23 23:57:59.868198	2024-10-23 23:57:59.868198
58863	26	2024-12-20 15:00:00	2024-12-20 16:00:00	f	2024-10-23 23:57:59.870571	2024-10-23 23:57:59.870571
58864	26	2024-12-20 16:00:00	2024-12-20 17:00:00	f	2024-10-23 23:57:59.874144	2024-10-23 23:57:59.874144
58865	26	2024-12-20 17:00:00	2024-12-20 18:00:00	f	2024-10-23 23:57:59.87667	2024-10-23 23:57:59.87667
58866	26	2024-12-20 18:00:00	2024-12-20 19:00:00	f	2024-10-23 23:57:59.879226	2024-10-23 23:57:59.879226
58867	26	2024-12-20 19:00:00	2024-12-20 20:00:00	f	2024-10-23 23:57:59.882147	2024-10-23 23:57:59.882147
58868	26	2024-12-20 20:00:00	2024-12-20 21:00:00	f	2024-10-23 23:57:59.884628	2024-10-23 23:57:59.884628
58869	26	2024-12-21 10:00:00	2024-12-21 11:00:00	f	2024-10-23 23:57:59.887446	2024-10-23 23:57:59.887446
58870	26	2024-12-21 11:00:00	2024-12-21 12:00:00	f	2024-10-23 23:57:59.890439	2024-10-23 23:57:59.890439
58871	26	2024-12-21 12:00:00	2024-12-21 13:00:00	f	2024-10-23 23:57:59.894456	2024-10-23 23:57:59.894456
58872	26	2024-12-21 13:00:00	2024-12-21 14:00:00	f	2024-10-23 23:57:59.897866	2024-10-23 23:57:59.897866
58873	26	2024-12-21 14:00:00	2024-12-21 15:00:00	f	2024-10-23 23:57:59.901319	2024-10-23 23:57:59.901319
58874	26	2024-12-21 15:00:00	2024-12-21 16:00:00	f	2024-10-23 23:57:59.911605	2024-10-23 23:57:59.911605
58875	26	2024-12-21 16:00:00	2024-12-21 17:00:00	f	2024-10-23 23:57:59.91509	2024-10-23 23:57:59.91509
58876	26	2024-12-21 17:00:00	2024-12-21 18:00:00	f	2024-10-23 23:57:59.920485	2024-10-23 23:57:59.920485
58877	26	2024-12-21 18:00:00	2024-12-21 19:00:00	f	2024-10-23 23:57:59.925382	2024-10-23 23:57:59.925382
58878	26	2024-12-21 19:00:00	2024-12-21 20:00:00	f	2024-10-23 23:57:59.930828	2024-10-23 23:57:59.930828
58879	26	2024-12-21 20:00:00	2024-12-21 21:00:00	f	2024-10-23 23:57:59.936024	2024-10-23 23:57:59.936024
58880	26	2024-12-23 10:00:00	2024-12-23 11:00:00	f	2024-10-23 23:57:59.939279	2024-10-23 23:57:59.939279
58881	26	2024-12-23 11:00:00	2024-12-23 12:00:00	f	2024-10-23 23:57:59.944037	2024-10-23 23:57:59.944037
58882	26	2024-12-23 12:00:00	2024-12-23 13:00:00	f	2024-10-23 23:57:59.950483	2024-10-23 23:57:59.950483
58883	26	2024-12-23 13:00:00	2024-12-23 14:00:00	f	2024-10-23 23:57:59.954657	2024-10-23 23:57:59.954657
58884	26	2024-12-23 14:00:00	2024-12-23 15:00:00	f	2024-10-23 23:57:59.959483	2024-10-23 23:57:59.959483
58885	26	2024-12-23 15:00:00	2024-12-23 16:00:00	f	2024-10-23 23:57:59.964716	2024-10-23 23:57:59.964716
58886	26	2024-12-23 16:00:00	2024-12-23 17:00:00	f	2024-10-23 23:57:59.968154	2024-10-23 23:57:59.968154
58887	26	2024-12-23 17:00:00	2024-12-23 18:00:00	f	2024-10-23 23:57:59.973309	2024-10-23 23:57:59.973309
58888	26	2024-12-23 18:00:00	2024-12-23 19:00:00	f	2024-10-23 23:57:59.976537	2024-10-23 23:57:59.976537
58889	26	2024-12-23 19:00:00	2024-12-23 20:00:00	f	2024-10-23 23:57:59.979038	2024-10-23 23:57:59.979038
58890	26	2024-12-23 20:00:00	2024-12-23 21:00:00	f	2024-10-23 23:57:59.982847	2024-10-23 23:57:59.982847
58891	26	2024-12-24 10:00:00	2024-12-24 11:00:00	f	2024-10-23 23:57:59.987738	2024-10-23 23:57:59.987738
58892	26	2024-12-24 11:00:00	2024-12-24 12:00:00	f	2024-10-23 23:57:59.995079	2024-10-23 23:57:59.995079
58893	26	2024-12-24 12:00:00	2024-12-24 13:00:00	f	2024-10-23 23:58:00.001046	2024-10-23 23:58:00.001046
58894	26	2024-12-24 13:00:00	2024-12-24 14:00:00	f	2024-10-23 23:58:00.007208	2024-10-23 23:58:00.007208
58895	26	2024-12-24 14:00:00	2024-12-24 15:00:00	f	2024-10-23 23:58:00.01035	2024-10-23 23:58:00.01035
58896	26	2024-12-24 15:00:00	2024-12-24 16:00:00	f	2024-10-23 23:58:00.015315	2024-10-23 23:58:00.015315
58897	26	2024-12-24 16:00:00	2024-12-24 17:00:00	f	2024-10-23 23:58:00.01995	2024-10-23 23:58:00.01995
58898	26	2024-12-24 17:00:00	2024-12-24 18:00:00	f	2024-10-23 23:58:00.02399	2024-10-23 23:58:00.02399
58899	26	2024-12-24 18:00:00	2024-12-24 19:00:00	f	2024-10-23 23:58:00.028179	2024-10-23 23:58:00.028179
58900	26	2024-12-24 19:00:00	2024-12-24 20:00:00	f	2024-10-23 23:58:00.031061	2024-10-23 23:58:00.031061
58901	26	2024-12-24 20:00:00	2024-12-24 21:00:00	f	2024-10-23 23:58:00.033973	2024-10-23 23:58:00.033973
58902	26	2024-12-25 10:00:00	2024-12-25 11:00:00	f	2024-10-23 23:58:00.037274	2024-10-23 23:58:00.037274
58903	26	2024-12-25 11:00:00	2024-12-25 12:00:00	f	2024-10-23 23:58:00.04104	2024-10-23 23:58:00.04104
58904	26	2024-12-25 12:00:00	2024-12-25 13:00:00	f	2024-10-23 23:58:00.043459	2024-10-23 23:58:00.043459
58905	26	2024-12-25 13:00:00	2024-12-25 14:00:00	f	2024-10-23 23:58:00.04648	2024-10-23 23:58:00.04648
58906	26	2024-12-25 14:00:00	2024-12-25 15:00:00	f	2024-10-23 23:58:00.050047	2024-10-23 23:58:00.050047
58907	26	2024-12-25 15:00:00	2024-12-25 16:00:00	f	2024-10-23 23:58:00.054411	2024-10-23 23:58:00.054411
58908	26	2024-12-25 16:00:00	2024-12-25 17:00:00	f	2024-10-23 23:58:00.057637	2024-10-23 23:58:00.057637
58909	26	2024-12-25 17:00:00	2024-12-25 18:00:00	f	2024-10-23 23:58:00.0613	2024-10-23 23:58:00.0613
58910	26	2024-12-25 18:00:00	2024-12-25 19:00:00	f	2024-10-23 23:58:00.063742	2024-10-23 23:58:00.063742
58911	26	2024-12-25 19:00:00	2024-12-25 20:00:00	f	2024-10-23 23:58:00.066522	2024-10-23 23:58:00.066522
58912	26	2024-12-25 20:00:00	2024-12-25 21:00:00	f	2024-10-23 23:58:00.069893	2024-10-23 23:58:00.069893
58913	26	2024-12-26 10:00:00	2024-12-26 11:00:00	f	2024-10-23 23:58:00.072853	2024-10-23 23:58:00.072853
58914	26	2024-12-26 11:00:00	2024-12-26 12:00:00	f	2024-10-23 23:58:00.076975	2024-10-23 23:58:00.076975
58915	26	2024-12-26 12:00:00	2024-12-26 13:00:00	f	2024-10-23 23:58:00.079326	2024-10-23 23:58:00.079326
58916	26	2024-12-26 13:00:00	2024-12-26 14:00:00	f	2024-10-23 23:58:00.083466	2024-10-23 23:58:00.083466
58917	26	2024-12-26 14:00:00	2024-12-26 15:00:00	f	2024-10-23 23:58:00.086134	2024-10-23 23:58:00.086134
58918	26	2024-12-26 15:00:00	2024-12-26 16:00:00	f	2024-10-23 23:58:00.093696	2024-10-23 23:58:00.093696
58919	26	2024-12-26 16:00:00	2024-12-26 17:00:00	f	2024-10-23 23:58:00.097398	2024-10-23 23:58:00.097398
58920	26	2024-12-26 17:00:00	2024-12-26 18:00:00	f	2024-10-23 23:58:00.099554	2024-10-23 23:58:00.099554
58921	26	2024-12-26 18:00:00	2024-12-26 19:00:00	f	2024-10-23 23:58:00.102977	2024-10-23 23:58:00.102977
58922	26	2024-12-26 19:00:00	2024-12-26 20:00:00	f	2024-10-23 23:58:00.105816	2024-10-23 23:58:00.105816
58923	26	2024-12-26 20:00:00	2024-12-26 21:00:00	f	2024-10-23 23:58:00.109782	2024-10-23 23:58:00.109782
58924	26	2024-12-27 10:00:00	2024-12-27 11:00:00	f	2024-10-23 23:58:00.112513	2024-10-23 23:58:00.112513
58925	26	2024-12-27 11:00:00	2024-12-27 12:00:00	f	2024-10-23 23:58:00.115939	2024-10-23 23:58:00.115939
58926	26	2024-12-27 12:00:00	2024-12-27 13:00:00	f	2024-10-23 23:58:00.119561	2024-10-23 23:58:00.119561
58927	26	2024-12-27 13:00:00	2024-12-27 14:00:00	f	2024-10-23 23:58:00.123776	2024-10-23 23:58:00.123776
58928	26	2024-12-27 14:00:00	2024-12-27 15:00:00	f	2024-10-23 23:58:00.126163	2024-10-23 23:58:00.126163
58929	26	2024-12-27 15:00:00	2024-12-27 16:00:00	f	2024-10-23 23:58:00.129276	2024-10-23 23:58:00.129276
58930	26	2024-12-27 16:00:00	2024-12-27 17:00:00	f	2024-10-23 23:58:00.132587	2024-10-23 23:58:00.132587
58931	26	2024-12-27 17:00:00	2024-12-27 18:00:00	f	2024-10-23 23:58:00.134602	2024-10-23 23:58:00.134602
58932	26	2024-12-27 18:00:00	2024-12-27 19:00:00	f	2024-10-23 23:58:00.138671	2024-10-23 23:58:00.138671
58933	26	2024-12-27 19:00:00	2024-12-27 20:00:00	f	2024-10-23 23:58:00.142084	2024-10-23 23:58:00.142084
58934	26	2024-12-27 20:00:00	2024-12-27 21:00:00	f	2024-10-23 23:58:00.147053	2024-10-23 23:58:00.147053
58935	26	2024-12-28 10:00:00	2024-12-28 11:00:00	f	2024-10-23 23:58:00.151889	2024-10-23 23:58:00.151889
58936	26	2024-12-28 11:00:00	2024-12-28 12:00:00	f	2024-10-23 23:58:00.155081	2024-10-23 23:58:00.155081
58937	26	2024-12-28 12:00:00	2024-12-28 13:00:00	f	2024-10-23 23:58:00.15936	2024-10-23 23:58:00.15936
58938	26	2024-12-28 13:00:00	2024-12-28 14:00:00	f	2024-10-23 23:58:00.162268	2024-10-23 23:58:00.162268
58939	26	2024-12-28 14:00:00	2024-12-28 15:00:00	f	2024-10-23 23:58:00.16583	2024-10-23 23:58:00.16583
58940	26	2024-12-28 15:00:00	2024-12-28 16:00:00	f	2024-10-23 23:58:00.169073	2024-10-23 23:58:00.169073
58941	26	2024-12-28 16:00:00	2024-12-28 17:00:00	f	2024-10-23 23:58:00.173499	2024-10-23 23:58:00.173499
58942	26	2024-12-28 17:00:00	2024-12-28 18:00:00	f	2024-10-23 23:58:00.176158	2024-10-23 23:58:00.176158
58943	26	2024-12-28 18:00:00	2024-12-28 19:00:00	f	2024-10-23 23:58:00.180604	2024-10-23 23:58:00.180604
58944	26	2024-12-28 19:00:00	2024-12-28 20:00:00	f	2024-10-23 23:58:00.184356	2024-10-23 23:58:00.184356
58945	26	2024-12-28 20:00:00	2024-12-28 21:00:00	f	2024-10-23 23:58:00.188365	2024-10-23 23:58:00.188365
58946	26	2024-12-30 10:00:00	2024-12-30 11:00:00	f	2024-10-23 23:58:00.19148	2024-10-23 23:58:00.19148
58947	26	2024-12-30 11:00:00	2024-12-30 12:00:00	f	2024-10-23 23:58:00.194969	2024-10-23 23:58:00.194969
58948	26	2024-12-30 12:00:00	2024-12-30 13:00:00	f	2024-10-23 23:58:00.197501	2024-10-23 23:58:00.197501
58949	26	2024-12-30 13:00:00	2024-12-30 14:00:00	f	2024-10-23 23:58:00.202341	2024-10-23 23:58:00.202341
58950	26	2024-12-30 14:00:00	2024-12-30 15:00:00	f	2024-10-23 23:58:00.20577	2024-10-23 23:58:00.20577
58951	26	2024-12-30 15:00:00	2024-12-30 16:00:00	f	2024-10-23 23:58:00.210095	2024-10-23 23:58:00.210095
58952	26	2024-12-30 16:00:00	2024-12-30 17:00:00	f	2024-10-23 23:58:00.214778	2024-10-23 23:58:00.214778
58953	26	2024-12-30 17:00:00	2024-12-30 18:00:00	f	2024-10-23 23:58:00.219075	2024-10-23 23:58:00.219075
58954	26	2024-12-30 18:00:00	2024-12-30 19:00:00	f	2024-10-23 23:58:00.223344	2024-10-23 23:58:00.223344
58955	26	2024-12-30 19:00:00	2024-12-30 20:00:00	f	2024-10-23 23:58:00.226897	2024-10-23 23:58:00.226897
58956	26	2024-12-30 20:00:00	2024-12-30 21:00:00	f	2024-10-23 23:58:00.230055	2024-10-23 23:58:00.230055
58957	26	2024-12-31 10:00:00	2024-12-31 11:00:00	f	2024-10-23 23:58:00.232126	2024-10-23 23:58:00.232126
58958	26	2024-12-31 11:00:00	2024-12-31 12:00:00	f	2024-10-23 23:58:00.236091	2024-10-23 23:58:00.236091
58959	26	2024-12-31 12:00:00	2024-12-31 13:00:00	f	2024-10-23 23:58:00.238318	2024-10-23 23:58:00.238318
58960	26	2024-12-31 13:00:00	2024-12-31 14:00:00	f	2024-10-23 23:58:00.242559	2024-10-23 23:58:00.242559
58961	26	2024-12-31 14:00:00	2024-12-31 15:00:00	f	2024-10-23 23:58:00.245238	2024-10-23 23:58:00.245238
58962	26	2024-12-31 15:00:00	2024-12-31 16:00:00	f	2024-10-23 23:58:00.249289	2024-10-23 23:58:00.249289
58963	26	2024-12-31 16:00:00	2024-12-31 17:00:00	f	2024-10-23 23:58:00.251764	2024-10-23 23:58:00.251764
58964	26	2024-12-31 17:00:00	2024-12-31 18:00:00	f	2024-10-23 23:58:00.255059	2024-10-23 23:58:00.255059
58965	26	2024-12-31 18:00:00	2024-12-31 19:00:00	f	2024-10-23 23:58:00.258109	2024-10-23 23:58:00.258109
58966	26	2024-12-31 19:00:00	2024-12-31 20:00:00	f	2024-10-23 23:58:00.261693	2024-10-23 23:58:00.261693
58967	26	2024-12-31 20:00:00	2024-12-31 21:00:00	f	2024-10-23 23:58:00.266099	2024-10-23 23:58:00.266099
58968	26	2025-01-01 10:00:00	2025-01-01 11:00:00	f	2024-10-23 23:58:00.269819	2024-10-23 23:58:00.269819
58969	26	2025-01-01 11:00:00	2025-01-01 12:00:00	f	2024-10-23 23:58:00.272503	2024-10-23 23:58:00.272503
58970	26	2025-01-01 12:00:00	2025-01-01 13:00:00	f	2024-10-23 23:58:00.276358	2024-10-23 23:58:00.276358
58971	26	2025-01-01 13:00:00	2025-01-01 14:00:00	f	2024-10-23 23:58:00.279322	2024-10-23 23:58:00.279322
58972	26	2025-01-01 14:00:00	2025-01-01 15:00:00	f	2024-10-23 23:58:00.28207	2024-10-23 23:58:00.28207
58973	26	2025-01-01 15:00:00	2025-01-01 16:00:00	f	2024-10-23 23:58:00.284719	2024-10-23 23:58:00.284719
58974	26	2025-01-01 16:00:00	2025-01-01 17:00:00	f	2024-10-23 23:58:00.286928	2024-10-23 23:58:00.286928
58975	26	2025-01-01 17:00:00	2025-01-01 18:00:00	f	2024-10-23 23:58:00.290093	2024-10-23 23:58:00.290093
58976	26	2025-01-01 18:00:00	2025-01-01 19:00:00	f	2024-10-23 23:58:00.293888	2024-10-23 23:58:00.293888
58977	26	2025-01-01 19:00:00	2025-01-01 20:00:00	f	2024-10-23 23:58:00.298712	2024-10-23 23:58:00.298712
58978	26	2025-01-01 20:00:00	2025-01-01 21:00:00	f	2024-10-23 23:58:00.301657	2024-10-23 23:58:00.301657
58979	26	2025-01-02 10:00:00	2025-01-02 11:00:00	f	2024-10-23 23:58:00.305528	2024-10-23 23:58:00.305528
58980	26	2025-01-02 11:00:00	2025-01-02 12:00:00	f	2024-10-23 23:58:00.308015	2024-10-23 23:58:00.308015
58981	26	2025-01-02 12:00:00	2025-01-02 13:00:00	f	2024-10-23 23:58:00.311849	2024-10-23 23:58:00.311849
58982	26	2025-01-02 13:00:00	2025-01-02 14:00:00	f	2024-10-23 23:58:00.314202	2024-10-23 23:58:00.314202
58983	26	2025-01-02 14:00:00	2025-01-02 15:00:00	f	2024-10-23 23:58:00.317197	2024-10-23 23:58:00.317197
58984	26	2025-01-02 15:00:00	2025-01-02 16:00:00	f	2024-10-23 23:58:00.320904	2024-10-23 23:58:00.320904
58985	26	2025-01-02 16:00:00	2025-01-02 17:00:00	f	2024-10-23 23:58:00.323435	2024-10-23 23:58:00.323435
58986	26	2025-01-02 17:00:00	2025-01-02 18:00:00	f	2024-10-23 23:58:00.327095	2024-10-23 23:58:00.327095
58987	26	2025-01-02 18:00:00	2025-01-02 19:00:00	f	2024-10-23 23:58:00.329986	2024-10-23 23:58:00.329986
58988	26	2025-01-02 19:00:00	2025-01-02 20:00:00	f	2024-10-23 23:58:00.333988	2024-10-23 23:58:00.333988
58989	26	2025-01-02 20:00:00	2025-01-02 21:00:00	f	2024-10-23 23:58:00.336295	2024-10-23 23:58:00.336295
58990	26	2025-01-03 10:00:00	2025-01-03 11:00:00	f	2024-10-23 23:58:00.339855	2024-10-23 23:58:00.339855
58991	26	2025-01-03 11:00:00	2025-01-03 12:00:00	f	2024-10-23 23:58:00.342645	2024-10-23 23:58:00.342645
58992	26	2025-01-03 12:00:00	2025-01-03 13:00:00	f	2024-10-23 23:58:00.346603	2024-10-23 23:58:00.346603
58993	26	2025-01-03 13:00:00	2025-01-03 14:00:00	f	2024-10-23 23:58:00.349808	2024-10-23 23:58:00.349808
58994	26	2025-01-03 14:00:00	2025-01-03 15:00:00	f	2024-10-23 23:58:00.353128	2024-10-23 23:58:00.353128
58995	26	2025-01-03 15:00:00	2025-01-03 16:00:00	f	2024-10-23 23:58:00.356079	2024-10-23 23:58:00.356079
58996	26	2025-01-03 16:00:00	2025-01-03 17:00:00	f	2024-10-23 23:58:00.359947	2024-10-23 23:58:00.359947
58997	26	2025-01-03 17:00:00	2025-01-03 18:00:00	f	2024-10-23 23:58:00.363036	2024-10-23 23:58:00.363036
58998	26	2025-01-03 18:00:00	2025-01-03 19:00:00	f	2024-10-23 23:58:00.366668	2024-10-23 23:58:00.366668
58999	26	2025-01-03 19:00:00	2025-01-03 20:00:00	f	2024-10-23 23:58:00.369994	2024-10-23 23:58:00.369994
59000	26	2025-01-03 20:00:00	2025-01-03 21:00:00	f	2024-10-23 23:58:00.373214	2024-10-23 23:58:00.373214
59001	26	2025-01-04 10:00:00	2025-01-04 11:00:00	f	2024-10-23 23:58:00.376021	2024-10-23 23:58:00.376021
59002	26	2025-01-04 11:00:00	2025-01-04 12:00:00	f	2024-10-23 23:58:00.378402	2024-10-23 23:58:00.378402
59003	26	2025-01-04 12:00:00	2025-01-04 13:00:00	f	2024-10-23 23:58:00.381739	2024-10-23 23:58:00.381739
59004	26	2025-01-04 13:00:00	2025-01-04 14:00:00	f	2024-10-23 23:58:00.384023	2024-10-23 23:58:00.384023
59005	26	2025-01-04 14:00:00	2025-01-04 15:00:00	f	2024-10-23 23:58:00.388087	2024-10-23 23:58:00.388087
59006	26	2025-01-04 15:00:00	2025-01-04 16:00:00	f	2024-10-23 23:58:00.390453	2024-10-23 23:58:00.390453
59007	26	2025-01-04 16:00:00	2025-01-04 17:00:00	f	2024-10-23 23:58:00.392941	2024-10-23 23:58:00.392941
59008	26	2025-01-04 17:00:00	2025-01-04 18:00:00	f	2024-10-23 23:58:00.396637	2024-10-23 23:58:00.396637
59009	26	2025-01-04 18:00:00	2025-01-04 19:00:00	f	2024-10-23 23:58:00.399211	2024-10-23 23:58:00.399211
59010	26	2025-01-04 19:00:00	2025-01-04 20:00:00	f	2024-10-23 23:58:00.403405	2024-10-23 23:58:00.403405
59011	26	2025-01-04 20:00:00	2025-01-04 21:00:00	f	2024-10-23 23:58:00.405888	2024-10-23 23:58:00.405888
59012	26	2025-01-06 10:00:00	2025-01-06 11:00:00	f	2024-10-23 23:58:00.409836	2024-10-23 23:58:00.409836
59013	26	2025-01-06 11:00:00	2025-01-06 12:00:00	f	2024-10-23 23:58:00.412237	2024-10-23 23:58:00.412237
59014	26	2025-01-06 12:00:00	2025-01-06 13:00:00	f	2024-10-23 23:58:00.41653	2024-10-23 23:58:00.41653
59015	26	2025-01-06 13:00:00	2025-01-06 14:00:00	f	2024-10-23 23:58:00.424665	2024-10-23 23:58:00.424665
59016	26	2025-01-06 14:00:00	2025-01-06 15:00:00	f	2024-10-23 23:58:00.427719	2024-10-23 23:58:00.427719
59017	26	2025-01-06 15:00:00	2025-01-06 16:00:00	f	2024-10-23 23:58:00.430996	2024-10-23 23:58:00.430996
59018	26	2025-01-06 16:00:00	2025-01-06 17:00:00	f	2024-10-23 23:58:00.433159	2024-10-23 23:58:00.433159
59019	26	2025-01-06 17:00:00	2025-01-06 18:00:00	f	2024-10-23 23:58:00.436887	2024-10-23 23:58:00.436887
59020	26	2025-01-06 18:00:00	2025-01-06 19:00:00	f	2024-10-23 23:58:00.439411	2024-10-23 23:58:00.439411
59021	26	2025-01-06 19:00:00	2025-01-06 20:00:00	f	2024-10-23 23:58:00.442951	2024-10-23 23:58:00.442951
59022	26	2025-01-06 20:00:00	2025-01-06 21:00:00	f	2024-10-23 23:58:00.445295	2024-10-23 23:58:00.445295
59023	26	2025-01-07 10:00:00	2025-01-07 11:00:00	f	2024-10-23 23:58:00.448575	2024-10-23 23:58:00.448575
59024	26	2025-01-07 11:00:00	2025-01-07 12:00:00	f	2024-10-23 23:58:00.452259	2024-10-23 23:58:00.452259
59025	26	2025-01-07 12:00:00	2025-01-07 13:00:00	f	2024-10-23 23:58:00.454681	2024-10-23 23:58:00.454681
59026	26	2025-01-07 13:00:00	2025-01-07 14:00:00	f	2024-10-23 23:58:00.458153	2024-10-23 23:58:00.458153
59027	26	2025-01-07 14:00:00	2025-01-07 15:00:00	f	2024-10-23 23:58:00.460401	2024-10-23 23:58:00.460401
59028	26	2025-01-07 15:00:00	2025-01-07 16:00:00	f	2024-10-23 23:58:00.463306	2024-10-23 23:58:00.463306
59029	26	2025-01-07 16:00:00	2025-01-07 17:00:00	f	2024-10-23 23:58:00.466142	2024-10-23 23:58:00.466142
59030	26	2025-01-07 17:00:00	2025-01-07 18:00:00	f	2024-10-23 23:58:00.468682	2024-10-23 23:58:00.468682
59031	26	2025-01-07 18:00:00	2025-01-07 19:00:00	f	2024-10-23 23:58:00.472354	2024-10-23 23:58:00.472354
59032	26	2025-01-07 19:00:00	2025-01-07 20:00:00	f	2024-10-23 23:58:00.474581	2024-10-23 23:58:00.474581
59033	26	2025-01-07 20:00:00	2025-01-07 21:00:00	f	2024-10-23 23:58:00.478481	2024-10-23 23:58:00.478481
59034	26	2025-01-08 10:00:00	2025-01-08 11:00:00	f	2024-10-23 23:58:00.48099	2024-10-23 23:58:00.48099
59035	26	2025-01-08 11:00:00	2025-01-08 12:00:00	f	2024-10-23 23:58:00.483619	2024-10-23 23:58:00.483619
59036	26	2025-01-08 12:00:00	2025-01-08 13:00:00	f	2024-10-23 23:58:00.487831	2024-10-23 23:58:00.487831
59037	26	2025-01-08 13:00:00	2025-01-08 14:00:00	f	2024-10-23 23:58:00.491623	2024-10-23 23:58:00.491623
59038	26	2025-01-08 14:00:00	2025-01-08 15:00:00	f	2024-10-23 23:58:00.496782	2024-10-23 23:58:00.496782
59039	26	2025-01-08 15:00:00	2025-01-08 16:00:00	f	2024-10-23 23:58:00.50054	2024-10-23 23:58:00.50054
59040	26	2025-01-08 16:00:00	2025-01-08 17:00:00	f	2024-10-23 23:58:00.50287	2024-10-23 23:58:00.50287
59041	26	2025-01-08 17:00:00	2025-01-08 18:00:00	f	2024-10-23 23:58:00.506359	2024-10-23 23:58:00.506359
59042	26	2025-01-08 18:00:00	2025-01-08 19:00:00	f	2024-10-23 23:58:00.509713	2024-10-23 23:58:00.509713
59043	26	2025-01-08 19:00:00	2025-01-08 20:00:00	f	2024-10-23 23:58:00.514647	2024-10-23 23:58:00.514647
59044	26	2025-01-08 20:00:00	2025-01-08 21:00:00	f	2024-10-23 23:58:00.517037	2024-10-23 23:58:00.517037
59045	26	2025-01-09 10:00:00	2025-01-09 11:00:00	f	2024-10-23 23:58:00.520654	2024-10-23 23:58:00.520654
59046	26	2025-01-09 11:00:00	2025-01-09 12:00:00	f	2024-10-23 23:58:00.523036	2024-10-23 23:58:00.523036
59047	26	2025-01-09 12:00:00	2025-01-09 13:00:00	f	2024-10-23 23:58:00.526977	2024-10-23 23:58:00.526977
59048	26	2025-01-09 13:00:00	2025-01-09 14:00:00	f	2024-10-23 23:58:00.52948	2024-10-23 23:58:00.52948
59049	26	2025-01-09 14:00:00	2025-01-09 15:00:00	f	2024-10-23 23:58:00.53212	2024-10-23 23:58:00.53212
59050	26	2025-01-09 15:00:00	2025-01-09 16:00:00	f	2024-10-23 23:58:00.535258	2024-10-23 23:58:00.535258
59051	26	2025-01-09 16:00:00	2025-01-09 17:00:00	f	2024-10-23 23:58:00.537099	2024-10-23 23:58:00.537099
59052	26	2025-01-09 17:00:00	2025-01-09 18:00:00	f	2024-10-23 23:58:00.540481	2024-10-23 23:58:00.540481
59053	26	2025-01-09 18:00:00	2025-01-09 19:00:00	f	2024-10-23 23:58:00.54296	2024-10-23 23:58:00.54296
59054	26	2025-01-09 19:00:00	2025-01-09 20:00:00	f	2024-10-23 23:58:00.546096	2024-10-23 23:58:00.546096
59055	26	2025-01-09 20:00:00	2025-01-09 21:00:00	f	2024-10-23 23:58:00.549922	2024-10-23 23:58:00.549922
59056	26	2025-01-10 10:00:00	2025-01-10 11:00:00	f	2024-10-23 23:58:00.553117	2024-10-23 23:58:00.553117
59057	26	2025-01-10 11:00:00	2025-01-10 12:00:00	f	2024-10-23 23:58:00.556642	2024-10-23 23:58:00.556642
59058	26	2025-01-10 12:00:00	2025-01-10 13:00:00	f	2024-10-23 23:58:00.55933	2024-10-23 23:58:00.55933
59059	26	2025-01-10 13:00:00	2025-01-10 14:00:00	f	2024-10-23 23:58:00.562748	2024-10-23 23:58:00.562748
59060	26	2025-01-10 14:00:00	2025-01-10 15:00:00	f	2024-10-23 23:58:00.565179	2024-10-23 23:58:00.565179
59061	26	2025-01-10 15:00:00	2025-01-10 16:00:00	f	2024-10-23 23:58:00.568772	2024-10-23 23:58:00.568772
59062	26	2025-01-10 16:00:00	2025-01-10 17:00:00	f	2024-10-23 23:58:00.571205	2024-10-23 23:58:00.571205
59063	26	2025-01-10 17:00:00	2025-01-10 18:00:00	f	2024-10-23 23:58:00.57406	2024-10-23 23:58:00.57406
59064	26	2025-01-10 18:00:00	2025-01-10 19:00:00	f	2024-10-23 23:58:00.578125	2024-10-23 23:58:00.578125
59065	26	2025-01-10 19:00:00	2025-01-10 20:00:00	f	2024-10-23 23:58:00.581831	2024-10-23 23:58:00.581831
59066	26	2025-01-10 20:00:00	2025-01-10 21:00:00	f	2024-10-23 23:58:00.584808	2024-10-23 23:58:00.584808
59067	26	2025-01-11 10:00:00	2025-01-11 11:00:00	f	2024-10-23 23:58:00.587645	2024-10-23 23:58:00.587645
59068	26	2025-01-11 11:00:00	2025-01-11 12:00:00	f	2024-10-23 23:58:00.590563	2024-10-23 23:58:00.590563
59069	26	2025-01-11 12:00:00	2025-01-11 13:00:00	f	2024-10-23 23:58:00.592532	2024-10-23 23:58:00.592532
59070	26	2025-01-11 13:00:00	2025-01-11 14:00:00	f	2024-10-23 23:58:00.595732	2024-10-23 23:58:00.595732
59071	26	2025-01-11 14:00:00	2025-01-11 15:00:00	f	2024-10-23 23:58:00.598328	2024-10-23 23:58:00.598328
59072	26	2025-01-11 15:00:00	2025-01-11 16:00:00	f	2024-10-23 23:58:00.601136	2024-10-23 23:58:00.601136
59073	26	2025-01-11 16:00:00	2025-01-11 17:00:00	f	2024-10-23 23:58:00.604977	2024-10-23 23:58:00.604977
59074	26	2025-01-11 17:00:00	2025-01-11 18:00:00	f	2024-10-23 23:58:00.608455	2024-10-23 23:58:00.608455
59075	26	2025-01-11 18:00:00	2025-01-11 19:00:00	f	2024-10-23 23:58:00.612356	2024-10-23 23:58:00.612356
59076	26	2025-01-11 19:00:00	2025-01-11 20:00:00	f	2024-10-23 23:58:00.615427	2024-10-23 23:58:00.615427
59077	26	2025-01-11 20:00:00	2025-01-11 21:00:00	f	2024-10-23 23:58:00.618759	2024-10-23 23:58:00.618759
59078	26	2025-01-13 10:00:00	2025-01-13 11:00:00	f	2024-10-23 23:58:00.621653	2024-10-23 23:58:00.621653
59079	26	2025-01-13 11:00:00	2025-01-13 12:00:00	f	2024-10-23 23:58:00.624835	2024-10-23 23:58:00.624835
59080	26	2025-01-13 12:00:00	2025-01-13 13:00:00	f	2024-10-23 23:58:00.62706	2024-10-23 23:58:00.62706
59081	26	2025-01-13 13:00:00	2025-01-13 14:00:00	f	2024-10-23 23:58:00.629923	2024-10-23 23:58:00.629923
59082	26	2025-01-13 14:00:00	2025-01-13 15:00:00	f	2024-10-23 23:58:00.632763	2024-10-23 23:58:00.632763
59083	26	2025-01-13 15:00:00	2025-01-13 16:00:00	f	2024-10-23 23:58:00.634624	2024-10-23 23:58:00.634624
59084	26	2025-01-13 16:00:00	2025-01-13 17:00:00	f	2024-10-23 23:58:00.638414	2024-10-23 23:58:00.638414
59085	26	2025-01-13 17:00:00	2025-01-13 18:00:00	f	2024-10-23 23:58:00.640863	2024-10-23 23:58:00.640863
59086	26	2025-01-13 18:00:00	2025-01-13 19:00:00	f	2024-10-23 23:58:00.644213	2024-10-23 23:58:00.644213
59087	26	2025-01-13 19:00:00	2025-01-13 20:00:00	f	2024-10-23 23:58:00.646979	2024-10-23 23:58:00.646979
59088	26	2025-01-13 20:00:00	2025-01-13 21:00:00	f	2024-10-23 23:58:00.649709	2024-10-23 23:58:00.649709
59089	26	2025-01-14 10:00:00	2025-01-14 11:00:00	f	2024-10-23 23:58:00.6535	2024-10-23 23:58:00.6535
59090	26	2025-01-14 11:00:00	2025-01-14 12:00:00	f	2024-10-23 23:58:00.656514	2024-10-23 23:58:00.656514
59091	26	2025-01-14 12:00:00	2025-01-14 13:00:00	f	2024-10-23 23:58:00.659984	2024-10-23 23:58:00.659984
59092	26	2025-01-14 13:00:00	2025-01-14 14:00:00	f	2024-10-23 23:58:00.662045	2024-10-23 23:58:00.662045
59093	26	2025-01-14 14:00:00	2025-01-14 15:00:00	f	2024-10-23 23:58:00.665156	2024-10-23 23:58:00.665156
59094	26	2025-01-14 15:00:00	2025-01-14 16:00:00	f	2024-10-23 23:58:00.667515	2024-10-23 23:58:00.667515
59095	26	2025-01-14 16:00:00	2025-01-14 17:00:00	f	2024-10-23 23:58:00.669993	2024-10-23 23:58:00.669993
59096	26	2025-01-14 17:00:00	2025-01-14 18:00:00	f	2024-10-23 23:58:00.674636	2024-10-23 23:58:00.674636
59097	26	2025-01-14 18:00:00	2025-01-14 19:00:00	f	2024-10-23 23:58:00.67764	2024-10-23 23:58:00.67764
59098	26	2025-01-14 19:00:00	2025-01-14 20:00:00	f	2024-10-23 23:58:00.681271	2024-10-23 23:58:00.681271
59099	26	2025-01-14 20:00:00	2025-01-14 21:00:00	f	2024-10-23 23:58:00.68384	2024-10-23 23:58:00.68384
59100	26	2025-01-15 10:00:00	2025-01-15 11:00:00	f	2024-10-23 23:58:00.686995	2024-10-23 23:58:00.686995
59101	26	2025-01-15 11:00:00	2025-01-15 12:00:00	f	2024-10-23 23:58:00.689345	2024-10-23 23:58:00.689345
59102	26	2025-01-15 12:00:00	2025-01-15 13:00:00	f	2024-10-23 23:58:00.692199	2024-10-23 23:58:00.692199
59103	26	2025-01-15 13:00:00	2025-01-15 14:00:00	f	2024-10-23 23:58:00.695874	2024-10-23 23:58:00.695874
59104	26	2025-01-15 14:00:00	2025-01-15 15:00:00	f	2024-10-23 23:58:00.699231	2024-10-23 23:58:00.699231
59105	26	2025-01-15 15:00:00	2025-01-15 16:00:00	f	2024-10-23 23:58:00.702851	2024-10-23 23:58:00.702851
59106	26	2025-01-15 16:00:00	2025-01-15 17:00:00	f	2024-10-23 23:58:00.706154	2024-10-23 23:58:00.706154
59107	26	2025-01-15 17:00:00	2025-01-15 18:00:00	f	2024-10-23 23:58:00.709963	2024-10-23 23:58:00.709963
59108	26	2025-01-15 18:00:00	2025-01-15 19:00:00	f	2024-10-23 23:58:00.713134	2024-10-23 23:58:00.713134
59109	26	2025-01-15 19:00:00	2025-01-15 20:00:00	f	2024-10-23 23:58:00.717433	2024-10-23 23:58:00.717433
59110	26	2025-01-15 20:00:00	2025-01-15 21:00:00	f	2024-10-23 23:58:00.721475	2024-10-23 23:58:00.721475
59111	26	2025-01-16 10:00:00	2025-01-16 11:00:00	f	2024-10-23 23:58:00.724336	2024-10-23 23:58:00.724336
59112	26	2025-01-16 11:00:00	2025-01-16 12:00:00	f	2024-10-23 23:58:00.727804	2024-10-23 23:58:00.727804
59113	26	2025-01-16 12:00:00	2025-01-16 13:00:00	f	2024-10-23 23:58:00.73396	2024-10-23 23:58:00.73396
59114	26	2025-01-16 13:00:00	2025-01-16 14:00:00	f	2024-10-23 23:58:00.73735	2024-10-23 23:58:00.73735
59115	26	2025-01-16 14:00:00	2025-01-16 15:00:00	f	2024-10-23 23:58:00.740573	2024-10-23 23:58:00.740573
59116	26	2025-01-16 15:00:00	2025-01-16 16:00:00	f	2024-10-23 23:58:00.744612	2024-10-23 23:58:00.744612
59117	26	2025-01-16 16:00:00	2025-01-16 17:00:00	f	2024-10-23 23:58:00.748958	2024-10-23 23:58:00.748958
59118	26	2025-01-16 17:00:00	2025-01-16 18:00:00	f	2024-10-23 23:58:00.751325	2024-10-23 23:58:00.751325
59119	26	2025-01-16 18:00:00	2025-01-16 19:00:00	f	2024-10-23 23:58:00.75426	2024-10-23 23:58:00.75426
59120	26	2025-01-16 19:00:00	2025-01-16 20:00:00	f	2024-10-23 23:58:00.757262	2024-10-23 23:58:00.757262
59121	26	2025-01-16 20:00:00	2025-01-16 21:00:00	f	2024-10-23 23:58:00.75983	2024-10-23 23:58:00.75983
59122	26	2025-01-17 10:00:00	2025-01-17 11:00:00	f	2024-10-23 23:58:00.763511	2024-10-23 23:58:00.763511
59123	26	2025-01-17 11:00:00	2025-01-17 12:00:00	f	2024-10-23 23:58:00.765939	2024-10-23 23:58:00.765939
59124	26	2025-01-17 12:00:00	2025-01-17 13:00:00	f	2024-10-23 23:58:00.768834	2024-10-23 23:58:00.768834
59125	26	2025-01-17 13:00:00	2025-01-17 14:00:00	f	2024-10-23 23:58:00.772207	2024-10-23 23:58:00.772207
59126	26	2025-01-17 14:00:00	2025-01-17 15:00:00	f	2024-10-23 23:58:00.775993	2024-10-23 23:58:00.775993
59127	26	2025-01-17 15:00:00	2025-01-17 16:00:00	f	2024-10-23 23:58:00.779582	2024-10-23 23:58:00.779582
59128	26	2025-01-17 16:00:00	2025-01-17 17:00:00	f	2024-10-23 23:58:00.783014	2024-10-23 23:58:00.783014
59129	26	2025-01-17 17:00:00	2025-01-17 18:00:00	f	2024-10-23 23:58:00.786593	2024-10-23 23:58:00.786593
59130	26	2025-01-17 18:00:00	2025-01-17 19:00:00	f	2024-10-23 23:58:00.790255	2024-10-23 23:58:00.790255
59131	26	2025-01-17 19:00:00	2025-01-17 20:00:00	f	2024-10-23 23:58:00.793855	2024-10-23 23:58:00.793855
59132	26	2025-01-17 20:00:00	2025-01-17 21:00:00	f	2024-10-23 23:58:00.797773	2024-10-23 23:58:00.797773
59133	26	2025-01-18 10:00:00	2025-01-18 11:00:00	f	2024-10-23 23:58:00.801261	2024-10-23 23:58:00.801261
59134	26	2025-01-18 11:00:00	2025-01-18 12:00:00	f	2024-10-23 23:58:00.804845	2024-10-23 23:58:00.804845
59135	26	2025-01-18 12:00:00	2025-01-18 13:00:00	f	2024-10-23 23:58:00.808833	2024-10-23 23:58:00.808833
59136	26	2025-01-18 13:00:00	2025-01-18 14:00:00	f	2024-10-23 23:58:00.812559	2024-10-23 23:58:00.812559
59137	26	2025-01-18 14:00:00	2025-01-18 15:00:00	f	2024-10-23 23:58:00.815714	2024-10-23 23:58:00.815714
59138	26	2025-01-18 15:00:00	2025-01-18 16:00:00	f	2024-10-23 23:58:00.819936	2024-10-23 23:58:00.819936
59139	26	2025-01-18 16:00:00	2025-01-18 17:00:00	f	2024-10-23 23:58:00.823433	2024-10-23 23:58:00.823433
59140	26	2025-01-18 17:00:00	2025-01-18 18:00:00	f	2024-10-23 23:58:00.827716	2024-10-23 23:58:00.827716
59141	26	2025-01-18 18:00:00	2025-01-18 19:00:00	f	2024-10-23 23:58:00.830747	2024-10-23 23:58:00.830747
59142	26	2025-01-18 19:00:00	2025-01-18 20:00:00	f	2024-10-23 23:58:00.833632	2024-10-23 23:58:00.833632
59143	26	2025-01-18 20:00:00	2025-01-18 21:00:00	f	2024-10-23 23:58:00.835738	2024-10-23 23:58:00.835738
59144	26	2025-01-20 10:00:00	2025-01-20 11:00:00	f	2024-10-23 23:58:00.839657	2024-10-23 23:58:00.839657
59145	26	2025-01-20 11:00:00	2025-01-20 12:00:00	f	2024-10-23 23:58:00.842402	2024-10-23 23:58:00.842402
59146	26	2025-01-20 12:00:00	2025-01-20 13:00:00	f	2024-10-23 23:58:00.845379	2024-10-23 23:58:00.845379
59147	26	2025-01-20 13:00:00	2025-01-20 14:00:00	f	2024-10-23 23:58:00.848406	2024-10-23 23:58:00.848406
59148	26	2025-01-20 14:00:00	2025-01-20 15:00:00	f	2024-10-23 23:58:00.851042	2024-10-23 23:58:00.851042
59149	26	2025-01-20 15:00:00	2025-01-20 16:00:00	f	2024-10-23 23:58:00.854399	2024-10-23 23:58:00.854399
59150	26	2025-01-20 16:00:00	2025-01-20 17:00:00	f	2024-10-23 23:58:00.856517	2024-10-23 23:58:00.856517
59151	26	2025-01-20 17:00:00	2025-01-20 18:00:00	f	2024-10-23 23:58:00.860127	2024-10-23 23:58:00.860127
59152	26	2025-01-20 18:00:00	2025-01-20 19:00:00	f	2024-10-23 23:58:00.862535	2024-10-23 23:58:00.862535
59153	26	2025-01-20 19:00:00	2025-01-20 20:00:00	f	2024-10-23 23:58:00.865279	2024-10-23 23:58:00.865279
59154	26	2025-01-20 20:00:00	2025-01-20 21:00:00	f	2024-10-23 23:58:00.868063	2024-10-23 23:58:00.868063
59155	26	2025-01-21 10:00:00	2025-01-21 11:00:00	f	2024-10-23 23:58:00.871287	2024-10-23 23:58:00.871287
59156	26	2025-01-21 11:00:00	2025-01-21 12:00:00	f	2024-10-23 23:58:00.875095	2024-10-23 23:58:00.875095
59157	26	2025-01-21 12:00:00	2025-01-21 13:00:00	f	2024-10-23 23:58:00.877495	2024-10-23 23:58:00.877495
59158	26	2025-01-21 13:00:00	2025-01-21 14:00:00	f	2024-10-23 23:58:00.880949	2024-10-23 23:58:00.880949
59159	26	2025-01-21 14:00:00	2025-01-21 15:00:00	f	2024-10-23 23:58:00.883392	2024-10-23 23:58:00.883392
59160	26	2025-01-21 15:00:00	2025-01-21 16:00:00	f	2024-10-23 23:58:00.885736	2024-10-23 23:58:00.885736
59161	26	2025-01-21 16:00:00	2025-01-21 17:00:00	f	2024-10-23 23:58:00.888951	2024-10-23 23:58:00.888951
59162	26	2025-01-21 17:00:00	2025-01-21 18:00:00	f	2024-10-23 23:58:00.891016	2024-10-23 23:58:00.891016
59163	26	2025-01-21 18:00:00	2025-01-21 19:00:00	f	2024-10-23 23:58:00.894786	2024-10-23 23:58:00.894786
59164	26	2025-01-21 19:00:00	2025-01-21 20:00:00	f	2024-10-23 23:58:00.898018	2024-10-23 23:58:00.898018
59165	26	2025-01-21 20:00:00	2025-01-21 21:00:00	f	2024-10-23 23:58:00.902812	2024-10-23 23:58:00.902812
59166	26	2025-01-22 10:00:00	2025-01-22 11:00:00	f	2024-10-23 23:58:00.905252	2024-10-23 23:58:00.905252
59167	26	2025-01-22 11:00:00	2025-01-22 12:00:00	f	2024-10-23 23:58:00.908813	2024-10-23 23:58:00.908813
59168	26	2025-01-22 12:00:00	2025-01-22 13:00:00	f	2024-10-23 23:58:00.911781	2024-10-23 23:58:00.911781
59169	26	2025-01-22 13:00:00	2025-01-22 14:00:00	f	2024-10-23 23:58:00.915109	2024-10-23 23:58:00.915109
59170	26	2025-01-22 14:00:00	2025-01-22 15:00:00	f	2024-10-23 23:58:00.918779	2024-10-23 23:58:00.918779
59171	26	2025-01-22 15:00:00	2025-01-22 16:00:00	f	2024-10-23 23:58:00.922122	2024-10-23 23:58:00.922122
59172	26	2025-01-22 16:00:00	2025-01-22 17:00:00	f	2024-10-23 23:58:00.926593	2024-10-23 23:58:00.926593
59173	26	2025-01-22 17:00:00	2025-01-22 18:00:00	f	2024-10-23 23:58:00.930576	2024-10-23 23:58:00.930576
59174	26	2025-01-22 18:00:00	2025-01-22 19:00:00	f	2024-10-23 23:58:00.934719	2024-10-23 23:58:00.934719
59175	26	2025-01-22 19:00:00	2025-01-22 20:00:00	f	2024-10-23 23:58:00.938219	2024-10-23 23:58:00.938219
59176	26	2025-01-22 20:00:00	2025-01-22 21:00:00	f	2024-10-23 23:58:00.940718	2024-10-23 23:58:00.940718
59177	26	2025-01-23 10:00:00	2025-01-23 11:00:00	f	2024-10-23 23:58:00.94331	2024-10-23 23:58:00.94331
59178	26	2025-01-23 11:00:00	2025-01-23 12:00:00	f	2024-10-23 23:58:00.945418	2024-10-23 23:58:00.945418
59179	26	2025-01-23 12:00:00	2025-01-23 13:00:00	f	2024-10-23 23:58:00.947738	2024-10-23 23:58:00.947738
59180	26	2025-01-23 13:00:00	2025-01-23 14:00:00	f	2024-10-23 23:58:00.950927	2024-10-23 23:58:00.950927
59181	26	2025-01-23 14:00:00	2025-01-23 15:00:00	f	2024-10-23 23:58:00.953064	2024-10-23 23:58:00.953064
59182	26	2025-01-23 15:00:00	2025-01-23 16:00:00	f	2024-10-23 23:58:00.95559	2024-10-23 23:58:00.95559
59183	26	2025-01-23 16:00:00	2025-01-23 17:00:00	f	2024-10-23 23:58:00.958718	2024-10-23 23:58:00.958718
59184	26	2025-01-23 17:00:00	2025-01-23 18:00:00	f	2024-10-23 23:58:00.961839	2024-10-23 23:58:00.961839
59185	26	2025-01-23 18:00:00	2025-01-23 19:00:00	f	2024-10-23 23:58:00.96628	2024-10-23 23:58:00.96628
59186	26	2025-01-23 19:00:00	2025-01-23 20:00:00	f	2024-10-23 23:58:00.970536	2024-10-23 23:58:00.970536
59187	26	2025-01-23 20:00:00	2025-01-23 21:00:00	f	2024-10-23 23:58:00.973897	2024-10-23 23:58:00.973897
59188	26	2025-01-24 10:00:00	2025-01-24 11:00:00	f	2024-10-23 23:58:00.97644	2024-10-23 23:58:00.97644
59189	26	2025-01-24 11:00:00	2025-01-24 12:00:00	f	2024-10-23 23:58:00.979582	2024-10-23 23:58:00.979582
59190	26	2025-01-24 12:00:00	2025-01-24 13:00:00	f	2024-10-23 23:58:00.981837	2024-10-23 23:58:00.981837
59191	26	2025-01-24 13:00:00	2025-01-24 14:00:00	f	2024-10-23 23:58:00.984996	2024-10-23 23:58:00.984996
59192	26	2025-01-24 14:00:00	2025-01-24 15:00:00	f	2024-10-23 23:58:00.987895	2024-10-23 23:58:00.987895
59193	26	2025-01-24 15:00:00	2025-01-24 16:00:00	f	2024-10-23 23:58:00.990194	2024-10-23 23:58:00.990194
59194	26	2025-01-24 16:00:00	2025-01-24 17:00:00	f	2024-10-23 23:58:00.994337	2024-10-23 23:58:00.994337
59195	26	2025-01-24 17:00:00	2025-01-24 18:00:00	f	2024-10-23 23:58:00.998966	2024-10-23 23:58:00.998966
59196	26	2025-01-24 18:00:00	2025-01-24 19:00:00	f	2024-10-23 23:58:01.002518	2024-10-23 23:58:01.002518
59197	26	2025-01-24 19:00:00	2025-01-24 20:00:00	f	2024-10-23 23:58:01.007026	2024-10-23 23:58:01.007026
59198	26	2025-01-24 20:00:00	2025-01-24 21:00:00	f	2024-10-23 23:58:01.010024	2024-10-23 23:58:01.010024
59199	26	2025-01-25 10:00:00	2025-01-25 11:00:00	f	2024-10-23 23:58:01.013551	2024-10-23 23:58:01.013551
59200	26	2025-01-25 11:00:00	2025-01-25 12:00:00	f	2024-10-23 23:58:01.015747	2024-10-23 23:58:01.015747
59201	26	2025-01-25 12:00:00	2025-01-25 13:00:00	f	2024-10-23 23:58:01.018138	2024-10-23 23:58:01.018138
59202	26	2025-01-25 13:00:00	2025-01-25 14:00:00	f	2024-10-23 23:58:01.021262	2024-10-23 23:58:01.021262
59203	26	2025-01-25 14:00:00	2025-01-25 15:00:00	f	2024-10-23 23:58:01.023319	2024-10-23 23:58:01.023319
59204	26	2025-01-25 15:00:00	2025-01-25 16:00:00	f	2024-10-23 23:58:01.027681	2024-10-23 23:58:01.027681
59205	26	2025-01-25 16:00:00	2025-01-25 17:00:00	f	2024-10-23 23:58:01.030259	2024-10-23 23:58:01.030259
59206	26	2025-01-25 17:00:00	2025-01-25 18:00:00	f	2024-10-23 23:58:01.034116	2024-10-23 23:58:01.034116
59207	26	2025-01-25 18:00:00	2025-01-25 19:00:00	f	2024-10-23 23:58:01.03722	2024-10-23 23:58:01.03722
59208	26	2025-01-25 19:00:00	2025-01-25 20:00:00	f	2024-10-23 23:58:01.041362	2024-10-23 23:58:01.041362
59209	26	2025-01-25 20:00:00	2025-01-25 21:00:00	f	2024-10-23 23:58:01.04859	2024-10-23 23:58:01.04859
59210	26	2025-01-27 10:00:00	2025-01-27 11:00:00	f	2024-10-23 23:58:01.050899	2024-10-23 23:58:01.050899
59211	26	2025-01-27 11:00:00	2025-01-27 12:00:00	f	2024-10-23 23:58:01.053924	2024-10-23 23:58:01.053924
59212	26	2025-01-27 12:00:00	2025-01-27 13:00:00	f	2024-10-23 23:58:01.057072	2024-10-23 23:58:01.057072
59213	26	2025-01-27 13:00:00	2025-01-27 14:00:00	f	2024-10-23 23:58:01.060434	2024-10-23 23:58:01.060434
59214	26	2025-01-27 14:00:00	2025-01-27 15:00:00	f	2024-10-23 23:58:01.063951	2024-10-23 23:58:01.063951
59215	26	2025-01-27 15:00:00	2025-01-27 16:00:00	f	2024-10-23 23:58:01.066388	2024-10-23 23:58:01.066388
59216	26	2025-01-27 16:00:00	2025-01-27 17:00:00	f	2024-10-23 23:58:01.070061	2024-10-23 23:58:01.070061
59217	26	2025-01-27 17:00:00	2025-01-27 18:00:00	f	2024-10-23 23:58:01.073707	2024-10-23 23:58:01.073707
59218	26	2025-01-27 18:00:00	2025-01-27 19:00:00	f	2024-10-23 23:58:01.077145	2024-10-23 23:58:01.077145
59219	26	2025-01-27 19:00:00	2025-01-27 20:00:00	f	2024-10-23 23:58:01.080493	2024-10-23 23:58:01.080493
59220	26	2025-01-27 20:00:00	2025-01-27 21:00:00	f	2024-10-23 23:58:01.083488	2024-10-23 23:58:01.083488
59221	26	2025-01-28 10:00:00	2025-01-28 11:00:00	f	2024-10-23 23:58:01.08637	2024-10-23 23:58:01.08637
59222	26	2025-01-28 11:00:00	2025-01-28 12:00:00	f	2024-10-23 23:58:01.09056	2024-10-23 23:58:01.09056
59223	26	2025-01-28 12:00:00	2025-01-28 13:00:00	f	2024-10-23 23:58:01.09275	2024-10-23 23:58:01.09275
59224	26	2025-01-28 13:00:00	2025-01-28 14:00:00	f	2024-10-23 23:58:01.096354	2024-10-23 23:58:01.096354
59225	26	2025-01-28 14:00:00	2025-01-28 15:00:00	f	2024-10-23 23:58:01.099076	2024-10-23 23:58:01.099076
59226	26	2025-01-28 15:00:00	2025-01-28 16:00:00	f	2024-10-23 23:58:01.101998	2024-10-23 23:58:01.101998
59227	26	2025-01-28 16:00:00	2025-01-28 17:00:00	f	2024-10-23 23:58:01.105212	2024-10-23 23:58:01.105212
59228	26	2025-01-28 17:00:00	2025-01-28 18:00:00	f	2024-10-23 23:58:01.10776	2024-10-23 23:58:01.10776
59229	26	2025-01-28 18:00:00	2025-01-28 19:00:00	f	2024-10-23 23:58:01.111465	2024-10-23 23:58:01.111465
59230	26	2025-01-28 19:00:00	2025-01-28 20:00:00	f	2024-10-23 23:58:01.113956	2024-10-23 23:58:01.113956
59231	26	2025-01-28 20:00:00	2025-01-28 21:00:00	f	2024-10-23 23:58:01.117845	2024-10-23 23:58:01.117845
59232	26	2025-01-29 10:00:00	2025-01-29 11:00:00	f	2024-10-23 23:58:01.120566	2024-10-23 23:58:01.120566
59233	26	2025-01-29 11:00:00	2025-01-29 12:00:00	f	2024-10-23 23:58:01.123924	2024-10-23 23:58:01.123924
59234	26	2025-01-29 12:00:00	2025-01-29 13:00:00	f	2024-10-23 23:58:01.126466	2024-10-23 23:58:01.126466
59235	26	2025-01-29 13:00:00	2025-01-29 14:00:00	f	2024-10-23 23:58:01.129264	2024-10-23 23:58:01.129264
59236	26	2025-01-29 14:00:00	2025-01-29 15:00:00	f	2024-10-23 23:58:01.13232	2024-10-23 23:58:01.13232
59237	26	2025-01-29 15:00:00	2025-01-29 16:00:00	f	2024-10-23 23:58:01.134923	2024-10-23 23:58:01.134923
59238	26	2025-01-29 16:00:00	2025-01-29 17:00:00	f	2024-10-23 23:58:01.138549	2024-10-23 23:58:01.138549
59239	26	2025-01-29 17:00:00	2025-01-29 18:00:00	f	2024-10-23 23:58:01.140904	2024-10-23 23:58:01.140904
59240	26	2025-01-29 18:00:00	2025-01-29 19:00:00	f	2024-10-23 23:58:01.143921	2024-10-23 23:58:01.143921
59241	26	2025-01-29 19:00:00	2025-01-29 20:00:00	f	2024-10-23 23:58:01.146611	2024-10-23 23:58:01.146611
59242	26	2025-01-29 20:00:00	2025-01-29 21:00:00	f	2024-10-23 23:58:01.149777	2024-10-23 23:58:01.149777
59243	26	2025-01-30 10:00:00	2025-01-30 11:00:00	f	2024-10-23 23:58:01.153334	2024-10-23 23:58:01.153334
59244	26	2025-01-30 11:00:00	2025-01-30 12:00:00	f	2024-10-23 23:58:01.155417	2024-10-23 23:58:01.155417
59245	26	2025-01-30 12:00:00	2025-01-30 13:00:00	f	2024-10-23 23:58:01.159135	2024-10-23 23:58:01.159135
59246	26	2025-01-30 13:00:00	2025-01-30 14:00:00	f	2024-10-23 23:58:01.161356	2024-10-23 23:58:01.161356
59247	26	2025-01-30 14:00:00	2025-01-30 15:00:00	f	2024-10-23 23:58:01.164664	2024-10-23 23:58:01.164664
59248	26	2025-01-30 15:00:00	2025-01-30 16:00:00	f	2024-10-23 23:58:01.16761	2024-10-23 23:58:01.16761
59249	26	2025-01-30 16:00:00	2025-01-30 17:00:00	f	2024-10-23 23:58:01.170501	2024-10-23 23:58:01.170501
59250	26	2025-01-30 17:00:00	2025-01-30 18:00:00	f	2024-10-23 23:58:01.174159	2024-10-23 23:58:01.174159
59251	26	2025-01-30 18:00:00	2025-01-30 19:00:00	f	2024-10-23 23:58:01.177188	2024-10-23 23:58:01.177188
59252	26	2025-01-30 19:00:00	2025-01-30 20:00:00	f	2024-10-23 23:58:01.181219	2024-10-23 23:58:01.181219
59253	26	2025-01-30 20:00:00	2025-01-30 21:00:00	f	2024-10-23 23:58:01.183625	2024-10-23 23:58:01.183625
59254	26	2025-01-31 10:00:00	2025-01-31 11:00:00	f	2024-10-23 23:58:01.18695	2024-10-23 23:58:01.18695
59255	26	2025-01-31 11:00:00	2025-01-31 12:00:00	f	2024-10-23 23:58:01.18944	2024-10-23 23:58:01.18944
59256	26	2025-01-31 12:00:00	2025-01-31 13:00:00	f	2024-10-23 23:58:01.192594	2024-10-23 23:58:01.192594
59257	26	2025-01-31 13:00:00	2025-01-31 14:00:00	f	2024-10-23 23:58:01.196042	2024-10-23 23:58:01.196042
59258	26	2025-01-31 14:00:00	2025-01-31 15:00:00	f	2024-10-23 23:58:01.199059	2024-10-23 23:58:01.199059
59259	26	2025-01-31 15:00:00	2025-01-31 16:00:00	f	2024-10-23 23:58:01.202342	2024-10-23 23:58:01.202342
59260	26	2025-01-31 16:00:00	2025-01-31 17:00:00	f	2024-10-23 23:58:01.204843	2024-10-23 23:58:01.204843
59261	26	2025-01-31 17:00:00	2025-01-31 18:00:00	f	2024-10-23 23:58:01.208296	2024-10-23 23:58:01.208296
59262	26	2025-01-31 18:00:00	2025-01-31 19:00:00	f	2024-10-23 23:58:01.210949	2024-10-23 23:58:01.210949
59263	26	2025-01-31 19:00:00	2025-01-31 20:00:00	f	2024-10-23 23:58:01.215467	2024-10-23 23:58:01.215467
59264	26	2025-01-31 20:00:00	2025-01-31 21:00:00	f	2024-10-23 23:58:01.21959	2024-10-23 23:58:01.21959
59265	26	2025-02-01 10:00:00	2025-02-01 11:00:00	f	2024-10-23 23:58:01.22298	2024-10-23 23:58:01.22298
59266	26	2025-02-01 11:00:00	2025-02-01 12:00:00	f	2024-10-23 23:58:01.225796	2024-10-23 23:58:01.225796
59267	26	2025-02-01 12:00:00	2025-02-01 13:00:00	f	2024-10-23 23:58:01.229711	2024-10-23 23:58:01.229711
59268	26	2025-02-01 13:00:00	2025-02-01 14:00:00	f	2024-10-23 23:58:01.232402	2024-10-23 23:58:01.232402
59269	26	2025-02-01 14:00:00	2025-02-01 15:00:00	f	2024-10-23 23:58:01.236059	2024-10-23 23:58:01.236059
59270	26	2025-02-01 15:00:00	2025-02-01 16:00:00	f	2024-10-23 23:58:01.239096	2024-10-23 23:58:01.239096
59271	26	2025-02-01 16:00:00	2025-02-01 17:00:00	f	2024-10-23 23:58:01.243182	2024-10-23 23:58:01.243182
59272	26	2025-02-01 17:00:00	2025-02-01 18:00:00	f	2024-10-23 23:58:01.245672	2024-10-23 23:58:01.245672
59273	26	2025-02-01 18:00:00	2025-02-01 19:00:00	f	2024-10-23 23:58:01.250809	2024-10-23 23:58:01.250809
59274	26	2025-02-01 19:00:00	2025-02-01 20:00:00	f	2024-10-23 23:58:01.253296	2024-10-23 23:58:01.253296
59275	26	2025-02-01 20:00:00	2025-02-01 21:00:00	f	2024-10-23 23:58:01.257033	2024-10-23 23:58:01.257033
59276	26	2025-02-03 10:00:00	2025-02-03 11:00:00	f	2024-10-23 23:58:01.259891	2024-10-23 23:58:01.259891
59277	26	2025-02-03 11:00:00	2025-02-03 12:00:00	f	2024-10-23 23:58:01.26413	2024-10-23 23:58:01.26413
59278	26	2025-02-03 12:00:00	2025-02-03 13:00:00	f	2024-10-23 23:58:01.266883	2024-10-23 23:58:01.266883
59279	26	2025-02-03 13:00:00	2025-02-03 14:00:00	f	2024-10-23 23:58:01.270621	2024-10-23 23:58:01.270621
59280	26	2025-02-03 14:00:00	2025-02-03 15:00:00	f	2024-10-23 23:58:01.27277	2024-10-23 23:58:01.27277
59281	26	2025-02-03 15:00:00	2025-02-03 16:00:00	f	2024-10-23 23:58:01.27629	2024-10-23 23:58:01.27629
59282	26	2025-02-03 16:00:00	2025-02-03 17:00:00	f	2024-10-23 23:58:01.279428	2024-10-23 23:58:01.279428
59283	26	2025-02-03 17:00:00	2025-02-03 18:00:00	f	2024-10-23 23:58:01.282462	2024-10-23 23:58:01.282462
59284	26	2025-02-03 18:00:00	2025-02-03 19:00:00	f	2024-10-23 23:58:01.285906	2024-10-23 23:58:01.285906
59285	26	2025-02-03 19:00:00	2025-02-03 20:00:00	f	2024-10-23 23:58:01.28865	2024-10-23 23:58:01.28865
59286	26	2025-02-03 20:00:00	2025-02-03 21:00:00	f	2024-10-23 23:58:01.291796	2024-10-23 23:58:01.291796
59287	26	2025-02-04 10:00:00	2025-02-04 11:00:00	f	2024-10-23 23:58:01.294078	2024-10-23 23:58:01.294078
59288	26	2025-02-04 11:00:00	2025-02-04 12:00:00	f	2024-10-23 23:58:01.297642	2024-10-23 23:58:01.297642
59289	26	2025-02-04 12:00:00	2025-02-04 13:00:00	f	2024-10-23 23:58:01.299914	2024-10-23 23:58:01.299914
59290	26	2025-02-04 13:00:00	2025-02-04 14:00:00	f	2024-10-23 23:58:01.302443	2024-10-23 23:58:01.302443
59291	26	2025-02-04 14:00:00	2025-02-04 15:00:00	f	2024-10-23 23:58:01.305432	2024-10-23 23:58:01.305432
59292	26	2025-02-04 15:00:00	2025-02-04 16:00:00	f	2024-10-23 23:58:01.307676	2024-10-23 23:58:01.307676
59293	26	2025-02-04 16:00:00	2025-02-04 17:00:00	f	2024-10-23 23:58:01.312036	2024-10-23 23:58:01.312036
59294	26	2025-02-04 17:00:00	2025-02-04 18:00:00	f	2024-10-23 23:58:01.31514	2024-10-23 23:58:01.31514
59295	26	2025-02-04 18:00:00	2025-02-04 19:00:00	f	2024-10-23 23:58:01.319055	2024-10-23 23:58:01.319055
59296	26	2025-02-04 19:00:00	2025-02-04 20:00:00	f	2024-10-23 23:58:01.321657	2024-10-23 23:58:01.321657
59297	26	2025-02-04 20:00:00	2025-02-04 21:00:00	f	2024-10-23 23:58:01.325468	2024-10-23 23:58:01.325468
59298	26	2025-02-05 10:00:00	2025-02-05 11:00:00	f	2024-10-23 23:58:01.328147	2024-10-23 23:58:01.328147
59299	26	2025-02-05 11:00:00	2025-02-05 12:00:00	f	2024-10-23 23:58:01.331049	2024-10-23 23:58:01.331049
59300	26	2025-02-05 12:00:00	2025-02-05 13:00:00	f	2024-10-23 23:58:01.334105	2024-10-23 23:58:01.334105
59301	26	2025-02-05 13:00:00	2025-02-05 14:00:00	f	2024-10-23 23:58:01.336398	2024-10-23 23:58:01.336398
59302	26	2025-02-05 14:00:00	2025-02-05 15:00:00	f	2024-10-23 23:58:01.340145	2024-10-23 23:58:01.340145
59303	26	2025-02-05 15:00:00	2025-02-05 16:00:00	f	2024-10-23 23:58:01.343545	2024-10-23 23:58:01.343545
59304	26	2025-02-05 16:00:00	2025-02-05 17:00:00	f	2024-10-23 23:58:01.347337	2024-10-23 23:58:01.347337
59305	26	2025-02-05 17:00:00	2025-02-05 18:00:00	f	2024-10-23 23:58:01.354669	2024-10-23 23:58:01.354669
59306	26	2025-02-05 18:00:00	2025-02-05 19:00:00	f	2024-10-23 23:58:01.357309	2024-10-23 23:58:01.357309
59307	26	2025-02-05 19:00:00	2025-02-05 20:00:00	f	2024-10-23 23:58:01.360458	2024-10-23 23:58:01.360458
59308	26	2025-02-05 20:00:00	2025-02-05 21:00:00	f	2024-10-23 23:58:01.362945	2024-10-23 23:58:01.362945
59309	26	2025-02-06 10:00:00	2025-02-06 11:00:00	f	2024-10-23 23:58:01.365297	2024-10-23 23:58:01.365297
59310	26	2025-02-06 11:00:00	2025-02-06 12:00:00	f	2024-10-23 23:58:01.368552	2024-10-23 23:58:01.368552
59311	26	2025-02-06 12:00:00	2025-02-06 13:00:00	f	2024-10-23 23:58:01.370428	2024-10-23 23:58:01.370428
59312	26	2025-02-06 13:00:00	2025-02-06 14:00:00	f	2024-10-23 23:58:01.374149	2024-10-23 23:58:01.374149
59313	26	2025-02-06 14:00:00	2025-02-06 15:00:00	f	2024-10-23 23:58:01.377016	2024-10-23 23:58:01.377016
59314	26	2025-02-06 15:00:00	2025-02-06 16:00:00	f	2024-10-23 23:58:01.380615	2024-10-23 23:58:01.380615
59315	26	2025-02-06 16:00:00	2025-02-06 17:00:00	f	2024-10-23 23:58:01.383661	2024-10-23 23:58:01.383661
59316	26	2025-02-06 17:00:00	2025-02-06 18:00:00	f	2024-10-23 23:58:01.387722	2024-10-23 23:58:01.387722
59317	26	2025-02-06 18:00:00	2025-02-06 19:00:00	f	2024-10-23 23:58:01.390108	2024-10-23 23:58:01.390108
59318	26	2025-02-06 19:00:00	2025-02-06 20:00:00	f	2024-10-23 23:58:01.392562	2024-10-23 23:58:01.392562
59319	26	2025-02-06 20:00:00	2025-02-06 21:00:00	f	2024-10-23 23:58:01.39604	2024-10-23 23:58:01.39604
59320	26	2025-02-07 10:00:00	2025-02-07 11:00:00	f	2024-10-23 23:58:01.398213	2024-10-23 23:58:01.398213
59321	26	2025-02-07 11:00:00	2025-02-07 12:00:00	f	2024-10-23 23:58:01.401934	2024-10-23 23:58:01.401934
59322	26	2025-02-07 12:00:00	2025-02-07 13:00:00	f	2024-10-23 23:58:01.406103	2024-10-23 23:58:01.406103
59323	26	2025-02-07 13:00:00	2025-02-07 14:00:00	f	2024-10-23 23:58:01.410429	2024-10-23 23:58:01.410429
59324	26	2025-02-07 14:00:00	2025-02-07 15:00:00	f	2024-10-23 23:58:01.413435	2024-10-23 23:58:01.413435
59325	26	2025-02-07 15:00:00	2025-02-07 16:00:00	f	2024-10-23 23:58:01.417296	2024-10-23 23:58:01.417296
59326	26	2025-02-07 16:00:00	2025-02-07 17:00:00	f	2024-10-23 23:58:01.420396	2024-10-23 23:58:01.420396
59327	26	2025-02-07 17:00:00	2025-02-07 18:00:00	f	2024-10-23 23:58:01.424354	2024-10-23 23:58:01.424354
59328	26	2025-02-07 18:00:00	2025-02-07 19:00:00	f	2024-10-23 23:58:01.426857	2024-10-23 23:58:01.426857
59329	26	2025-02-07 19:00:00	2025-02-07 20:00:00	f	2024-10-23 23:58:01.429989	2024-10-23 23:58:01.429989
59330	26	2025-02-07 20:00:00	2025-02-07 21:00:00	f	2024-10-23 23:58:01.432678	2024-10-23 23:58:01.432678
59331	26	2025-02-08 10:00:00	2025-02-08 11:00:00	f	2024-10-23 23:58:01.437205	2024-10-23 23:58:01.437205
59332	26	2025-02-08 11:00:00	2025-02-08 12:00:00	f	2024-10-23 23:58:01.43949	2024-10-23 23:58:01.43949
59333	26	2025-02-08 12:00:00	2025-02-08 13:00:00	f	2024-10-23 23:58:01.442228	2024-10-23 23:58:01.442228
59334	26	2025-02-08 13:00:00	2025-02-08 14:00:00	f	2024-10-23 23:58:01.445215	2024-10-23 23:58:01.445215
59335	26	2025-02-08 14:00:00	2025-02-08 15:00:00	f	2024-10-23 23:58:01.447104	2024-10-23 23:58:01.447104
59336	26	2025-02-08 15:00:00	2025-02-08 16:00:00	f	2024-10-23 23:58:01.450985	2024-10-23 23:58:01.450985
59337	26	2025-02-08 16:00:00	2025-02-08 17:00:00	f	2024-10-23 23:58:01.453487	2024-10-23 23:58:01.453487
59338	26	2025-02-08 17:00:00	2025-02-08 18:00:00	f	2024-10-23 23:58:01.457133	2024-10-23 23:58:01.457133
59339	26	2025-02-08 18:00:00	2025-02-08 19:00:00	f	2024-10-23 23:58:01.460224	2024-10-23 23:58:01.460224
59340	26	2025-02-08 19:00:00	2025-02-08 20:00:00	f	2024-10-23 23:58:01.464007	2024-10-23 23:58:01.464007
59341	26	2025-02-08 20:00:00	2025-02-08 21:00:00	f	2024-10-23 23:58:01.467271	2024-10-23 23:58:01.467271
59342	26	2025-02-10 10:00:00	2025-02-10 11:00:00	f	2024-10-23 23:58:01.470635	2024-10-23 23:58:01.470635
59343	26	2025-02-10 11:00:00	2025-02-10 12:00:00	f	2024-10-23 23:58:01.473525	2024-10-23 23:58:01.473525
59344	26	2025-02-10 12:00:00	2025-02-10 13:00:00	f	2024-10-23 23:58:01.476508	2024-10-23 23:58:01.476508
59345	26	2025-02-10 13:00:00	2025-02-10 14:00:00	f	2024-10-23 23:58:01.479715	2024-10-23 23:58:01.479715
59346	26	2025-02-10 14:00:00	2025-02-10 15:00:00	f	2024-10-23 23:58:01.482674	2024-10-23 23:58:01.482674
59347	26	2025-02-10 15:00:00	2025-02-10 16:00:00	f	2024-10-23 23:58:01.485876	2024-10-23 23:58:01.485876
59348	26	2025-02-10 16:00:00	2025-02-10 17:00:00	f	2024-10-23 23:58:01.488283	2024-10-23 23:58:01.488283
59349	26	2025-02-10 17:00:00	2025-02-10 18:00:00	f	2024-10-23 23:58:01.491829	2024-10-23 23:58:01.491829
59350	26	2025-02-10 18:00:00	2025-02-10 19:00:00	f	2024-10-23 23:58:01.495253	2024-10-23 23:58:01.495253
59351	26	2025-02-10 19:00:00	2025-02-10 20:00:00	f	2024-10-23 23:58:01.499718	2024-10-23 23:58:01.499718
59352	26	2025-02-10 20:00:00	2025-02-10 21:00:00	f	2024-10-23 23:58:01.502163	2024-10-23 23:58:01.502163
59353	26	2025-02-11 10:00:00	2025-02-11 11:00:00	f	2024-10-23 23:58:01.505083	2024-10-23 23:58:01.505083
59354	26	2025-02-11 11:00:00	2025-02-11 12:00:00	f	2024-10-23 23:58:01.508396	2024-10-23 23:58:01.508396
59355	26	2025-02-11 12:00:00	2025-02-11 13:00:00	f	2024-10-23 23:58:01.511308	2024-10-23 23:58:01.511308
59356	26	2025-02-11 13:00:00	2025-02-11 14:00:00	f	2024-10-23 23:58:01.514853	2024-10-23 23:58:01.514853
59357	26	2025-02-11 14:00:00	2025-02-11 15:00:00	f	2024-10-23 23:58:01.517234	2024-10-23 23:58:01.517234
59358	26	2025-02-11 15:00:00	2025-02-11 16:00:00	f	2024-10-23 23:58:01.521024	2024-10-23 23:58:01.521024
59359	26	2025-02-11 16:00:00	2025-02-11 17:00:00	f	2024-10-23 23:58:01.523707	2024-10-23 23:58:01.523707
59360	26	2025-02-11 17:00:00	2025-02-11 18:00:00	f	2024-10-23 23:58:01.528176	2024-10-23 23:58:01.528176
59361	26	2025-02-11 18:00:00	2025-02-11 19:00:00	f	2024-10-23 23:58:01.530936	2024-10-23 23:58:01.530936
59362	26	2025-02-11 19:00:00	2025-02-11 20:00:00	f	2024-10-23 23:58:01.534631	2024-10-23 23:58:01.534631
59363	26	2025-02-11 20:00:00	2025-02-11 21:00:00	f	2024-10-23 23:58:01.53691	2024-10-23 23:58:01.53691
59364	26	2025-02-12 10:00:00	2025-02-12 11:00:00	f	2024-10-23 23:58:01.540548	2024-10-23 23:58:01.540548
59365	26	2025-02-12 11:00:00	2025-02-12 12:00:00	f	2024-10-23 23:58:01.543202	2024-10-23 23:58:01.543202
59366	26	2025-02-12 12:00:00	2025-02-12 13:00:00	f	2024-10-23 23:58:01.545897	2024-10-23 23:58:01.545897
59367	26	2025-02-12 13:00:00	2025-02-12 14:00:00	f	2024-10-23 23:58:01.548667	2024-10-23 23:58:01.548667
59368	26	2025-02-12 14:00:00	2025-02-12 15:00:00	f	2024-10-23 23:58:01.551096	2024-10-23 23:58:01.551096
59369	26	2025-02-12 15:00:00	2025-02-12 16:00:00	f	2024-10-23 23:58:01.554558	2024-10-23 23:58:01.554558
59370	26	2025-02-12 16:00:00	2025-02-12 17:00:00	f	2024-10-23 23:58:01.558191	2024-10-23 23:58:01.558191
59371	26	2025-02-12 17:00:00	2025-02-12 18:00:00	f	2024-10-23 23:58:01.562576	2024-10-23 23:58:01.562576
59372	26	2025-02-12 18:00:00	2025-02-12 19:00:00	f	2024-10-23 23:58:01.565067	2024-10-23 23:58:01.565067
59373	26	2025-02-12 19:00:00	2025-02-12 20:00:00	f	2024-10-23 23:58:01.568374	2024-10-23 23:58:01.568374
59374	26	2025-02-12 20:00:00	2025-02-12 21:00:00	f	2024-10-23 23:58:01.571181	2024-10-23 23:58:01.571181
59375	26	2025-02-13 10:00:00	2025-02-13 11:00:00	f	2024-10-23 23:58:01.573747	2024-10-23 23:58:01.573747
59376	26	2025-02-13 11:00:00	2025-02-13 12:00:00	f	2024-10-23 23:58:01.576979	2024-10-23 23:58:01.576979
59377	26	2025-02-13 12:00:00	2025-02-13 13:00:00	f	2024-10-23 23:58:01.579572	2024-10-23 23:58:01.579572
59378	26	2025-02-13 13:00:00	2025-02-13 14:00:00	f	2024-10-23 23:58:01.582897	2024-10-23 23:58:01.582897
59379	26	2025-02-13 14:00:00	2025-02-13 15:00:00	f	2024-10-23 23:58:01.585281	2024-10-23 23:58:01.585281
59380	26	2025-02-13 15:00:00	2025-02-13 16:00:00	f	2024-10-23 23:58:01.58897	2024-10-23 23:58:01.58897
59381	26	2025-02-13 16:00:00	2025-02-13 17:00:00	f	2024-10-23 23:58:01.591795	2024-10-23 23:58:01.591795
59382	26	2025-02-13 17:00:00	2025-02-13 18:00:00	f	2024-10-23 23:58:01.595499	2024-10-23 23:58:01.595499
59383	26	2025-02-13 18:00:00	2025-02-13 19:00:00	f	2024-10-23 23:58:01.598992	2024-10-23 23:58:01.598992
59384	26	2025-02-13 19:00:00	2025-02-13 20:00:00	f	2024-10-23 23:58:01.602347	2024-10-23 23:58:01.602347
59385	26	2025-02-13 20:00:00	2025-02-13 21:00:00	f	2024-10-23 23:58:01.605466	2024-10-23 23:58:01.605466
59386	26	2025-02-14 10:00:00	2025-02-14 11:00:00	f	2024-10-23 23:58:01.608159	2024-10-23 23:58:01.608159
59387	26	2025-02-14 11:00:00	2025-02-14 12:00:00	f	2024-10-23 23:58:01.611086	2024-10-23 23:58:01.611086
59388	26	2025-02-14 12:00:00	2025-02-14 13:00:00	f	2024-10-23 23:58:01.613459	2024-10-23 23:58:01.613459
59389	26	2025-02-14 13:00:00	2025-02-14 14:00:00	f	2024-10-23 23:58:01.616347	2024-10-23 23:58:01.616347
59390	26	2025-02-14 14:00:00	2025-02-14 15:00:00	f	2024-10-23 23:58:01.619663	2024-10-23 23:58:01.619663
59391	26	2025-02-14 15:00:00	2025-02-14 16:00:00	f	2024-10-23 23:58:01.623466	2024-10-23 23:58:01.623466
59392	26	2025-02-14 16:00:00	2025-02-14 17:00:00	f	2024-10-23 23:58:01.626734	2024-10-23 23:58:01.626734
59393	26	2025-02-14 17:00:00	2025-02-14 18:00:00	f	2024-10-23 23:58:01.630261	2024-10-23 23:58:01.630261
59394	26	2025-02-14 18:00:00	2025-02-14 19:00:00	f	2024-10-23 23:58:01.633386	2024-10-23 23:58:01.633386
59395	26	2025-02-14 19:00:00	2025-02-14 20:00:00	f	2024-10-23 23:58:01.636021	2024-10-23 23:58:01.636021
59396	26	2025-02-14 20:00:00	2025-02-14 21:00:00	f	2024-10-23 23:58:01.638885	2024-10-23 23:58:01.638885
59397	26	2025-02-15 10:00:00	2025-02-15 11:00:00	f	2024-10-23 23:58:01.641285	2024-10-23 23:58:01.641285
59398	26	2025-02-15 11:00:00	2025-02-15 12:00:00	f	2024-10-23 23:58:01.644663	2024-10-23 23:58:01.644663
59399	26	2025-02-15 12:00:00	2025-02-15 13:00:00	f	2024-10-23 23:58:01.647427	2024-10-23 23:58:01.647427
59400	26	2025-02-15 13:00:00	2025-02-15 14:00:00	f	2024-10-23 23:58:01.654887	2024-10-23 23:58:01.654887
59401	26	2025-02-15 14:00:00	2025-02-15 15:00:00	f	2024-10-23 23:58:01.660004	2024-10-23 23:58:01.660004
59402	26	2025-02-15 15:00:00	2025-02-15 16:00:00	f	2024-10-23 23:58:01.662668	2024-10-23 23:58:01.662668
59403	26	2025-02-15 16:00:00	2025-02-15 17:00:00	f	2024-10-23 23:58:01.66658	2024-10-23 23:58:01.66658
59404	26	2025-02-15 17:00:00	2025-02-15 18:00:00	f	2024-10-23 23:58:01.668699	2024-10-23 23:58:01.668699
59405	26	2025-02-15 18:00:00	2025-02-15 19:00:00	f	2024-10-23 23:58:01.672187	2024-10-23 23:58:01.672187
59406	26	2025-02-15 19:00:00	2025-02-15 20:00:00	f	2024-10-23 23:58:01.674824	2024-10-23 23:58:01.674824
59407	26	2025-02-15 20:00:00	2025-02-15 21:00:00	f	2024-10-23 23:58:01.676831	2024-10-23 23:58:01.676831
59408	26	2025-02-17 10:00:00	2025-02-17 11:00:00	f	2024-10-23 23:58:01.68064	2024-10-23 23:58:01.68064
59409	26	2025-02-17 11:00:00	2025-02-17 12:00:00	f	2024-10-23 23:58:01.683384	2024-10-23 23:58:01.683384
59410	26	2025-02-17 12:00:00	2025-02-17 13:00:00	f	2024-10-23 23:58:01.686901	2024-10-23 23:58:01.686901
59411	26	2025-02-17 13:00:00	2025-02-17 14:00:00	f	2024-10-23 23:58:01.689003	2024-10-23 23:58:01.689003
59412	26	2025-02-17 14:00:00	2025-02-17 15:00:00	f	2024-10-23 23:58:01.691732	2024-10-23 23:58:01.691732
59413	26	2025-02-17 15:00:00	2025-02-17 16:00:00	f	2024-10-23 23:58:01.694944	2024-10-23 23:58:01.694944
59414	26	2025-02-17 16:00:00	2025-02-17 17:00:00	f	2024-10-23 23:58:01.698687	2024-10-23 23:58:01.698687
59415	26	2025-02-17 17:00:00	2025-02-17 18:00:00	f	2024-10-23 23:58:01.701646	2024-10-23 23:58:01.701646
59416	26	2025-02-17 18:00:00	2025-02-17 19:00:00	f	2024-10-23 23:58:01.704754	2024-10-23 23:58:01.704754
59417	26	2025-02-17 19:00:00	2025-02-17 20:00:00	f	2024-10-23 23:58:01.708445	2024-10-23 23:58:01.708445
59418	26	2025-02-17 20:00:00	2025-02-17 21:00:00	f	2024-10-23 23:58:01.711068	2024-10-23 23:58:01.711068
59419	26	2025-02-18 10:00:00	2025-02-18 11:00:00	f	2024-10-23 23:58:01.715537	2024-10-23 23:58:01.715537
59420	26	2025-02-18 11:00:00	2025-02-18 12:00:00	f	2024-10-23 23:58:01.71817	2024-10-23 23:58:01.71817
59421	26	2025-02-18 12:00:00	2025-02-18 13:00:00	f	2024-10-23 23:58:01.722279	2024-10-23 23:58:01.722279
59422	26	2025-02-18 13:00:00	2025-02-18 14:00:00	f	2024-10-23 23:58:01.72447	2024-10-23 23:58:01.72447
59423	26	2025-02-18 14:00:00	2025-02-18 15:00:00	f	2024-10-23 23:58:01.72728	2024-10-23 23:58:01.72728
59424	26	2025-02-18 15:00:00	2025-02-18 16:00:00	f	2024-10-23 23:58:01.729807	2024-10-23 23:58:01.729807
59425	26	2025-02-18 16:00:00	2025-02-18 17:00:00	f	2024-10-23 23:58:01.731766	2024-10-23 23:58:01.731766
59426	26	2025-02-18 17:00:00	2025-02-18 18:00:00	f	2024-10-23 23:58:01.735339	2024-10-23 23:58:01.735339
59427	26	2025-02-18 18:00:00	2025-02-18 19:00:00	f	2024-10-23 23:58:01.737896	2024-10-23 23:58:01.737896
59428	26	2025-02-18 19:00:00	2025-02-18 20:00:00	f	2024-10-23 23:58:01.741017	2024-10-23 23:58:01.741017
59429	26	2025-02-18 20:00:00	2025-02-18 21:00:00	f	2024-10-23 23:58:01.744384	2024-10-23 23:58:01.744384
59430	26	2025-02-19 10:00:00	2025-02-19 11:00:00	f	2024-10-23 23:58:01.749026	2024-10-23 23:58:01.749026
59431	26	2025-02-19 11:00:00	2025-02-19 12:00:00	f	2024-10-23 23:58:01.751371	2024-10-23 23:58:01.751371
59432	26	2025-02-19 12:00:00	2025-02-19 13:00:00	f	2024-10-23 23:58:01.754207	2024-10-23 23:58:01.754207
59433	26	2025-02-19 13:00:00	2025-02-19 14:00:00	f	2024-10-23 23:58:01.757217	2024-10-23 23:58:01.757217
59434	26	2025-02-19 14:00:00	2025-02-19 15:00:00	f	2024-10-23 23:58:01.759085	2024-10-23 23:58:01.759085
59435	26	2025-02-19 15:00:00	2025-02-19 16:00:00	f	2024-10-23 23:58:01.762768	2024-10-23 23:58:01.762768
59436	26	2025-02-19 16:00:00	2025-02-19 17:00:00	f	2024-10-23 23:58:01.765171	2024-10-23 23:58:01.765171
59437	26	2025-02-19 17:00:00	2025-02-19 18:00:00	f	2024-10-23 23:58:01.767767	2024-10-23 23:58:01.767767
59438	26	2025-02-19 18:00:00	2025-02-19 19:00:00	f	2024-10-23 23:58:01.770625	2024-10-23 23:58:01.770625
59439	26	2025-02-19 19:00:00	2025-02-19 20:00:00	f	2024-10-23 23:58:01.772648	2024-10-23 23:58:01.772648
59440	26	2025-02-19 20:00:00	2025-02-19 21:00:00	f	2024-10-23 23:58:01.774963	2024-10-23 23:58:01.774963
59441	26	2025-02-20 10:00:00	2025-02-20 11:00:00	f	2024-10-23 23:58:01.779267	2024-10-23 23:58:01.779267
59442	26	2025-02-20 11:00:00	2025-02-20 12:00:00	f	2024-10-23 23:58:01.782682	2024-10-23 23:58:01.782682
59443	26	2025-02-20 12:00:00	2025-02-20 13:00:00	f	2024-10-23 23:58:01.785887	2024-10-23 23:58:01.785887
59444	26	2025-02-20 13:00:00	2025-02-20 14:00:00	f	2024-10-23 23:58:01.788676	2024-10-23 23:58:01.788676
59445	26	2025-02-20 14:00:00	2025-02-20 15:00:00	f	2024-10-23 23:58:01.791972	2024-10-23 23:58:01.791972
59446	26	2025-02-20 15:00:00	2025-02-20 16:00:00	f	2024-10-23 23:58:01.794244	2024-10-23 23:58:01.794244
59447	26	2025-02-20 16:00:00	2025-02-20 17:00:00	f	2024-10-23 23:58:01.797592	2024-10-23 23:58:01.797592
59448	26	2025-02-20 17:00:00	2025-02-20 18:00:00	f	2024-10-23 23:58:01.800474	2024-10-23 23:58:01.800474
59449	26	2025-02-20 18:00:00	2025-02-20 19:00:00	f	2024-10-23 23:58:01.80315	2024-10-23 23:58:01.80315
59450	26	2025-02-20 19:00:00	2025-02-20 20:00:00	f	2024-10-23 23:58:01.806251	2024-10-23 23:58:01.806251
59451	26	2025-02-20 20:00:00	2025-02-20 21:00:00	f	2024-10-23 23:58:01.810085	2024-10-23 23:58:01.810085
59452	26	2025-02-21 10:00:00	2025-02-21 11:00:00	f	2024-10-23 23:58:01.813611	2024-10-23 23:58:01.813611
59453	26	2025-02-21 11:00:00	2025-02-21 12:00:00	f	2024-10-23 23:58:01.816845	2024-10-23 23:58:01.816845
59454	26	2025-02-21 12:00:00	2025-02-21 13:00:00	f	2024-10-23 23:58:01.82127	2024-10-23 23:58:01.82127
59455	26	2025-02-21 13:00:00	2025-02-21 14:00:00	f	2024-10-23 23:58:01.825611	2024-10-23 23:58:01.825611
59456	26	2025-02-21 14:00:00	2025-02-21 15:00:00	f	2024-10-23 23:58:01.828498	2024-10-23 23:58:01.828498
59457	26	2025-02-21 15:00:00	2025-02-21 16:00:00	f	2024-10-23 23:58:01.832103	2024-10-23 23:58:01.832103
59458	26	2025-02-21 16:00:00	2025-02-21 17:00:00	f	2024-10-23 23:58:01.835291	2024-10-23 23:58:01.835291
59459	26	2025-02-21 17:00:00	2025-02-21 18:00:00	f	2024-10-23 23:58:01.838176	2024-10-23 23:58:01.838176
59460	26	2025-02-21 18:00:00	2025-02-21 19:00:00	f	2024-10-23 23:58:01.841814	2024-10-23 23:58:01.841814
59461	26	2025-02-21 19:00:00	2025-02-21 20:00:00	f	2024-10-23 23:58:01.844726	2024-10-23 23:58:01.844726
59462	26	2025-02-21 20:00:00	2025-02-21 21:00:00	f	2024-10-23 23:58:01.847861	2024-10-23 23:58:01.847861
55344	23	2024-10-26 14:00:00	2024-10-26 15:00:00	t	2024-10-22 22:35:34.0478	2024-10-24 16:09:26.971405
55400	23	2024-11-01 10:00:00	2024-11-01 11:00:00	t	2024-10-22 22:35:34.210858	2024-10-24 20:17:38.19217
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: loris01
--

COPY public.users (id, email, password_digest, created_at, updated_at, reset_password_token, reset_password_sent_at, remember_created_at, uid, provider, confirmed_at, confirmation_token, confirmation_sent_at) FROM stdin;
5	ciao@ciao.it	$2a$12$KHSKf9HdP1nNAdMRWk3wg.zYOgCN0Z9I6W5AeL8JCrtcsi927HKiu	2024-10-04 23:52:50.928991	2024-10-04 23:52:50.928991	\N	\N	\N	\N	\N	\N	\N	\N
8	campetto.it@gmail.com	$2a$12$X1OLWs4R.TINN.Y1vUvyTOz4VknLPcG6HCJNfETo7H/UBnm7cQRDa	2024-10-08 20:12:59.74836	2024-10-08 20:12:59.74836	\N	\N	\N	118002643941574265415	google_oauth2	\N	\N	\N
14	ziopera@gmail.com	$2a$12$pvUQZ3Lbl0PcOHUV7Eyu6OzRJAE0CkeAEhZbkUtl7Fq0iGHidcZl2	2024-10-14 15:01:18.859839	2024-10-14 15:01:48.111204	\N	\N	\N	\N	\N	2024-10-14 15:01:48.102566	\N	\N
13	claudiopandolfi01@gmail.com	$2a$12$RBWl92YgFy499uzlGmtF9.Z9gmxVgYhdoIdNRHkKGlkEm3xeIryAy	2024-10-10 16:08:20.190766	2024-10-10 16:10:03.015694	\N	\N	\N	\N	\N	2024-10-10 16:10:02.994212	\N	\N
11	prova@prova.com	$2a$12$GqgEv8vtOHa5GXu0FO8Yu.KgstSaDNoT15UsqLafbXOz/hz5hm3L2	2024-10-09 19:47:33.889247	2024-10-12 14:59:52.960828	\N	\N	\N	\N	\N	2024-10-09 19:48:24.961407	\N	\N
1	loris.abbruzzo1@gmail.com	$2a$12$LQyBCFgQNZO9ax4V4TfxTeBS/PxCiOZs0fn4BMOGNbo/89XXw.i4K	2024-10-04 22:46:20.360933	2024-10-15 09:57:17.38667	2e0wA7gUoXmZKTbjJU6cYQ	2024-10-15 09:57:17.381261	\N	112986513412172654300	google_oauth2	\N	\N	\N
18	abbruzzo.crypto@gmail.com	$2a$12$lAuQQMeYiAvhyFQ96pg0rews0GHBDzkjHNJ3QA5KvLSvt.Oy3mRe6	2024-10-23 18:01:32.309533	2024-10-23 18:03:22.523918	\N	\N	\N	\N	\N	2024-10-23 18:03:22.513756	\N	2024-10-23 18:01:32.30011
12	abbruzzo.1945077@studenti.uniroma1.it	$2a$12$mVLQXCOLEZTbH/Vbhme8C.HN7VJ0M/ilLRBdN2xTobOm6YLADfceC	2024-10-10 10:39:17.158017	2024-10-23 19:17:02.613094	bvO9R5TcSYSvU-DATcsFcA	2024-10-23 19:17:02.601971	\N	\N	\N	2024-10-10 10:39:31.46539	\N	\N
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: loris01
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 21, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: loris01
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 21, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: loris01
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: administrators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: loris01
--

SELECT pg_catalog.setval('public.administrators_id_seq', 3, true);


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: loris01
--

SELECT pg_catalog.setval('public.bookings_id_seq', 59, true);


--
-- Name: fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: loris01
--

SELECT pg_catalog.setval('public.fields_id_seq', 26, true);


--
-- Name: partners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: loris01
--

SELECT pg_catalog.setval('public.partners_id_seq', 1, false);


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: loris01
--

SELECT pg_catalog.setval('public.reports_id_seq', 8, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: loris01
--

SELECT pg_catalog.setval('public.reviews_id_seq', 4, true);


--
-- Name: slots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: loris01
--

SELECT pg_catalog.setval('public.slots_id_seq', 59462, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: loris01
--

SELECT pg_catalog.setval('public.users_id_seq', 18, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: administrators administrators_pkey; Type: CONSTRAINT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.administrators
    ADD CONSTRAINT administrators_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: fields fields_pkey; Type: CONSTRAINT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.fields
    ADD CONSTRAINT fields_pkey PRIMARY KEY (id);


--
-- Name: partners partners_pkey; Type: CONSTRAINT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);


--
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: slots slots_pkey; Type: CONSTRAINT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.slots
    ADD CONSTRAINT slots_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: loris01
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: loris01
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: loris01
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: loris01
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_administrators_on_email; Type: INDEX; Schema: public; Owner: loris01
--

CREATE UNIQUE INDEX index_administrators_on_email ON public.administrators USING btree (email);


--
-- Name: index_bookings_on_slot_id; Type: INDEX; Schema: public; Owner: loris01
--

CREATE INDEX index_bookings_on_slot_id ON public.bookings USING btree (slot_id);


--
-- Name: index_bookings_on_user_id; Type: INDEX; Schema: public; Owner: loris01
--

CREATE INDEX index_bookings_on_user_id ON public.bookings USING btree (user_id);


--
-- Name: index_partners_on_email; Type: INDEX; Schema: public; Owner: loris01
--

CREATE UNIQUE INDEX index_partners_on_email ON public.partners USING btree (email);


--
-- Name: index_reports_on_reportable_type_and_reportable_id; Type: INDEX; Schema: public; Owner: loris01
--

CREATE INDEX index_reports_on_reportable_type_and_reportable_id ON public.reports USING btree (reportable_type, reportable_id);


--
-- Name: index_reports_on_reporter_type_and_reporter_id; Type: INDEX; Schema: public; Owner: loris01
--

CREATE INDEX index_reports_on_reporter_type_and_reporter_id ON public.reports USING btree (reporter_type, reporter_id);


--
-- Name: index_reviews_on_field_id; Type: INDEX; Schema: public; Owner: loris01
--

CREATE INDEX index_reviews_on_field_id ON public.reviews USING btree (field_id);


--
-- Name: index_reviews_on_user_id; Type: INDEX; Schema: public; Owner: loris01
--

CREATE INDEX index_reviews_on_user_id ON public.reviews USING btree (user_id);


--
-- Name: index_slots_on_field_id; Type: INDEX; Schema: public; Owner: loris01
--

CREATE INDEX index_slots_on_field_id ON public.slots USING btree (field_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: loris01
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: bookings fk_rails_0a3d146c03; Type: FK CONSTRAINT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT fk_rails_0a3d146c03 FOREIGN KEY (slot_id) REFERENCES public.slots(id);


--
-- Name: reviews fk_rails_4c387f0c9b; Type: FK CONSTRAINT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_rails_4c387f0c9b FOREIGN KEY (field_id) REFERENCES public.fields(id);


--
-- Name: reviews fk_rails_74a66bd6c5; Type: FK CONSTRAINT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_rails_74a66bd6c5 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: slots fk_rails_c29d7ccbcd; Type: FK CONSTRAINT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.slots
    ADD CONSTRAINT fk_rails_c29d7ccbcd FOREIGN KEY (field_id) REFERENCES public.fields(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: bookings fk_rails_ef0571f117; Type: FK CONSTRAINT; Schema: public; Owner: loris01
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT fk_rails_ef0571f117 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

