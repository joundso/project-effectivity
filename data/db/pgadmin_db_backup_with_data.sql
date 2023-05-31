--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg110+1)
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-31 10:45:51 UTC

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
-- TOC entry 3357 (class 1262 OID 5)
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
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 3357
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16498)
-- Name: employee_class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_class (
    id integer NOT NULL,
    class_name character varying,
    hourly_rate_cent integer
);


ALTER TABLE public.employee_class OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16491)
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
-- TOC entry 218 (class 1259 OID 16510)
-- Name: invest_efforts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invest_efforts (
    id integer NOT NULL,
    project_id integer,
    invest_cent integer,
    datetime timestamp with time zone,
    description character varying
);


ALTER TABLE public.invest_efforts OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16484)
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    project_name character varying,
    sales_price_cent integer,
    project_start timestamp with time zone,
    project_end timestamp with time zone,
    closed boolean
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16505)
-- Name: time_efforts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.time_efforts (
    id integer NOT NULL,
    employee_id integer,
    project_id integer,
    time_spent_min integer,
    datetime timestamp with time zone
);


ALTER TABLE public.time_efforts OWNER TO postgres;

--
-- TOC entry 3349 (class 0 OID 16498)
-- Dependencies: 216
-- Data for Name: employee_class; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employee_class VALUES (1, '50 €/h', 5000);
INSERT INTO public.employee_class VALUES (2, '70 €/h', 7000);


--
-- TOC entry 3348 (class 0 OID 16491)
-- Dependencies: 215
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employees VALUES (1, 'Mustermann', 'Max', 1);
INSERT INTO public.employees VALUES (2, 'Musterfrau', 'Alice', 2);


--
-- TOC entry 3351 (class 0 OID 16510)
-- Dependencies: 218
-- Data for Name: invest_efforts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.invest_efforts VALUES (1, 1, 5000000, '2023-05-30 10:00:00+00', 'Machinery');
INSERT INTO public.invest_efforts VALUES (2, 1, 2000, NULL, 'Coffee');


--
-- TOC entry 3347 (class 0 OID 16484)
-- Dependencies: 214
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.projects VALUES (1, 'Gewinnprojekt', 20000000, '2023-05-01 10:00:00+00', '2023-06-30 10:00:00+00', NULL);


--
-- TOC entry 3350 (class 0 OID 16505)
-- Dependencies: 217
-- Data for Name: time_efforts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.time_efforts VALUES (1, 1, 1, 1200, '2023-05-23 10:00:00+00');
INSERT INTO public.time_efforts VALUES (2, 1, 1, 120, '2023-05-24 10:00:00+00');
INSERT INTO public.time_efforts VALUES (3, 2, 1, 6000, '2023-05-14 10:00:00+00');


--
-- TOC entry 3196 (class 2606 OID 16504)
-- Name: employee_class employee_class_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_class
    ADD CONSTRAINT employee_class_pkey PRIMARY KEY (id);


--
-- TOC entry 3194 (class 2606 OID 16497)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- TOC entry 3200 (class 2606 OID 16514)
-- Name: invest_efforts invest_efforts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invest_efforts
    ADD CONSTRAINT invest_efforts_pkey PRIMARY KEY (id);


--
-- TOC entry 3192 (class 2606 OID 16490)
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- TOC entry 3198 (class 2606 OID 16509)
-- Name: time_efforts time_efforts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_efforts
    ADD CONSTRAINT time_efforts_pkey PRIMARY KEY (id);


--
-- TOC entry 3201 (class 2606 OID 16515)
-- Name: employees employees_employee_class_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_employee_class_fkey FOREIGN KEY (employee_class) REFERENCES public.employee_class(id) NOT VALID;


--
-- TOC entry 3204 (class 2606 OID 16530)
-- Name: invest_efforts invest_efforts_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invest_efforts
    ADD CONSTRAINT invest_efforts_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) NOT VALID;


--
-- TOC entry 3202 (class 2606 OID 16520)
-- Name: time_efforts time_efforts_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_efforts
    ADD CONSTRAINT time_efforts_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(id) NOT VALID;


--
-- TOC entry 3203 (class 2606 OID 16525)
-- Name: time_efforts time_efforts_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_efforts
    ADD CONSTRAINT time_efforts_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) NOT VALID;


-- Completed on 2023-05-31 10:45:52 UTC

--
-- PostgreSQL database dump complete
--

