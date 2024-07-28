--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    guesses integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 10, 1);
INSERT INTO public.games VALUES (30, 10, 1);
INSERT INTO public.games VALUES (45, 9, 14);
INSERT INTO public.games VALUES (46, 10, 14);
INSERT INTO public.games VALUES (47, 631, 15);
INSERT INTO public.games VALUES (48, 474, 15);
INSERT INTO public.games VALUES (49, 631, 16);
INSERT INTO public.games VALUES (50, 866, 16);
INSERT INTO public.games VALUES (51, 148, 15);
INSERT INTO public.games VALUES (52, 926, 15);
INSERT INTO public.games VALUES (53, 204, 15);
INSERT INTO public.games VALUES (54, 505, 17);
INSERT INTO public.games VALUES (55, 189, 17);
INSERT INTO public.games VALUES (56, 256, 18);
INSERT INTO public.games VALUES (57, 234, 18);
INSERT INTO public.games VALUES (58, 686, 17);
INSERT INTO public.games VALUES (59, 620, 17);
INSERT INTO public.games VALUES (60, 541, 17);
INSERT INTO public.games VALUES (61, 353, 19);
INSERT INTO public.games VALUES (62, 523, 19);
INSERT INTO public.games VALUES (63, 997, 20);
INSERT INTO public.games VALUES (64, 221, 20);
INSERT INTO public.games VALUES (65, 331, 19);
INSERT INTO public.games VALUES (66, 674, 19);
INSERT INTO public.games VALUES (67, 97, 19);
INSERT INTO public.games VALUES (68, 831, 21);
INSERT INTO public.games VALUES (69, 807, 21);
INSERT INTO public.games VALUES (70, 53, 22);
INSERT INTO public.games VALUES (71, 587, 22);
INSERT INTO public.games VALUES (72, 132, 21);
INSERT INTO public.games VALUES (73, 843, 21);
INSERT INTO public.games VALUES (74, 25, 21);
INSERT INTO public.games VALUES (75, 193, 23);
INSERT INTO public.games VALUES (76, 989, 23);
INSERT INTO public.games VALUES (77, 212, 24);
INSERT INTO public.games VALUES (78, 73, 24);
INSERT INTO public.games VALUES (79, 153, 23);
INSERT INTO public.games VALUES (80, 416, 23);
INSERT INTO public.games VALUES (81, 884, 23);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Ella');
INSERT INTO public.users VALUES (14, 'Pumpkin');
INSERT INTO public.users VALUES (15, 'user_1722174692549');
INSERT INTO public.users VALUES (16, 'user_1722174692548');
INSERT INTO public.users VALUES (17, 'user_1722174720414');
INSERT INTO public.users VALUES (18, 'user_1722174720413');
INSERT INTO public.users VALUES (19, 'user_1722174728692');
INSERT INTO public.users VALUES (20, 'user_1722174728691');
INSERT INTO public.users VALUES (21, 'user_1722174971463');
INSERT INTO public.users VALUES (22, 'user_1722174971462');
INSERT INTO public.users VALUES (23, 'user_1722174985498');
INSERT INTO public.users VALUES (24, 'user_1722174985497');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 81, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 24, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

