toc.dat                                                                                             0000600 0004000 0002000 00000013014 14540071652 0014442 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP   "                     {            QAP3    16.0    16.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    24685    QAP3    DATABASE     z   CREATE DATABASE "QAP3" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Canada.1252';
    DROP DATABASE "QAP3";
                postgres    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false         �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4         �            1259    24687 
   categories    TABLE     x   CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category_name character varying(255) NOT NULL
);
    DROP TABLE public.categories;
       public         heap    postgres    false    4         �            1259    24686    categories_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.categories_category_id_seq;
       public          postgres    false    216    4         �           0    0    categories_category_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;
          public          postgres    false    215         �            1259    24694 
   menu_items    TABLE     �   CREATE TABLE public.menu_items (
    item_id integer NOT NULL,
    item_name character varying(255) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    category_id integer
);
    DROP TABLE public.menu_items;
       public         heap    postgres    false    4         �            1259    24693    menu_items_item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_items_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.menu_items_item_id_seq;
       public          postgres    false    4    218         �           0    0    menu_items_item_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.menu_items_item_id_seq OWNED BY public.menu_items.item_id;
          public          postgres    false    217         U           2604    24690    categories category_id    DEFAULT     �   ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);
 E   ALTER TABLE public.categories ALTER COLUMN category_id DROP DEFAULT;
       public          postgres    false    215    216    216         V           2604    24697    menu_items item_id    DEFAULT     x   ALTER TABLE ONLY public.menu_items ALTER COLUMN item_id SET DEFAULT nextval('public.menu_items_item_id_seq'::regclass);
 A   ALTER TABLE public.menu_items ALTER COLUMN item_id DROP DEFAULT;
       public          postgres    false    218    217    218         �          0    24687 
   categories 
   TABLE DATA           @   COPY public.categories (category_id, category_name) FROM stdin;
    public          postgres    false    216       4844.dat �          0    24694 
   menu_items 
   TABLE DATA           Y   COPY public.menu_items (item_id, item_name, description, price, category_id) FROM stdin;
    public          postgres    false    218       4846.dat �           0    0    categories_category_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.categories_category_id_seq', 1, false);
          public          postgres    false    215         �           0    0    menu_items_item_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.menu_items_item_id_seq', 10, true);
          public          postgres    false    217         X           2606    24692    categories categories_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    216         Z           2606    24701    menu_items menu_items_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (item_id);
 D   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT menu_items_pkey;
       public            postgres    false    218         [           2606    24702 &   menu_items menu_items_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id);
 P   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT menu_items_category_id_fkey;
       public          postgres    false    218    216    4696                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            4844.dat                                                                                            0000600 0004000 0002000 00000000005 14540071652 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4846.dat                                                                                            0000600 0004000 0002000 00000000325 14540071652 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        3	Pasta	Spaghetti with marinara sauce	8.99	\N
4	Salad	Fresh garden salad with vinaigrette	7.99	\N
5	Smoothie	Mixed berry smoothie with yogurt	7.00	\N
2	Pizza	Classic Margherita with fresh mozzarella	10.00	\N
\.


                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000011716 14540071652 0015376 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

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

DROP DATABASE "QAP3";
--
-- Name: QAP3; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "QAP3" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Canada.1252';


ALTER DATABASE "QAP3" OWNER TO postgres;

\connect "QAP3"

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category_name character varying(255) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_category_id_seq OWNER TO postgres;

--
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;


--
-- Name: menu_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_items (
    item_id integer NOT NULL,
    item_name character varying(255) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    category_id integer
);


ALTER TABLE public.menu_items OWNER TO postgres;

--
-- Name: menu_items_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_items_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_items_item_id_seq OWNER TO postgres;

--
-- Name: menu_items_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_items_item_id_seq OWNED BY public.menu_items.item_id;


--
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- Name: menu_items item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items ALTER COLUMN item_id SET DEFAULT nextval('public.menu_items_item_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (category_id, category_name) FROM stdin;
\.
COPY public.categories (category_id, category_name) FROM '$$PATH$$/4844.dat';

--
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_items (item_id, item_name, description, price, category_id) FROM stdin;
\.
COPY public.menu_items (item_id, item_name, description, price, category_id) FROM '$$PATH$$/4846.dat';

--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 1, false);


--
-- Name: menu_items_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_items_item_id_seq', 10, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: menu_items menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (item_id);


--
-- Name: menu_items menu_items_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  