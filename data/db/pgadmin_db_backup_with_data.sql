--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg110+1)
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-31 13:54:40 UTC

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

DROP DATABASE postgres;
--
-- TOC entry 3373 (class 1262 OID 5)
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 3373
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16689)
-- Name: employee_class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_class (
    id integer NOT NULL,
    class_name character varying,
    hourly_rate_eur numeric
);


ALTER TABLE public.employee_class OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16688)
-- Name: employee_class_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_class_id_seq OWNER TO postgres;

--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 218
-- Name: employee_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_class_id_seq OWNED BY public.employee_class.id;


--
-- TOC entry 217 (class 1259 OID 16680)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    employee_class integer
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16679)
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_id_seq OWNER TO postgres;

--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 216
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;


--
-- TOC entry 223 (class 1259 OID 16707)
-- Name: invest_efforts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invest_efforts (
    id integer NOT NULL,
    project_id integer,
    invest_eur numeric,
    description character varying,
    datetime timestamp with time zone
);


ALTER TABLE public.invest_efforts OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16706)
-- Name: invest_efforts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.invest_efforts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invest_efforts_id_seq OWNER TO postgres;

--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 222
-- Name: invest_efforts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.invest_efforts_id_seq OWNED BY public.invest_efforts.id;


--
-- TOC entry 215 (class 1259 OID 16670)
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    project_name character varying NOT NULL,
    project_reference character varying,
    sales_price_eur numeric,
    project_start timestamp with time zone,
    project_end timestamp with time zone,
    closed boolean DEFAULT false NOT NULL
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16669)
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO postgres;

--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 214
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- TOC entry 221 (class 1259 OID 16698)
-- Name: time_efforts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.time_efforts (
    id integer NOT NULL,
    employee_id integer,
    project_id integer,
    time_spent_h numeric,
    description character varying,
    datetime timestamp with time zone
);


ALTER TABLE public.time_efforts OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16697)
-- Name: time_efforts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.time_efforts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.time_efforts_id_seq OWNER TO postgres;

--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 220
-- Name: time_efforts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.time_efforts_id_seq OWNED BY public.time_efforts.id;


--
-- TOC entry 3199 (class 2604 OID 16692)
-- Name: employee_class id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_class ALTER COLUMN id SET DEFAULT nextval('public.employee_class_id_seq'::regclass);


--
-- TOC entry 3198 (class 2604 OID 16683)
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);


--
-- TOC entry 3201 (class 2604 OID 16710)
-- Name: invest_efforts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invest_efforts ALTER COLUMN id SET DEFAULT nextval('public.invest_efforts_id_seq'::regclass);


--
-- TOC entry 3196 (class 2604 OID 16673)
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 16701)
-- Name: time_efforts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_efforts ALTER COLUMN id SET DEFAULT nextval('public.time_efforts_id_seq'::regclass);


--
-- TOC entry 3363 (class 0 OID 16689)
-- Dependencies: 219
-- Data for Name: employee_class; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employee_class VALUES (1, '50 €/h', 50);
INSERT INTO public.employee_class VALUES (2, '72,25 €/h', 72.25);


--
-- TOC entry 3361 (class 0 OID 16680)
-- Dependencies: 217
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employees VALUES (1, 'Max', 'Mustermann', 1);
INSERT INTO public.employees VALUES (2, 'Alice', 'Musterfrau', 2);


--
-- TOC entry 3367 (class 0 OID 16707)
-- Dependencies: 223
-- Data for Name: invest_efforts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.invest_efforts VALUES (1, 1, 10000.12, NULL, '2023-05-03 10:00:00+00');
INSERT INTO public.invest_efforts VALUES (2, 2, 80000.99, 'Verlustinvestition', '2023-05-16 10:00:00+00');


--
-- TOC entry 3359 (class 0 OID 16670)
-- Dependencies: 215
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.projects VALUES (1, 'Gewinnprojekt', NULL, 50000.99, '2023-05-01 10:00:00+00', '2023-06-03 10:00:00+00', false);
INSERT INTO public.projects VALUES (2, 'Verlustprojekt', NULL, 10000.25, '2023-05-01 10:00:00+00', '2023-05-31 10:00:00+00', true);


--
-- TOC entry 3365 (class 0 OID 16698)
-- Dependencies: 221
-- Data for Name: time_efforts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.time_efforts VALUES (1, 1, 1, 20.5, NULL, '2023-05-10 10:00:00+00');
INSERT INTO public.time_efforts VALUES (2, 2, 1, 10.75, NULL, '2023-05-18 10:00:00+00');
INSERT INTO public.time_efforts VALUES (4, 1, 1, 6, NULL, '2023-05-04 10:00:00+00');
INSERT INTO public.time_efforts VALUES (5, 2, 1, 9.25, NULL, '2023-05-05 10:00:00+00');
INSERT INTO public.time_efforts VALUES (6, 1, 2, 8.75, NULL, '2023-05-06 10:00:00+00');
INSERT INTO public.time_efforts VALUES (7, 1, 1, 10, NULL, '2023-05-07 10:00:00+00');
INSERT INTO public.time_efforts VALUES (8, 2, 1, 5.5, NULL, '2023-05-08 10:00:00+00');
INSERT INTO public.time_efforts VALUES (9, 1, 2, 2, NULL, '2023-05-09 10:00:00+00');
INSERT INTO public.time_efforts VALUES (10, 1, 1, 7.25, NULL, '2023-05-10 10:00:00+00');
INSERT INTO public.time_efforts VALUES (11, 2, 1, 5.25, NULL, '2023-05-11 10:00:00+00');
INSERT INTO public.time_efforts VALUES (12, 1, 2, 9.25, NULL, '2023-05-12 10:00:00+00');
INSERT INTO public.time_efforts VALUES (13, 1, 1, 0.5, NULL, '2023-05-13 10:00:00+00');
INSERT INTO public.time_efforts VALUES (14, 2, 1, 8, NULL, '2023-05-14 10:00:00+00');
INSERT INTO public.time_efforts VALUES (15, 1, 2, 1, NULL, '2023-05-15 10:00:00+00');
INSERT INTO public.time_efforts VALUES (16, 1, 1, 5.5, NULL, '2023-05-16 10:00:00+00');
INSERT INTO public.time_efforts VALUES (17, 2, 1, 2, NULL, '2023-05-17 10:00:00+00');
INSERT INTO public.time_efforts VALUES (18, 1, 2, 9.25, NULL, '2023-05-18 10:00:00+00');
INSERT INTO public.time_efforts VALUES (19, 1, 1, 7.5, NULL, '2023-05-19 10:00:00+00');
INSERT INTO public.time_efforts VALUES (20, 2, 1, 0.5, NULL, '2023-05-20 10:00:00+00');
INSERT INTO public.time_efforts VALUES (21, 1, 2, 2.5, NULL, '2023-05-21 10:00:00+00');
INSERT INTO public.time_efforts VALUES (22, 1, 1, 4.25, NULL, '2023-05-22 10:00:00+00');
INSERT INTO public.time_efforts VALUES (23, 2, 1, 4.75, NULL, '2023-05-23 10:00:00+00');
INSERT INTO public.time_efforts VALUES (24, 1, 2, 2.5, NULL, '2023-05-24 10:00:00+00');
INSERT INTO public.time_efforts VALUES (25, 1, 1, 2.5, NULL, '2023-05-25 10:00:00+00');
INSERT INTO public.time_efforts VALUES (26, 2, 1, 2.25, NULL, '2023-05-26 10:00:00+00');
INSERT INTO public.time_efforts VALUES (27, 1, 2, 7.5, NULL, '2023-05-27 10:00:00+00');
INSERT INTO public.time_efforts VALUES (28, 1, 1, 1.75, NULL, '2023-05-28 10:00:00+00');
INSERT INTO public.time_efforts VALUES (29, 2, 1, 5.25, NULL, '2023-05-29 10:00:00+00');
INSERT INTO public.time_efforts VALUES (30, 1, 2, 5.25, NULL, '2023-05-30 10:00:00+00');
INSERT INTO public.time_efforts VALUES (3, 1, 2, 15, NULL, '2023-05-25 10:00:00+00');


--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 218
-- Name: employee_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_class_id_seq', 2, true);


--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 216
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_id_seq', 2, true);


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 222
-- Name: invest_efforts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invest_efforts_id_seq', 2, true);


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 214
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 2, true);


--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 220
-- Name: time_efforts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.time_efforts_id_seq', 3, true);


--
-- TOC entry 3207 (class 2606 OID 16696)
-- Name: employee_class employee_class_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_class
    ADD CONSTRAINT employee_class_pkey PRIMARY KEY (id);


--
-- TOC entry 3205 (class 2606 OID 16687)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- TOC entry 3211 (class 2606 OID 16714)
-- Name: invest_efforts invest_efforts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invest_efforts
    ADD CONSTRAINT invest_efforts_pkey PRIMARY KEY (id);


--
-- TOC entry 3203 (class 2606 OID 16678)
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- TOC entry 3209 (class 2606 OID 16705)
-- Name: time_efforts time_efforts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_efforts
    ADD CONSTRAINT time_efforts_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 16715)
-- Name: employees employees_employee_class_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_employee_class_fkey FOREIGN KEY (employee_class) REFERENCES public.employee_class(id) NOT VALID;


--
-- TOC entry 3215 (class 2606 OID 16730)
-- Name: invest_efforts invest_efforts_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invest_efforts
    ADD CONSTRAINT invest_efforts_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) NOT VALID;


--
-- TOC entry 3213 (class 2606 OID 16720)
-- Name: time_efforts time_efforts_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_efforts
    ADD CONSTRAINT time_efforts_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(id) NOT VALID;


--
-- TOC entry 3214 (class 2606 OID 16725)
-- Name: time_efforts time_efforts_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_efforts
    ADD CONSTRAINT time_efforts_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) NOT VALID;


-- Completed on 2023-05-31 13:54:40 UTC

--
-- PostgreSQL database dump complete
--

