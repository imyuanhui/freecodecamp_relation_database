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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: astronauts; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronauts (
    astronauts_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_discovered integer,
    moon_discovered integer
);


ALTER TABLE public.astronauts OWNER TO freecodecamp;

--
-- Name: astronauts_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronauts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronauts_id_seq OWNER TO freecodecamp;

--
-- Name: astronauts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronauts_id_seq OWNED BY public.astronauts.astronauts_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    type character varying(30),
    diameter_in_ly numeric,
    constellation text,
    distance_in_mly numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    radius_km numeric,
    distance_from_planet_km numeric,
    orbital_period_days numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    type text,
    distance_from_star numeric,
    is_in_solar_system boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_id integer,
    distance_in_ly numeric(4,2),
    type text,
    is_host_star boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: astronauts astronauts_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronauts ALTER COLUMN astronauts_id SET DEFAULT nextval('public.astronauts_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: astronauts; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronauts VALUES (1, 'a', 12, 13);
INSERT INTO public.astronauts VALUES (2, 'b', 4, 0);
INSERT INTO public.astronauts VALUES (3, 'c', 0, 2);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 'dwarf', 32500, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'elliptical', 132000, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', 'spiral', 152000, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'IC 1101', 'elliptical', 550000, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'NGC 1387', 'lenticular', 530000, NULL, 53);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', 87400, NULL, 28);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (4, 'Callisto', 2410.3, 1882700, 16.69, 1);
INSERT INTO public.moon VALUES (5, 'Titan', 2574.7, 1221870, 15.95, 1);
INSERT INTO public.moon VALUES (6, 'Enceladus', 252.1, 237948, 1.37, 1);
INSERT INTO public.moon VALUES (7, 'Rhea', 764.5, 527108, 4.52, 1);
INSERT INTO public.moon VALUES (8, 'Iapetus', 734.5, 3560820, 79.32, 1);
INSERT INTO public.moon VALUES (9, 'Titania', 788.9, 435910, 8.71, 1);
INSERT INTO public.moon VALUES (10, 'Oberon', 761.4, 583520, 13.46, 1);
INSERT INTO public.moon VALUES (11, 'Umbriel', 584.7, 266300, 4.14, 1);
INSERT INTO public.moon VALUES (12, 'Ariel', 578.9, 191020, 2.52, 1);
INSERT INTO public.moon VALUES (13, 'Triton', 1353.4, 354800, -5.88, 1);
INSERT INTO public.moon VALUES (14, 'Proteus', 210, 117647, 1.12, 1);
INSERT INTO public.moon VALUES (15, 'Nereid', 170, 5513810, 360.14, 1);
INSERT INTO public.moon VALUES (16, 'Phobos', 11.3, 9378, 0.32, 1);
INSERT INTO public.moon VALUES (17, 'Deimos', 6.2, 23463, 1.26, 1);
INSERT INTO public.moon VALUES (18, 'Proxima b I', 1000, 50000, 7.5, 1);
INSERT INTO public.moon VALUES (19, 'Proxima b II', 800, 100000, 15.0, 1);
INSERT INTO public.moon VALUES (20, 'Kepler-22b I', 1500, 70000, 10.0, 1);
INSERT INTO public.moon VALUES (21, 'Kepler-22b II', 1200, 140000, 20.0, 1);
INSERT INTO public.moon VALUES (1, 'Io', 1821.6, 421700, 1.77, 1);
INSERT INTO public.moon VALUES (2, 'Europa', 1560.8, 670900, 3.55, 1);
INSERT INTO public.moon VALUES (3, 'Ganymede', 2634.1, 1070400, 7.15, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Venus', 'terrestrial', 0.72, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'terrestrial', 1, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'terrestrial', 1.52, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'gas giant', 5.20, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'gas giant', 9.58, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'ice giant', 19.22, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'ice giant', 30.05, true, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 'exoplanet', 0.85, false, 1);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 'exoplanet', 0.05, false, 1);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 'exoplanet', 0.13, false, 1);
INSERT INTO public.planet VALUES (12, '51 Pegasi b', 'exoplanet', 0.05, false, 1);
INSERT INTO public.planet VALUES (1, 'Mercury', 'terrestrial', 0.39, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 0.00, 'G2V', true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 8.60, 'A1V', false);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 64.00, 'M2lab', false);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 1, 4.37, 'G2V', false);
INSERT INTO public.star VALUES (5, 'Vega', 1, 25.50, 'A0V', false);
INSERT INTO public.star VALUES (6, 'Antares', 1, 55.00, 'M1.5lab', false);


--
-- Name: astronauts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronauts_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: astronauts astronauts_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronauts
    ADD CONSTRAINT astronauts_pkey PRIMARY KEY (astronauts_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: astronauts name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronauts
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
