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
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    blackhole_id integer NOT NULL,
    gravity integer,
    galaxy integer,
    has_lives boolean DEFAULT false NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.blackhole_blackhole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blackhole_blackhole_id_seq OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.blackhole_blackhole_id_seq OWNED BY public.blackhole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    size integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    has_life boolean DEFAULT false,
    lives numeric(4,2) NOT NULL,
    distance_from_earth integer NOT NULL
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
    size integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    has_life boolean DEFAULT false,
    lives numeric(4,2) NOT NULL,
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
    size integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    has_life boolean DEFAULT false,
    lives numeric(4,2) NOT NULL,
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
    size integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    has_life boolean DEFAULT false,
    lives numeric(4,2) NOT NULL,
    galaxy_id integer
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
-- Name: blackhole blackhole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.blackhole_blackhole_id_seq'::regclass);


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
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES (1, 1, 1, false, 'Blackhole 1');
INSERT INTO public.blackhole VALUES (2, 1, 2, false, 'Blackhole 2');
INSERT INTO public.blackhole VALUES (3, 2, 3, false, 'Blackhole 3');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 100000, 'n1', 'interstellar', false, 20.20, 13000);
INSERT INTO public.galaxy VALUES (2, 100000, 'n2', 'gravity', false, 20.20, 13000);
INSERT INTO public.galaxy VALUES (3, 100000, 'n3', 'gravity3', false, 20.20, 13000);
INSERT INTO public.galaxy VALUES (4, 100000, 'n4', 'gravity4', false, 20.20, 13000);
INSERT INTO public.galaxy VALUES (5, 100000, 'n5', 'gravity5', false, 20.20, 13000);
INSERT INTO public.galaxy VALUES (6, 123000, 'n6', 'gravity6', false, 45.20, 13000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 200, 'm10', 'Apolo1', false, 11.00, 1);
INSERT INTO public.moon VALUES (5, 200, 'm11', 'Apolo2', false, 11.00, 2);
INSERT INTO public.moon VALUES (6, 200, 'm12', 'Apolo3', false, 11.00, 2);
INSERT INTO public.moon VALUES (7, 200, 'm13', 'Apolo4', false, 11.00, 3);
INSERT INTO public.moon VALUES (8, 220, 'm14', 'Apolo5', false, 11.00, 3);
INSERT INTO public.moon VALUES (9, 200, 'm15', 'Apolo6', false, 34.40, 2);
INSERT INTO public.moon VALUES (10, 350, 'm16', 'Apolo6', false, 11.00, 2);
INSERT INTO public.moon VALUES (11, 200, 'm17', 'Apolo7', false, 56.00, 3);
INSERT INTO public.moon VALUES (12, 200, 'm18', 'Apolo8', false, 61.08, 5);
INSERT INTO public.moon VALUES (13, 470, 'm19', 'Apolo9', false, 67.54, 5);
INSERT INTO public.moon VALUES (14, 500, 'm20', 'Apolo10', false, 34.40, 6);
INSERT INTO public.moon VALUES (17, 350, 'm56', 'Apolo 62', false, 11.00, 2);
INSERT INTO public.moon VALUES (18, 200, 'm67', 'Apolo 77 ', false, 56.00, 3);
INSERT INTO public.moon VALUES (19, 200, 'm78', 'Apolo 78', false, 61.08, 5);
INSERT INTO public.moon VALUES (20, 470, 'm 89', 'Apolo 98', false, 67.54, 5);
INSERT INTO public.moon VALUES (21, 500, 'm 90', 'Apolo 99', false, 34.40, 6);
INSERT INTO public.moon VALUES (22, 350, 'm26', 'Penukonda 45', false, 11.00, 2);
INSERT INTO public.moon VALUES (23, 200, 'm37', 'Penukonda 7', false, 56.00, 3);
INSERT INTO public.moon VALUES (24, 200, 'm48', 'Gorantla 78', false, 61.08, 5);
INSERT INTO public.moon VALUES (25, 470, 'm59', 'Gorantla 89', false, 67.54, 5);
INSERT INTO public.moon VALUES (26, 500, 'm90', 'Gorantla 999', false, 34.40, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 35, 'p1', 'Dawn to the planet of Apes', false, 25.78, 1);
INSERT INTO public.planet VALUES (2, 37, 'p2', 'Dawn to the planet of Apes', false, 35.78, 2);
INSERT INTO public.planet VALUES (3, 78, 'p3', 'Dawn to the planet of Apes', false, 40.48, 2);
INSERT INTO public.planet VALUES (4, 123, 'p4', 'Dawn to the planet of Apes', false, 67.48, 3);
INSERT INTO public.planet VALUES (5, 136, 'p5', 'Dawn to the planet of Apes', false, 70.48, 4);
INSERT INTO public.planet VALUES (6, 145, 'p6', 'Dawn to the planet of Apes', false, 70.48, 5);
INSERT INTO public.planet VALUES (7, 145, 'p7', 'Dawn to the planet of Apes', false, 76.48, 5);
INSERT INTO public.planet VALUES (8, 147, 'p8', 'The Rise of planet of Apes', false, 80.78, 4);
INSERT INTO public.planet VALUES (9, 153, 'p9', 'The Rise of Planet of Apes', false, 81.90, 3);
INSERT INTO public.planet VALUES (10, 167, 'p10', 'The Rise of Planet of Apes', false, 89.23, 4);
INSERT INTO public.planet VALUES (11, 190, 'p11', 'The Rise of Planet of Apes', false, 90.43, 3);
INSERT INTO public.planet VALUES (12, 220, 'p12', 'The Rise of Planet of Apes', false, 98.77, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 15, 's1', 'star light 1', false, 25.70, 1);
INSERT INTO public.star VALUES (2, 15, 's2', 'star light 2', false, 25.70, 1);
INSERT INTO public.star VALUES (3, 15, 's3', 'star light 3', false, 25.70, 1);
INSERT INTO public.star VALUES (4, 15, 's4', 'star light 4', false, 35.70, 1);
INSERT INTO public.star VALUES (5, 15, 's5', 'star light 5', false, 35.70, 1);
INSERT INTO public.star VALUES (6, 57, 's6', 'star light 6', false, 99.70, 1);


--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.blackhole_blackhole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: blackhole blackhole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_name_key UNIQUE (name);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

