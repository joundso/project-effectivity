--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg110+1)
-- Dumped by pg_dump version 15.2

-- Started on 2023-06-05 18:02:10 UTC

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
-- TOC entry 3374 (class 1262 OID 5)
-- Name: budibase; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE budibase WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE budibase OWNER TO postgres;

\connect budibase

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
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 3374
-- Name: DATABASE budibase; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE budibase IS 'default administrative connection database';


--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA app;


ALTER SCHEMA app OWNER TO pg_database_owner;

--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA app; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA app IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16756)
-- Name: employee_class; Type: TABLE; Schema: app; Owner: postgres
--

CREATE TABLE app.employee_class (
    id integer NOT NULL,
    class_name character varying,
    hourly_rate_eur numeric
);


ALTER TABLE app.employee_class OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16755)
-- Name: employee_class_id_seq; Type: SEQUENCE; Schema: app; Owner: postgres
--

CREATE SEQUENCE app.employee_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app.employee_class_id_seq OWNER TO postgres;

--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 218
-- Name: employee_class_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: postgres
--

ALTER SEQUENCE app.employee_class_id_seq OWNED BY app.employee_class.id;


--
-- TOC entry 217 (class 1259 OID 16747)
-- Name: employees; Type: TABLE; Schema: app; Owner: postgres
--

CREATE TABLE app.employees (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    employee_class integer
);


ALTER TABLE app.employees OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16746)
-- Name: employees_id_seq; Type: SEQUENCE; Schema: app; Owner: postgres
--

CREATE SEQUENCE app.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app.employees_id_seq OWNER TO postgres;

--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 216
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: postgres
--

ALTER SEQUENCE app.employees_id_seq OWNED BY app.employees.id;


--
-- TOC entry 223 (class 1259 OID 16775)
-- Name: invest_efforts; Type: TABLE; Schema: app; Owner: postgres
--

CREATE TABLE app.invest_efforts (
    id integer NOT NULL,
    project_id integer,
    invest_eur numeric,
    description character varying,
    datetime timestamp with time zone
);


ALTER TABLE app.invest_efforts OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16774)
-- Name: invest_efforts_id_seq; Type: SEQUENCE; Schema: app; Owner: postgres
--

CREATE SEQUENCE app.invest_efforts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app.invest_efforts_id_seq OWNER TO postgres;

--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 222
-- Name: invest_efforts_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: postgres
--

ALTER SEQUENCE app.invest_efforts_id_seq OWNED BY app.invest_efforts.id;


--
-- TOC entry 215 (class 1259 OID 16737)
-- Name: projects; Type: TABLE; Schema: app; Owner: postgres
--

CREATE TABLE app.projects (
    id integer NOT NULL,
    project_name character varying NOT NULL,
    project_reference character varying,
    sales_price_eur numeric,
    project_start timestamp with time zone,
    project_end timestamp with time zone,
    closed boolean DEFAULT false NOT NULL
);


ALTER TABLE app.projects OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16736)
-- Name: projects_id_seq; Type: SEQUENCE; Schema: app; Owner: postgres
--

CREATE SEQUENCE app.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app.projects_id_seq OWNER TO postgres;

--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 214
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: postgres
--

ALTER SEQUENCE app.projects_id_seq OWNED BY app.projects.id;


--
-- TOC entry 221 (class 1259 OID 16765)
-- Name: time_efforts; Type: TABLE; Schema: app; Owner: postgres
--

CREATE TABLE app.time_efforts (
    id integer NOT NULL,
    employee_id integer,
    project_id integer,
    time_spent_h numeric,
    description character varying,
    datetime timestamp with time zone DEFAULT now()
);


ALTER TABLE app.time_efforts OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16764)
-- Name: time_efforts_id_seq; Type: SEQUENCE; Schema: app; Owner: postgres
--

CREATE SEQUENCE app.time_efforts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app.time_efforts_id_seq OWNER TO postgres;

--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 220
-- Name: time_efforts_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: postgres
--

ALTER SEQUENCE app.time_efforts_id_seq OWNED BY app.time_efforts.id;


--
-- TOC entry 3199 (class 2604 OID 16759)
-- Name: employee_class id; Type: DEFAULT; Schema: app; Owner: postgres
--

ALTER TABLE ONLY app.employee_class ALTER COLUMN id SET DEFAULT nextval('app.employee_class_id_seq'::regclass);


--
-- TOC entry 3198 (class 2604 OID 16750)
-- Name: employees id; Type: DEFAULT; Schema: app; Owner: postgres
--

ALTER TABLE ONLY app.employees ALTER COLUMN id SET DEFAULT nextval('app.employees_id_seq'::regclass);


--
-- TOC entry 3202 (class 2604 OID 16778)
-- Name: invest_efforts id; Type: DEFAULT; Schema: app; Owner: postgres
--

ALTER TABLE ONLY app.invest_efforts ALTER COLUMN id SET DEFAULT nextval('app.invest_efforts_id_seq'::regclass);


--
-- TOC entry 3196 (class 2604 OID 16740)
-- Name: projects id; Type: DEFAULT; Schema: app; Owner: postgres
--

ALTER TABLE ONLY app.projects ALTER COLUMN id SET DEFAULT nextval('app.projects_id_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 16768)
-- Name: time_efforts id; Type: DEFAULT; Schema: app; Owner: postgres
--

ALTER TABLE ONLY app.time_efforts ALTER COLUMN id SET DEFAULT nextval('app.time_efforts_id_seq'::regclass);


--
-- TOC entry 3364 (class 0 OID 16756)
-- Dependencies: 219
-- Data for Name: employee_class; Type: TABLE DATA; Schema: app; Owner: postgres
--

INSERT INTO app.employee_class (id, class_name, hourly_rate_eur) VALUES (DEFAULT, '50 €/h', 50);
INSERT INTO app.employee_class (id, class_name, hourly_rate_eur) VALUES (DEFAULT, '72,25 €/h', 72.25);


--
-- TOC entry 3362 (class 0 OID 16747)
-- Dependencies: 217
-- Data for Name: employees; Type: TABLE DATA; Schema: app; Owner: postgres
--

INSERT INTO app.employees (id, first_name, last_name, employee_class) VALUES (DEFAULT, 'Max', 'Mustermann', 1);
INSERT INTO app.employees (id, first_name, last_name, employee_class) VALUES (DEFAULT, 'Alice', 'Musterfrau', 2);


--
-- TOC entry 3368 (class 0 OID 16775)
-- Dependencies: 223
-- Data for Name: invest_efforts; Type: TABLE DATA; Schema: app; Owner: postgres
--

INSERT INTO app.invest_efforts (id, project_id, invest_eur, description, datetime) VALUES (DEFAULT, 1, 10000.12, NULL, '2023-05-03 10:00:00+00');
INSERT INTO app.invest_efforts (id, project_id, invest_eur, description, datetime) VALUES (DEFAULT, 2, 80000.99, 'Verlustinvestition', '2023-05-16 10:00:00+00');


--
-- TOC entry 3360 (class 0 OID 16737)
-- Dependencies: 215
-- Data for Name: projects; Type: TABLE DATA; Schema: app; Owner: postgres
--

INSERT INTO app.projects (id, project_name, project_reference, sales_price_eur, project_start, project_end, closed) VALUES (DEFAULT, 'Gewinnprojekt', NULL, 50000.99, '2023-05-01 10:00:00+00', '2023-06-03 10:00:00+00', false);
INSERT INTO app.projects (id, project_name, project_reference, sales_price_eur, project_start, project_end, closed) VALUES (DEFAULT, 'Verlustprojekt', NULL, 10000.25, '2023-05-01 10:00:00+00', '2023-05-31 10:00:00+00', false);


--
-- TOC entry 3366 (class 0 OID 16765)
-- Dependencies: 221
-- Data for Name: time_efforts; Type: TABLE DATA; Schema: app; Owner: postgres
--

INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 1, 1, 20.5, NULL, '2023-05-10 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 2, 1, 10.75, NULL, '2023-05-18 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 1, 1, 6, NULL, '2023-05-04 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 2, 1, 9.25, NULL, '2023-05-05 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 1, 1, 10, NULL, '2023-05-07 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 2, 1, 5.5, NULL, '2023-05-08 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 1, 1, 7.25, NULL, '2023-05-10 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 2, 1, 5.25, NULL, '2023-05-11 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 1, 1, 0.5, NULL, '2023-05-13 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 2, 1, 8, NULL, '2023-05-14 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 1, 1, 5.5, NULL, '2023-05-16 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 2, 1, 2, NULL, '2023-05-17 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 1, 1, 7.5, NULL, '2023-05-19 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 2, 1, 0.5, NULL, '2023-05-20 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 1, 1, 4.25, NULL, '2023-05-22 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 2, 1, 4.75, NULL, '2023-05-23 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 1, 1, 2.5, NULL, '2023-05-25 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 2, 1, 2.25, NULL, '2023-05-26 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 1, 1, 1.75, NULL, '2023-05-28 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 2, 1, 5.25, NULL, '2023-05-29 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 1, 2, 7.5, NULL, '2023-05-27 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 1, 2, 2, NULL, '2023-05-09 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 1, 2, 2.5, NULL, '2023-05-21 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 1, 2, 15, NULL, '2023-05-25 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 1, 2, 1, NULL, '2023-05-15 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 1, 2, 5.25, NULL, '2023-05-30 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 1, 2, 9.25, NULL, '2023-05-12 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 1, 2, 2.5, NULL, '2023-05-24 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 1, 2, 8.75, NULL, '2023-05-06 10:00:00+00');
INSERT INTO app.time_efforts (id, employee_id, project_id, time_spent_h, description, datetime) VALUES (DEFAULT, 1, 2, 9.25, NULL, '2023-05-18 10:00:00+00');


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 218
-- Name: employee_class_id_seq; Type: SEQUENCE SET; Schema: app; Owner: postgres
--

SELECT pg_catalog.setval('app.employee_class_id_seq', 1, false);


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 216
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: app; Owner: postgres
--

SELECT pg_catalog.setval('app.employees_id_seq', 1, false);


--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 222
-- Name: invest_efforts_id_seq; Type: SEQUENCE SET; Schema: app; Owner: postgres
--

SELECT pg_catalog.setval('app.invest_efforts_id_seq', 1, false);


--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 214
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: app; Owner: postgres
--

SELECT pg_catalog.setval('app.projects_id_seq', 2, true);


--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 220
-- Name: time_efforts_id_seq; Type: SEQUENCE SET; Schema: app; Owner: postgres
--

SELECT pg_catalog.setval('app.time_efforts_id_seq', 2, true);


--
-- TOC entry 3208 (class 2606 OID 16763)
-- Name: employee_class employee_class_pkey; Type: CONSTRAINT; Schema: app; Owner: postgres
--

ALTER TABLE ONLY app.employee_class
    ADD CONSTRAINT employee_class_pkey PRIMARY KEY (id);


--
-- TOC entry 3206 (class 2606 OID 16754)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: app; Owner: postgres
--

ALTER TABLE ONLY app.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 16782)
-- Name: invest_efforts invest_efforts_pkey; Type: CONSTRAINT; Schema: app; Owner: postgres
--

ALTER TABLE ONLY app.invest_efforts
    ADD CONSTRAINT invest_efforts_pkey PRIMARY KEY (id);


--
-- TOC entry 3204 (class 2606 OID 16745)
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: app; Owner: postgres
--

ALTER TABLE ONLY app.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 16773)
-- Name: time_efforts time_efforts_pkey; Type: CONSTRAINT; Schema: app; Owner: postgres
--

ALTER TABLE ONLY app.time_efforts
    ADD CONSTRAINT time_efforts_pkey PRIMARY KEY (id);


--
-- TOC entry 3213 (class 2606 OID 16783)
-- Name: employees employees_employee_class_fkey; Type: FK CONSTRAINT; Schema: app; Owner: postgres
--

ALTER TABLE ONLY app.employees
    ADD CONSTRAINT employees_employee_class_fkey FOREIGN KEY (employee_class) REFERENCES app.employee_class(id) NOT VALID;


--
-- TOC entry 3216 (class 2606 OID 16798)
-- Name: invest_efforts invest_efforts_project_id_fkey; Type: FK CONSTRAINT; Schema: app; Owner: postgres
--

ALTER TABLE ONLY app.invest_efforts
    ADD CONSTRAINT invest_efforts_project_id_fkey FOREIGN KEY (project_id) REFERENCES app.projects(id) NOT VALID;


--
-- TOC entry 3214 (class 2606 OID 16788)
-- Name: time_efforts time_efforts_employee_id_fkey; Type: FK CONSTRAINT; Schema: app; Owner: postgres
--

ALTER TABLE ONLY app.time_efforts
    ADD CONSTRAINT time_efforts_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES app.employees(id) NOT VALID;


--
-- TOC entry 3215 (class 2606 OID 16793)
-- Name: time_efforts time_efforts_project_id_fkey; Type: FK CONSTRAINT; Schema: app; Owner: postgres
--

ALTER TABLE ONLY app.time_efforts
    ADD CONSTRAINT time_efforts_project_id_fkey FOREIGN KEY (project_id) REFERENCES app.projects(id) NOT VALID;


-- Completed on 2023-06-05 18:02:10 UTC

--
-- PostgreSQL database dump complete
--

