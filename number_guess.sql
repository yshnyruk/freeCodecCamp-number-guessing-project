--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: guesses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guesses (
    number_guess integer NOT NULL,
    user_id integer NOT NULL,
    guess_id integer NOT NULL
);


ALTER TABLE public.guesses OWNER TO freecodecamp;

--
-- Name: guesses_guess_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.guesses_guess_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guesses_guess_id_seq OWNER TO freecodecamp;

--
-- Name: guesses_guess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.guesses_guess_id_seq OWNED BY public.guesses.guess_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    name character varying(22) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: guesses guess_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guesses ALTER COLUMN guess_id SET DEFAULT nextval('public.guesses_guess_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: guesses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.guesses VALUES (11, 8, 8);
INSERT INTO public.guesses VALUES (904, 9, 9);
INSERT INTO public.guesses VALUES (636, 9, 10);
INSERT INTO public.guesses VALUES (701, 10, 11);
INSERT INTO public.guesses VALUES (19, 10, 12);
INSERT INTO public.guesses VALUES (347, 9, 13);
INSERT INTO public.guesses VALUES (856, 9, 14);
INSERT INTO public.guesses VALUES (850, 9, 15);
INSERT INTO public.guesses VALUES (993, 11, 16);
INSERT INTO public.guesses VALUES (777, 11, 17);
INSERT INTO public.guesses VALUES (323, 12, 18);
INSERT INTO public.guesses VALUES (409, 12, 19);
INSERT INTO public.guesses VALUES (564, 11, 20);
INSERT INTO public.guesses VALUES (788, 11, 21);
INSERT INTO public.guesses VALUES (204, 11, 22);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('Test', 8);
INSERT INTO public.users VALUES ('user_1795252775960', 9);
INSERT INTO public.users VALUES ('user_1795252775959', 10);
INSERT INTO public.users VALUES ('user_1795252850355', 11);
INSERT INTO public.users VALUES ('user_1795252850354', 12);


--
-- Name: guesses_guess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.guesses_guess_id_seq', 22, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 12, true);


--
-- Name: guesses guesses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guesses
    ADD CONSTRAINT guesses_pkey PRIMARY KEY (guess_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: guesses guesses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guesses
    ADD CONSTRAINT guesses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

