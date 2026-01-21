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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    orbital_period_years numeric,
    composition text,
    has_tail boolean DEFAULT true NOT NULL,
    is_periodic boolean,
    perihelion_distance_au integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter_km integer NOT NULL,
    age_billions numeric(3,1),
    description text,
    has_black_hole boolean DEFAULT false NOT NULL,
    is_spiral boolean,
    mass_solar_masses integer
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    orbital_period_days numeric,
    has_water boolean DEFAULT false NOT NULL,
    is_volcanic boolean
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    diameter_km integer NOT NULL,
    orbital_period_days numeric,
    atmosphere text,
    has_life boolean DEFAULT false NOT NULL,
    is_habitable boolean,
    mass_earth integer
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature_kelvin integer NOT NULL,
    luminosity_solar numeric,
    spectral_type text,
    has_planets boolean DEFAULT false NOT NULL,
    is_variable boolean,
    radius_solar integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 1, 15, 76.0, 'Hielo/Polvo', true, true, 0);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 2, 40, 2530.0, 'CN/H2O', true, false, 1);
INSERT INTO public.comet VALUES (3, 'Shoemaker-Levy', 3, 4, 2.2, 'Fragmentado', true, true, 0);
INSERT INTO public.comet VALUES (4, 'Encke', 4, 6, 3.3, 'Carbonáceo', true, true, 0);
INSERT INTO public.comet VALUES (5, 'Hyakutake', 5, 8, 17000.0, 'Hidrógeno', true, false, 0);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andrómeda', 220000, 10.0, 'Galaxia espiral vecina', true, true, 1200000);
INSERT INTO public.galaxy VALUES (2, 'Vía Láctea', 100000, 13.6, 'Nuestra galaxia', true, true, 1000000);
INSERT INTO public.galaxy VALUES (3, 'Triángulo', 60000, 12.0, 'Galaxia espiral', false, true, 50000);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 50000, 11.0, 'Elíptica con chorros', true, false, 80000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 90000, 9.0, 'Espiral con anillo', false, true, 60000);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 150000, 10.5, 'Anillada por colisión', false, false, 40000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 3475, 27.32, true, false);
INSERT INTO public.moon VALUES (2, 'Fobos', 2, 22, 0.32, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, 1.26, false, false);
INSERT INTO public.moon VALUES (4, 'Io', 3, 3643, 1.77, false, true);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3122, 3.55, true, false);
INSERT INTO public.moon VALUES (6, 'Ganimedes', 3, 5268, 7.15, true, false);
INSERT INTO public.moon VALUES (7, 'Calisto', 3, 4821, 16.69, true, false);
INSERT INTO public.moon VALUES (8, 'Luna-Kepler1', 4, 1500, 5.0, true, true);
INSERT INTO public.moon VALUES (9, 'Luna-Proxima1', 5, 800, 2.5, false, false);
INSERT INTO public.moon VALUES (10, 'TRAPPIST-1e-I', 6, 1200, 1.0, true, false);
INSERT INTO public.moon VALUES (11, 'TRAPPIST-1e-II', 6, 900, 3.0, false, true);
INSERT INTO public.moon VALUES (12, 'Cancri-I', 7, 2000, 0.5, false, true);
INSERT INTO public.moon VALUES (13, 'HD189-I', 8, 5000, 1.5, false, false);
INSERT INTO public.moon VALUES (14, 'WASP-I', 9, 3000, 0.9, true, true);
INSERT INTO public.moon VALUES (15, 'GJ1214-I', 10, 4000, 10.0, true, false);
INSERT INTO public.moon VALUES (16, 'HAT-I', 11, 600, 2.0, false, false);
INSERT INTO public.moon VALUES (17, 'K2-I', 12, 1800, 8.0, false, true);
INSERT INTO public.moon VALUES (18, 'Extra1', 1, 1000, 15.0, true, false);
INSERT INTO public.moon VALUES (19, 'Extra2', 2, 500, 1.0, false, true);
INSERT INTO public.moon VALUES (20, 'Extra3', 4, 700, 4.0, false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Tierra', 4, 12742, 365.25, 'Nitrógeno/Oxígeno', true, true, 1);
INSERT INTO public.planet VALUES (2, 'Marte', 4, 6779, 687.0, 'CO2', false, true, 0);
INSERT INTO public.planet VALUES (3, 'Júpiter', 4, 142984, 4332.59, 'Hidrógeno/Helio', false, false, 318);
INSERT INTO public.planet VALUES (4, 'Kepler-452b', 1, 21000, 385.0, 'Desconocida', false, true, 5);
INSERT INTO public.planet VALUES (5, 'Proxima b', 4, 12000, 11.2, 'Posible H2O', false, true, 1);
INSERT INTO public.planet VALUES (6, 'TRAPPIST-1e', 2, 10200, 6.1, 'CO2/H2O', false, true, 1);
INSERT INTO public.planet VALUES (7, '55 Cancri e', 3, 29000, 0.8, 'Vapor/roca', false, false, 9);
INSERT INTO public.planet VALUES (8, 'HD 189733b', 5, 160000, 2.2, 'Silicato', false, false, 1);
INSERT INTO public.planet VALUES (9, 'WASP-12b', 6, 192000, 1.1, 'Sodio/potasio', false, false, 1);
INSERT INTO public.planet VALUES (10, 'GJ 1214 b', 1, 25000, 38.0, 'Agua vapor', false, false, 7);
INSERT INTO public.planet VALUES (11, 'HAT-P-11b', 2, 5200, 4.9, 'Hidrógeno', false, true, 0);
INSERT INTO public.planet VALUES (12, 'K2-106 b', 3, 21000, 17.0, 'Hierro', false, false, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', 2, 3600, 126000, 'M1-1a', true, true, 887);
INSERT INTO public.star VALUES (2, 'Rigel', 2, 12100, 120, 'B8Ia', true, false, 79);
INSERT INTO public.star VALUES (3, 'Alnilam', 2, 27000, 537000, 'O9.7', true, false, 28);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 2, 3042, 0.0017, 'M5.5Ve', true, true, 0);
INSERT INTO public.star VALUES (5, 'Sirio', 2, 9940, 25.4, 'A1V', false, false, 2);
INSERT INTO public.star VALUES (6, 'Vega', 2, 9602, 40, 'A0V', true, false, 2);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: comet comet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

