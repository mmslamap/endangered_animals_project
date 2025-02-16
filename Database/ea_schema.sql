--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-02-16 13:04:36

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
-- TOC entry 226 (class 1259 OID 25010)
-- Name: animal_countries; Type: TABLE; Schema: public; Owner: mikol
--

CREATE TABLE public.animal_countries (
    animal_id integer NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.animal_countries OWNER TO mikol;

--
-- TOC entry 225 (class 1259 OID 25005)
-- Name: animal_threats; Type: TABLE; Schema: public; Owner: mikol
--

CREATE TABLE public.animal_threats (
    animal_id integer NOT NULL,
    threat_id integer NOT NULL
);


ALTER TABLE public.animal_threats OWNER TO mikol;

--
-- TOC entry 219 (class 1259 OID 24969)
-- Name: animals; Type: TABLE; Schema: public; Owner: mikol
--

CREATE TABLE public.animals (
    id integer NOT NULL,
    common_name character varying,
    scientific_name character varying,
    red_list_category character varying,
    possibly_extinct_in_the_wild boolean
);


ALTER TABLE public.animals OWNER TO mikol;

--
-- TOC entry 221 (class 1259 OID 24979)
-- Name: countries; Type: TABLE; Schema: public; Owner: mikol
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.countries OWNER TO mikol;

--
-- TOC entry 220 (class 1259 OID 24978)
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: mikol
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.countries_id_seq OWNER TO mikol;

--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 220
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikol
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- TOC entry 223 (class 1259 OID 24990)
-- Name: threats; Type: TABLE; Schema: public; Owner: mikol
--

CREATE TABLE public.threats (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.threats OWNER TO mikol;

--
-- TOC entry 222 (class 1259 OID 24989)
-- Name: threats_id_seq; Type: SEQUENCE; Schema: public; Owner: mikol
--

CREATE SEQUENCE public.threats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.threats_id_seq OWNER TO mikol;

--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 222
-- Name: threats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikol
--

ALTER SEQUENCE public.threats_id_seq OWNED BY public.threats.id;


--
-- TOC entry 224 (class 1259 OID 25000)
-- Name: user_animals; Type: TABLE; Schema: public; Owner: mikol
--

CREATE TABLE public.user_animals (
    user_id integer NOT NULL,
    animal_id integer NOT NULL
);


ALTER TABLE public.user_animals OWNER TO mikol;

--
-- TOC entry 218 (class 1259 OID 24959)
-- Name: users; Type: TABLE; Schema: public; Owner: mikol
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying,
    password_hash character varying,
    role character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO mikol;

--
-- TOC entry 217 (class 1259 OID 24958)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: mikol
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO mikol;

--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikol
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4722 (class 2604 OID 24982)
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: mikol
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- TOC entry 4723 (class 2604 OID 24993)
-- Name: threats id; Type: DEFAULT; Schema: public; Owner: mikol
--

ALTER TABLE ONLY public.threats ALTER COLUMN id SET DEFAULT nextval('public.threats_id_seq'::regclass);


--
-- TOC entry 4721 (class 2604 OID 24962)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: mikol
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4906 (class 0 OID 25010)
-- Dependencies: 226
-- Data for Name: animal_countries; Type: TABLE DATA; Schema: public; Owner: mikol
--

COPY public.animal_countries (animal_id, country_id) FROM stdin;
184792852	13
116353813	24
116353813	18
756253	16
249120158	8
80220205	19
80220205	7
80219567	19
80219567	7
168907959	20
168907959	21
201057592	19
201057592	7
79862844	19
79862844	7
51056445	23
51056445	11
1984964	4
1984964	9
99550795	22
45813838	3
45813838	1
45813838	14
45813838	10
45813838	6
45813838	15
45813838	12
80174429	19
80174429	7
2884829	2
2006883	5
2006883	18
80220397	19
80220397	7
54341110	17
173927929	5
173927929	18
56301947	17
\.


--
-- TOC entry 4905 (class 0 OID 25005)
-- Dependencies: 225
-- Data for Name: animal_threats; Type: TABLE DATA; Schema: public; Owner: mikol
--

COPY public.animal_threats (animal_id, threat_id) FROM stdin;
184792852	21
184792852	1
184792852	19
184792852	10
116353813	19
756253	21
249120158	21
249120158	11
249120158	15
249120158	16
80220205	14
80220205	3
168907959	22
168907959	12
168907959	11
79862844	17
1984964	5
99550795	3
99550795	18
80174429	20
80174429	3
2884829	5
2006883	24
2006883	2
80220397	20
80220397	3
80220397	13
54341110	4
54341110	6
54341110	10
54341110	8
54341110	21
54341110	11
54341110	23
54341110	7
54341110	9
54341110	22
54341110	19
173927929	6
56301947	5
\.


--
-- TOC entry 4899 (class 0 OID 24969)
-- Dependencies: 219
-- Data for Name: animals; Type: TABLE DATA; Schema: public; Owner: mikol
--

COPY public.animals (id, common_name, scientific_name, red_list_category, possibly_extinct_in_the_wild) FROM stdin;
184792852	Cocuyo	Diospyros domingensis subsp. oxycarpa	Critically Endangered	t
116353813	N/A	Agave fortiflora	Critically Endangered	t
756253	N/A	Celosia patentiloba	Critically Endangered	t
249120158	N/A	Lophura edwardsi	Critically Endangered	t
80220205	N/A	Stenogyne bifida	Critically Endangered	t
80219567	N/A	Silene perlmanii	Critically Endangered	t
168907959	N/A	Calophyllum calcicola	Critically Endangered	t
201057592	N/A	Ranunculus hawaiensis	Critically Endangered	t
79862844	N/A	Delissea rhytidosperma	Critically Endangered	t
51056445	N/A	Encephalartos hirsutus	Critically Endangered	t
1984964	N/A	Quercus albicaulis	Critically Endangered	t
99550795	N/A	Hibiscus storckii	Critically Endangered	t
45813838	Square-lipped Rhinoceros	Ceratotherium simum ssp. cottoni	Critically Endangered	t
80174429	N/A	Phyllostegia mannii	Critically Endangered	t
2884829	N/A	Magnolia wolfii	Critically Endangered	t
2006883	N/A	Gobiesox juniperoserrai	Critically Endangered	t
80220397	N/A	Stenogyne kanehoana	Critically Endangered	t
54341110	N/A	Atelopus zeteki	Critically Endangered	t
173927929	N/A	Gossypium armourianum	Critically Endangered	t
56301947	N/A	Costus vinosus	Critically Endangered	t
\.


--
-- TOC entry 4901 (class 0 OID 24979)
-- Dependencies: 221
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: mikol
--

COPY public.countries (id, name) FROM stdin;
1	Central African Republic
2	Colombia
3	Kenya
4	Hainan
5	Baja California Sur
6	Uganda
7	United States
8	Viet Nam
9	China
10	Congo, The Democratic Republic of the
11	South Africa
12	Sudan
13	Haiti
14	Chad
15	South Sudan
16	Tanzania, United Republic of
17	Panama
18	Mexico
19	Hawaiian Is.
20	Kalimantan
21	Indonesia
22	Fiji
23	Limpopo Province
24	Sonora
\.


--
-- TOC entry 4903 (class 0 OID 24990)
-- Dependencies: 223
-- Data for Name: threats; Type: TABLE DATA; Schema: public; Owner: mikol
--

COPY public.threats (id, name) FROM stdin;
1	Nomadic grazing
2	Droughts
3	Habitat shifting & alteration
4	Agro-industry grazing, ranching or farming
5	Scale Unknown/Unrecorded
6	Tourism & recreation areas
7	Small-holder plantations
8	Housing & urban areas
9	Roads & railroads
10	Small-holder farming
11	Agro-industry farming
12	Mining & quarrying
13	Problematic native species/diseases
14	Avalanches/landslides
15	War, civil unrest & military exercises
16	Agro-industry plantations
17	Other threat
18	Storms & flooding
19	Small-holder grazing, ranching or farming
20	Increase in fire frequency/intensity
21	Shifting agriculture
22	Commercial & industrial areas
23	Soil erosion, sedimentation
24	Abstraction of ground water (unknown use)
\.


--
-- TOC entry 4904 (class 0 OID 25000)
-- Dependencies: 224
-- Data for Name: user_animals; Type: TABLE DATA; Schema: public; Owner: mikol
--

COPY public.user_animals (user_id, animal_id) FROM stdin;
\.


--
-- TOC entry 4898 (class 0 OID 24959)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: mikol
--

COPY public.users (id, username, password_hash, role, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 220
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikol
--

SELECT pg_catalog.setval('public.countries_id_seq', 72, true);


--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 222
-- Name: threats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikol
--

SELECT pg_catalog.setval('public.threats_id_seq', 72, true);


--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikol
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 4745 (class 2606 OID 25014)
-- Name: animal_countries animal_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: mikol
--

ALTER TABLE ONLY public.animal_countries
    ADD CONSTRAINT animal_countries_pkey PRIMARY KEY (animal_id, country_id);


--
-- TOC entry 4743 (class 2606 OID 25009)
-- Name: animal_threats animal_threats_pkey; Type: CONSTRAINT; Schema: public; Owner: mikol
--

ALTER TABLE ONLY public.animal_threats
    ADD CONSTRAINT animal_threats_pkey PRIMARY KEY (animal_id, threat_id);


--
-- TOC entry 4729 (class 2606 OID 24975)
-- Name: animals animals_pkey; Type: CONSTRAINT; Schema: public; Owner: mikol
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (id);


--
-- TOC entry 4731 (class 2606 OID 24977)
-- Name: animals animals_scientific_name_key; Type: CONSTRAINT; Schema: public; Owner: mikol
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_scientific_name_key UNIQUE (scientific_name);


--
-- TOC entry 4733 (class 2606 OID 24988)
-- Name: countries countries_name_key; Type: CONSTRAINT; Schema: public; Owner: mikol
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_name_key UNIQUE (name);


--
-- TOC entry 4735 (class 2606 OID 24986)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: mikol
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 4737 (class 2606 OID 24999)
-- Name: threats threats_name_key; Type: CONSTRAINT; Schema: public; Owner: mikol
--

ALTER TABLE ONLY public.threats
    ADD CONSTRAINT threats_name_key UNIQUE (name);


--
-- TOC entry 4739 (class 2606 OID 24997)
-- Name: threats threats_pkey; Type: CONSTRAINT; Schema: public; Owner: mikol
--

ALTER TABLE ONLY public.threats
    ADD CONSTRAINT threats_pkey PRIMARY KEY (id);


--
-- TOC entry 4741 (class 2606 OID 25004)
-- Name: user_animals user_animals_pkey; Type: CONSTRAINT; Schema: public; Owner: mikol
--

ALTER TABLE ONLY public.user_animals
    ADD CONSTRAINT user_animals_pkey PRIMARY KEY (user_id, animal_id);


--
-- TOC entry 4725 (class 2606 OID 24966)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: mikol
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4727 (class 2606 OID 24968)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: mikol
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4750 (class 2606 OID 25035)
-- Name: animal_countries animal_countries_animal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikol
--

ALTER TABLE ONLY public.animal_countries
    ADD CONSTRAINT animal_countries_animal_id_fkey FOREIGN KEY (animal_id) REFERENCES public.animals(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4751 (class 2606 OID 25040)
-- Name: animal_countries animal_countries_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikol
--

ALTER TABLE ONLY public.animal_countries
    ADD CONSTRAINT animal_countries_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- TOC entry 4748 (class 2606 OID 25025)
-- Name: animal_threats animal_threats_animal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikol
--

ALTER TABLE ONLY public.animal_threats
    ADD CONSTRAINT animal_threats_animal_id_fkey FOREIGN KEY (animal_id) REFERENCES public.animals(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4749 (class 2606 OID 25030)
-- Name: animal_threats animal_threats_threat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikol
--

ALTER TABLE ONLY public.animal_threats
    ADD CONSTRAINT animal_threats_threat_id_fkey FOREIGN KEY (threat_id) REFERENCES public.threats(id);


--
-- TOC entry 4746 (class 2606 OID 25020)
-- Name: user_animals user_animals_animal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikol
--

ALTER TABLE ONLY public.user_animals
    ADD CONSTRAINT user_animals_animal_id_fkey FOREIGN KEY (animal_id) REFERENCES public.animals(id);


--
-- TOC entry 4747 (class 2606 OID 25015)
-- Name: user_animals user_animals_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikol
--

ALTER TABLE ONLY public.user_animals
    ADD CONSTRAINT user_animals_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2025-02-16 13:04:36

--
-- PostgreSQL database dump complete
--

