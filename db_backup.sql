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
1	-123.1193	49.2497	8.02	3.77	6.67	9.44	1025	53	10000	9.26	270	2021-04-10 22:28:30.674441	2
2	-123.1193	49.2497	8.02	3.77	6.67	9.44	1025	53	10000	9.26	270	2021-04-10 22:28:35.825436	2
3	-123.1193	49.2497	8.02	3.77	6.67	9.44	1025	53	10000	9.26	270	2021-04-10 22:28:36.974581	2
4	-123.1193	49.2497	8.02	3.77	6.67	9.44	1025	53	10000	9.26	270	2021-04-10 22:28:42.1085	2
5	-123.1193	49.2497	8.02	3.77	6.67	9.44	1025	53	10000	9.26	270	2021-04-10 22:28:54.717755	2
6	-123.1193	49.2497	8.02	3.77	6.67	9.44	1025	53	10000	9.26	270	2021-04-10 22:28:59.85801	2
7	-123.1193	49.2497	7.88	3.58	7	8.89	1025	53	10000	9.26	270	2021-04-10 22:35:42.185093	2
8	-123.1193	49.2497	7.88	3.58	7	8.89	1025	53	10000	9.26	270	2021-04-10 22:36:02.345269	2
9	-123.1193	49.2497	7.88	3.58	7	8.89	1025	53	10000	9.26	270	2021-04-10 22:37:41.710796	2
10	-123.1193	49.2497	7.88	3.58	7	8.89	1025	53	10000	9.26	270	2021-04-10 22:38:01.909426	2
11	-123.1193	49.2497	7.88	3.58	7	8.89	1025	53	10000	9.26	270	2021-04-10 22:38:21.267378	2
12	-123.1193	49.2497	7.88	3.58	7	8.89	1025	53	10000	9.26	270	2021-04-10 22:38:41.498221	2
13	-123.1193	49.2497	5.42	0.98	3.89	7.22	1025	61	10000	7.2	290	2021-04-11 00:44:47.808706	2
14	-123.1193	49.2497	5.42	0.98	3.89	7.22	1025	61	10000	7.2	290	2021-04-11 00:45:00.143888	2
15	-123.1193	49.2497	5.42	0.98	3.89	7.22	1025	61	10000	7.2	290	2021-04-11 00:45:00.154872	2
16	-123.1193	49.2497	5.42	0.98	3.89	7.22	1025	61	10000	7.2	290	2021-04-11 00:45:20.369241	2
17	-123.1193	49.2497	5.42	0.98	3.89	7.22	1025	61	10000	7.2	290	2021-04-11 00:45:20.369874	2
18	-123.1193	49.2497	4.92	0.34	2.78	7.78	1025	61	10000	7.2	290	2021-04-11 00:56:20.931443	2
19	-123.1193	49.2497	4.92	0.34	2.78	7.78	1025	61	10000	7.2	290	2021-04-11 00:56:47.178653	2
20	-123.1193	49.2497	4.92	0.34	2.78	7.78	1025	61	10000	7.2	290	2021-04-11 01:00:52.48169	2
21	-123.1193	49.2497	4.92	0.34	2.78	7.78	1025	61	10000	7.2	290	2021-04-11 01:01:07.760428	2
22	-123.1193	49.2497	4.92	0.34	2.78	7.78	1025	61	10000	7.2	290	2021-04-11 01:01:28.026122	2
23	-123.1193	49.2497	4.92	0.34	2.78	7.78	1025	61	10000	7.2	290	2021-04-11 01:02:05.525689	2
24	-123.1193	49.2497	4.92	0.34	2.78	7.78	1025	61	10000	7.2	290	2021-04-11 01:02:25.738469	2
25	-123.1193	49.2497	4.69	0.04	2.78	7.22	1025	61	10000	7.2	290	2021-04-11 01:08:56.29784	2
26	-123.1193	49.2497	4.69	0.04	2.78	7.22	1025	61	10000	7.2	290	2021-04-11 01:09:07.654303	2
27	-123.1193	49.2497	4.69	0.04	2.78	7.22	1025	61	10000	7.2	290	2021-04-11 01:09:08.671688	2
28	-123.1193	49.2497	4.69	0.04	2.78	7.22	1025	61	10000	7.2	290	2021-04-11 01:09:19.939402	2
29	-123.1193	49.2497	4.69	0.04	2.78	7.22	1025	61	10000	7.2	290	2021-04-11 01:09:24.10586	2
30	-123.1193	49.2497	4.69	0.04	2.78	7.22	1025	61	10000	7.2	290	2021-04-11 01:09:44.291612	2
31	-123.1193	49.2497	4.69	0.04	2.78	7.22	1025	61	10000	7.2	290	2021-04-11 01:11:10.906267	2
32	-123.1193	49.2497	4.69	0.04	2.78	7.22	1025	61	10000	7.2	290	2021-04-11 01:11:34.660454	2
33	-123.1193	49.2497	4.69	0.04	2.78	7.22	1025	61	10000	7.2	290	2021-04-11 01:11:54.865921	2
34	-123.1193	49.2497	4.69	0.04	2.78	7.22	1025	61	10000	7.2	290	2021-04-11 01:13:51.77039	2
35	-123.1193	49.2497	4.69	0.04	2.78	7.22	1025	61	10000	7.2	290	2021-04-11 01:14:07.607525	2
36	-123.1193	49.2497	4.69	0.04	2.78	7.22	1025	61	10000	7.2	290	2021-04-11 01:14:27.790684	2
37	-123.1193	49.2497	4.69	0.04	2.78	7.22	1025	61	10000	7.2	290	2021-04-11 01:15:39.705006	2
38	-123.1193	49.2497	4.69	0.04	2.78	7.22	1025	61	10000	7.2	290	2021-04-11 01:15:59.936464	2
39	-123.1193	49.2497	4.69	0.04	2.78	7.22	1025	61	10000	7.2	290	2021-04-11 01:18:28.582238	2
40	-123.1193	49.2497	4.69	0.04	2.78	7.22	1025	61	10000	7.2	290	2021-04-11 01:18:48.801783	2
41	-123.1193	49.2497	4.69	0.04	2.78	7.22	1025	61	10000	7.2	290	2021-04-11 01:19:37.995359	2
42	-123.1193	49.2497	4.69	0.04	2.78	7.22	1025	61	10000	7.2	290	2021-04-11 01:19:58.202111	2
43	-123.1193	49.2497	4.69	0.04	2.78	7.22	1025	61	10000	7.2	290	2021-04-11 01:22:26.246353	2
44	-123.1193	49.2497	4.69	0.04	2.78	7.22	1025	61	10000	7.2	290	2021-04-11 01:22:46.436992	2
45	-123.1193	49.2497	3.65	-0.16	1.11	5	1026	75	10000	4.63	290	2021-04-11 01:40:31.617672	2
46	-123.1193	49.2497	3.65	-0.16	1.11	5	1026	75	10000	4.63	290	2021-04-11 01:40:51.797542	2
47	-123.1193	49.2497	3.65	-0.16	1.11	5	1026	75	10000	4.63	290	2021-04-11 01:43:25.855183	2
48	-123.1193	49.2497	3.65	-0.16	1.11	5	1026	75	10000	4.63	290	2021-04-11 01:45:23.407732	2
49	-123.1193	49.2497	3.65	-0.16	1.11	5	1026	75	10000	4.63	290	2021-04-11 01:45:43.601061	2
50	-123.1193	49.2497	3.65	-0.16	1.11	5	1026	75	10000	4.63	290	2021-04-11 01:46:12.750037	2
51	-123.1193	49.2497	3.65	-0.16	1.11	5	1026	75	10000	4.63	290	2021-04-11 01:46:32.925468	2
52	-123.1193	49.2497	3.65	-0.16	1.11	5	1026	75	10000	4.63	290	2021-04-11 01:46:38.331594	2
53	-123.1193	49.2497	3.65	-0.16	1.11	5	1026	75	10000	4.63	290	2021-04-11 01:46:58.798361	2
54	-123.1193	49.2497	3.7	-0.1	2.22	5	1026	75	10000	4.63	290	2021-04-11 01:49:56.192784	2
55	-123.1193	49.2497	3.7	-0.1	2.22	5	1026	75	10000	4.63	290	2021-04-11 01:50:16.369948	2
56	-123.1193	49.2497	3.7	-0.1	2.22	5	1026	75	10000	4.63	290	2021-04-11 01:51:03.15858	\N
57	-123.1193	49.2497	3.7	-0.1	2.22	5	1026	75	10000	4.63	290	2021-04-11 01:54:35.311186	2
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alan
--

SELECT pg_catalog.setval('public.locations_id_seq', 4, true);


--
-- Name: weathers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alan
--

SELECT pg_catalog.setval('public.weathers_id_seq', 58, true);


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

