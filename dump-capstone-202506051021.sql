--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17 (Homebrew)
-- Dumped by pg_dump version 14.17 (Homebrew)

-- Started on 2025-06-05 10:21:43 WIB

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
-- TOC entry 840 (class 1247 OID 17642)
-- Name: Priority; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."Priority" AS ENUM (
    'CRITICAL',
    'MEDIUM',
    'LOW'
);


ALTER TYPE public."Priority" OWNER TO postgres;

--
-- TOC entry 837 (class 1247 OID 17634)
-- Name: Role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."Role" AS ENUM (
    'ADMIN',
    'ENGINEER',
    'CUSTOMER'
);


ALTER TYPE public."Role" OWNER TO postgres;

--
-- TOC entry 843 (class 1247 OID 17650)
-- Name: Status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."Status" AS ENUM (
    'OPEN',
    'IN_PROGRESS',
    'RESOLVED',
    'CLOSED'
);


ALTER TYPE public."Status" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 17800)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17799)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 3750 (class 0 OID 0)
-- Dependencies: 209
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 218 (class 1259 OID 17828)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17827)
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_id_seq OWNER TO postgres;

--
-- TOC entry 3751 (class 0 OID 0)
-- Dependencies: 217
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- TOC entry 216 (class 1259 OID 17821)
-- Name: priorities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.priorities (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.priorities OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17820)
-- Name: priorities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.priorities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.priorities_id_seq OWNER TO postgres;

--
-- TOC entry 3752 (class 0 OID 0)
-- Dependencies: 215
-- Name: priorities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.priorities_id_seq OWNED BY public.priorities.id;


--
-- TOC entry 222 (class 1259 OID 17846)
-- Name: progress_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.progress_logs (
    id integer NOT NULL,
    note text NOT NULL,
    ticket_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.progress_logs OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17845)
-- Name: progress_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.progress_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.progress_logs_id_seq OWNER TO postgres;

--
-- TOC entry 3753 (class 0 OID 0)
-- Dependencies: 221
-- Name: progress_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.progress_logs_id_seq OWNED BY public.progress_logs.id;


--
-- TOC entry 212 (class 1259 OID 17807)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17806)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 3754 (class 0 OID 0)
-- Dependencies: 211
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 214 (class 1259 OID 17814)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.status OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17813)
-- Name: status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_id_seq OWNER TO postgres;

--
-- TOC entry 3755 (class 0 OID 0)
-- Dependencies: 213
-- Name: status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_id_seq OWNED BY public.status.id;


--
-- TOC entry 220 (class 1259 OID 17835)
-- Name: tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tickets (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    priority_id integer,
    customer_id integer,
    engineer_id integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    assigned_at timestamp without time zone,
    resolved_at timestamp without time zone,
    status_id integer DEFAULT 1,
    cateogry_id integer
);


ALTER TABLE public.tickets OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17834)
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tickets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tickets_id_seq OWNER TO postgres;

--
-- TOC entry 3756 (class 0 OID 0)
-- Dependencies: 219
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;


--
-- TOC entry 224 (class 1259 OID 17858)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role_id integer NOT NULL,
    department_id integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    company character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17857)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3757 (class 0 OID 0)
-- Dependencies: 223
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3560 (class 2604 OID 17803)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 3564 (class 2604 OID 17831)
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- TOC entry 3563 (class 2604 OID 17824)
-- Name: priorities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priorities ALTER COLUMN id SET DEFAULT nextval('public.priorities_id_seq'::regclass);


--
-- TOC entry 3569 (class 2604 OID 17849)
-- Name: progress_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progress_logs ALTER COLUMN id SET DEFAULT nextval('public.progress_logs_id_seq'::regclass);


--
-- TOC entry 3561 (class 2604 OID 17810)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 3562 (class 2604 OID 17817)
-- Name: status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status ALTER COLUMN id SET DEFAULT nextval('public.status_id_seq'::regclass);


--
-- TOC entry 3565 (class 2604 OID 17838)
-- Name: tickets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);


--
-- TOC entry 3571 (class 2604 OID 17861)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3730 (class 0 OID 17800)
-- Dependencies: 210
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name) FROM stdin;
2	Technical Issue
3	Maintenance
4	Access Issue
5	Hardware Problem
6	Software Issue
\.


--
-- TOC entry 3738 (class 0 OID 17828)
-- Dependencies: 218
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (id, name) FROM stdin;
1	IT Support
\.


--
-- TOC entry 3736 (class 0 OID 17821)
-- Dependencies: 216
-- Data for Name: priorities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.priorities (id, name) FROM stdin;
1	Critical
2	Medium
3	Low
\.


--
-- TOC entry 3742 (class 0 OID 17846)
-- Dependencies: 222
-- Data for Name: progress_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.progress_logs (id, note, ticket_id, user_id, created_at) FROM stdin;
1	d78728594b4bedb89a993fb503bbdbc6:7ad8ceae900941281e49af02b502e738	2	3	2025-06-03 21:03:33.61823
2	be3eef5d34f98a349a0e182852645c11:a1fc3a3019120f92e7f43e4f4bae1f4e	2	3	2025-06-04 01:26:15.754103
3	0e0cbfdd9df6fb4203f4b2d14b42e9e7:7cc47c37eb7f3ed977b3fad0b3b41234	2	2	2025-06-04 01:29:38.653302
4	90ebf6ae9a41ce25aa0bf925f4d08d0b:f74b3d51142a44a3f2edb250eec06e2da530a9e1d3a4add1b9e809f0af753fc6	2	3	2025-06-04 01:44:50.890686
5	0c002bef9b623dc45e11f84a6c5093b5:095d50283e2c5de05d67ec2621b94841	4	3	2025-06-04 01:49:26.36483
6	7824fb0ae1d5fccbff7f2e81497650c2:16933776cf5e3165012bcb65c2bff1c2	7	9	2025-06-04 22:31:45.330816
7	5aa5ea2f14005caee8fbeb9a12975286:71005b19f4c074c69c87d8b83d98a923	7	9	2025-06-04 22:31:45.330598
9	afec5e575718b55b6ed081c5056583e2:4487c0dadd8dabd84d0380084eea632b	7	9	2025-06-04 22:31:45.497934
8	2e54038caf8b94f717ba35950da33be4:e34717d4d1a574493c1df74b2bdbb740	7	9	2025-06-04 22:31:45.499353
10	991462f27f19873968fae539c52299bd:f2461010f94f56618f2691c4885e47c4	7	5	2025-06-04 22:33:58.982141
11	c86acbdd80930b8644053975532ff083:c624257d041d71e4633d1f5163c6f414	7	5	2025-06-04 22:35:35.710848
\.


--
-- TOC entry 3732 (class 0 OID 17807)
-- Dependencies: 212
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name) FROM stdin;
1	Admin
2	Engineer
3	User
\.


--
-- TOC entry 3734 (class 0 OID 17814)
-- Dependencies: 214
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (id, name) FROM stdin;
1	Open
2	In Progress
3	Resolved
4	Closed
\.


--
-- TOC entry 3740 (class 0 OID 17835)
-- Dependencies: 220
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tickets (id, title, description, priority_id, customer_id, engineer_id, created_at, updated_at, assigned_at, resolved_at, status_id, cateogry_id) FROM stdin;
5	Cek	144fc876a4d81c636c6d61b78fcd6008:912938f4b2ad77dfb6c2bba9c1bffbdc	2	2	8	2025-06-04 13:35:28.367643	2025-06-04 20:49:39.828	2025-06-04 13:42:34.69	2025-06-04 20:49:39.828	4	\N
3	asdknaskjdn	d16fa50039fe5b79430046a223a19c58:62bd8b9b45d4eabfb208d47890dd6303	2	2	3	2025-06-03 22:31:23.486627	2025-06-04 20:50:40.781	2025-06-04 01:01:06.621	2025-06-04 20:50:40.781	4	\N
4	kajndkjasndkjans	7ab9a92577624c00045b8b0d139e5000:32f7d0e5720f19517ac25ceeb9564a1cec45e85072329ac2069cfabc648dbe51	1	2	3	2025-06-03 22:32:42.172041	2025-06-04 20:50:46.107	2025-06-04 01:01:25.724	2025-06-04 20:50:46.107	4	\N
2	Tes	ff325643ac1d73b240716e5a13750f29:b9a62507c82850ee1d1f4ac8f51a17db	3	2	3	2025-06-03 21:08:04.049802	2025-06-04 20:50:51.323	2025-06-03 21:11:32.732	2025-06-04 20:50:51.323	4	\N
6	Test	9ce8228d497306c3e3ba20a0e873cd9e:f30871758f7fc9a2f05d6933dde57870e3d59238060afd7976de4b9391deecb9	\N	2	\N	2025-06-04 21:57:40.825094	2025-06-04 21:57:40.825094	\N	\N	1	\N
7	akjsndakjsndkjn	8922b24c4345674cae0ddea4f251bf2a:7143a53af3bf1bb970d9e2b4a2221a517680239882ed4dcc2eb8c4f12877279d	3	9	5	2025-06-04 22:09:56.277835	2025-06-04 22:33:38.739	2025-06-04 22:33:36.367	\N	1	\N
\.


--
-- TOC entry 3744 (class 0 OID 17858)
-- Dependencies: 224
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, role_id, department_id, created_at, updated_at, company) FROM stdin;
3	Cek2	cek2@gmail.com	0523c52ae88085f9a0612c8ee18f2358:6fe9b9fa5feb571bbb97a59b87a50523	2	\N	2025-06-03 20:41:59.30475	2025-06-03 20:41:59.30475	\N
2	Cek	cek@gmail.com	7e9c8325bc3c39f9c60c9f46eb873062:e5d42eebd017dc5dfbba2a0957f79f84	3	\N	2025-06-03 20:41:48.049412	2025-06-03 20:41:48.049412	\N
4	Admin	admin@gmail.com	$2b$10$AlYkoAbkpeW78VMvwdVPO.j0Z9l3jH4NvC9I1A9YNCtf6zBp/K2m2	1	\N	2025-06-04 09:02:22.069141	2025-06-04 09:02:22.069141	\N
5	Engineer	engineer@gmail.com	$2b$10$FIU1YbURZjIYvkumJBEA5eU7GwHNo7A8nm2DemFUIbQbEs/A39xpW	2	\N	2025-06-04 13:14:11.451086	2025-06-04 13:14:11.451086	\N
6	Test Engineer	test1@engineer.com	$2b$10$k8dmIKgXDX.rmNYPbCqmje5QvogX0w044cYcLj2mU0OOv.vYjMPYa	2	\N	2025-06-04 13:19:12.9155	2025-06-04 13:19:12.9155	\N
7	asjndaskjnd	aksjnd@gmila.com	$2b$10$l0OvJuuhT6ULz7Lh5iE7huj1hVxgy8PYL26n.JiWrXr5zQxYmFaXS	2	\N	2025-06-04 13:19:59.136655	2025-06-04 13:19:59.136655	\N
8	Engineer 2	egineer2@gmail.com	$2b$10$EedlYseud5PaG1ycgZfNfOGMiUO4YPMaalLAzAKNo0RwOkty3X17e	2	\N	2025-06-04 13:23:32.980837	2025-06-04 13:23:32.980837	\N
9	User	user@gmail.com	$2b$10$w9c2ut1bXtGyWC6Btc9ubumoR5ZEejaQbDW4HxRU2H0ae8RV5XllS	3	\N	2025-06-04 21:54:30.748405	2025-06-04 21:54:30.748405	\N
10	test	test23@gmail.com	$2b$10$k76pkfo0XcRqLl6Ku5UNCOlCLuMHmzcKT2VKWwyWm5amxg5KqEbnm	3	\N	2025-06-04 22:40:23.561032	2025-06-04 22:40:23.561032	\N
11	asjhdbajhsb	asjhbdashjdb@gmila.com	$2b$10$HJQ.V35aTNHfbwTSHGgZt.ENmf22UK94dhOXmcUyHSFXvQvGt6BgO	3	\N	2025-06-04 22:41:58.525067	2025-06-04 22:41:58.525067	Test
\.


--
-- TOC entry 3758 (class 0 OID 0)
-- Dependencies: 209
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 6, true);


--
-- TOC entry 3759 (class 0 OID 0)
-- Dependencies: 217
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_id_seq', 2, true);


--
-- TOC entry 3760 (class 0 OID 0)
-- Dependencies: 215
-- Name: priorities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.priorities_id_seq', 4, true);


--
-- TOC entry 3761 (class 0 OID 0)
-- Dependencies: 221
-- Name: progress_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.progress_logs_id_seq', 11, true);


--
-- TOC entry 3762 (class 0 OID 0)
-- Dependencies: 211
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- TOC entry 3763 (class 0 OID 0)
-- Dependencies: 213
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_id_seq', 5, true);


--
-- TOC entry 3764 (class 0 OID 0)
-- Dependencies: 219
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tickets_id_seq', 7, true);


--
-- TOC entry 3765 (class 0 OID 0)
-- Dependencies: 223
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- TOC entry 3575 (class 2606 OID 17805)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3583 (class 2606 OID 17833)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- TOC entry 3581 (class 2606 OID 17826)
-- Name: priorities priorities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priorities
    ADD CONSTRAINT priorities_pkey PRIMARY KEY (id);


--
-- TOC entry 3587 (class 2606 OID 17854)
-- Name: progress_logs progress_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progress_logs
    ADD CONSTRAINT progress_logs_pkey PRIMARY KEY (id);


--
-- TOC entry 3577 (class 2606 OID 17812)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3579 (class 2606 OID 17819)
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- TOC entry 3585 (class 2606 OID 17844)
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- TOC entry 3589 (class 2606 OID 17867)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


-- Completed on 2025-06-05 10:21:43 WIB

--
-- PostgreSQL database dump complete
--

