--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)

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
-- Name: locations; Type: TABLE; Schema: public; Owner: alan
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    city text NOT NULL
);


ALTER TABLE public.locations OWNER TO alan;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: alan
--

CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO alan;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alan
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: weathers; Type: TABLE; Schema: public; Owner: alan
--

CREATE TABLE public.weathers (
    id integer NOT NULL,
    lon double precision,
    lat double precision,
    temp double precision,
    feels_like double precision,
    temp_min double precision,
    temp_max double precision,
    pressure integer,
    humidity integer,
    visibility integer,
    wind_speed double precision,
    wind_deg integer,
    last_update timestamp without time zone,
    location_id integer
);


ALTER TABLE public.weathers OWNER TO alan;

--
-- Name: weathers_id_seq; Type: SEQUENCE; Schema: public; Owner: alan
--

CREATE SEQUENCE public.weathers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weathers_id_seq OWNER TO alan;

--
-- Name: weathers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alan
--

ALTER SEQUENCE public.weathers_id_seq OWNED BY public.weathers.id;


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: alan
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: weathers id; Type: DEFAULT; Schema: public; Owner: alan
--

ALTER TABLE ONLY public.weathers ALTER COLUMN id SET DEFAULT nextval('public.weathers_id_seq'::regclass);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: alan
--

COPY public.locations (id, city) FROM stdin;
1	Toronto
2	Vancouver
3	Montreal
4	Los Angeles
\.


--
-- Data for Name: weathers; Type: TABLE DATA; Schema: public; Owner: alan
--

COPY public.weathers (id, lon, lat, temp, feels_like, temp_min, temp_max, pressure, humidity, visibility, wind_speed, wind_deg, last_update, location_id) FROM stdin;
1	-79.4163	43.7001	16.82	15.99	15	18	1004	55	10000	3.74	82	2021-04-10 20:23:15.445511	1
2	-123.1193	49.2497	9.52	-0.12	8.89	10.56	1024	49	10000	10.8	270	2021-04-10 20:23:19.361535	2
3	-73.5878	45.5088	19.8	19.04	17.22	22	1007	46	10000	0.51	170	2021-04-10 20:23:23.816683	3
4	-118.2437	34.0522	21.54	20.87	17.22	25	1009	43	10000	1.54	0	2021-04-10 20:23:30.142673	4
5	-79.4163	43.7001	17.09	16.4	15.56	18	1003	59	10000	3.58	77	2021-04-10 20:26:06.080513	1
6	-73.5878	45.5088	18.46	17.8	16.67	19.44	1007	55	10000	1.03	320	2021-04-10 20:26:11.069607	3
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alan
--

SELECT pg_catalog.setval('public.locations_id_seq', 4, true);


--
-- Name: weathers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alan
--

SELECT pg_catalog.setval('public.weathers_id_seq', 7, true);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: alan
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: weathers weathers_pkey; Type: CONSTRAINT; Schema: public; Owner: alan
--

ALTER TABLE ONLY public.weathers
    ADD CONSTRAINT weathers_pkey PRIMARY KEY (id);


--
-- Name: weathers weathers_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: alan
--

ALTER TABLE ONLY public.weathers
    ADD CONSTRAINT weathers_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- PostgreSQL database dump complete
--

