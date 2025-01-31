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
-- Name: celestial_events; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_events (
    celestial_events_id integer NOT NULL,
    event_type character varying(80) NOT NULL,
    duration text,
    visible_from_earth boolean,
    predictability numeric(5,2),
    name character varying(60) NOT NULL,
    galaxy_id integer,
    planet_id integer
);


ALTER TABLE public.celestial_events OWNER TO freecodecamp;

--
-- Name: celestial_events_celestial_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_events_celestial_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_events_celestial_event_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_events_celestial_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_events_celestial_event_id_seq OWNED BY public.celestial_events.celestial_events_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    type text NOT NULL,
    size numeric(10,2),
    age integer,
    composition character varying(25),
    discoverer character varying(50),
    observer_notes character varying(200),
    visual_magnitude integer,
    name character varying(60) NOT NULL
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
    name character varying(60) NOT NULL,
    size numeric(10,2),
    unusual_characteristic text,
    temperature numeric(5,2),
    obital_period text,
    discoverer character varying(60),
    discoverer_notes character varying(200),
    interesting_facts character varying(200),
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
    name character varying(60) NOT NULL,
    size numeric(10,2),
    rings boolean,
    temperature numeric(5,2),
    obital_period text,
    discoverer character varying(60),
    discoverer_notes character varying(200),
    interesting_facts character varying(200),
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
    name character varying(60) NOT NULL,
    type text,
    brightness numeric(6,2) NOT NULL,
    temperature numeric(5,2),
    mass_in_tons numeric(9,2),
    discoverer character varying(60),
    discoverer_notes character varying(200),
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
-- Name: celestial_events celestial_events_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events ALTER COLUMN celestial_events_id SET DEFAULT nextval('public.celestial_events_celestial_event_id_seq'::regclass);


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
-- Data for Name: celestial_events; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_events VALUES (1, 'Eclipse', 'Few minutes to a few hours', true, 99.99, 'Solar Eclipse', 1, 15);
INSERT INTO public.celestial_events VALUES (2, 'Eclipse', 'Few hours', true, 99.99, 'Lunar Eclipse', 3, 15);
INSERT INTO public.celestial_events VALUES (3, 'Comet', 'Several months', true, 75.00, 'Halley^s Comet', 4, 16);
INSERT INTO public.celestial_events VALUES (4, 'Meteor Shower', 'Several days', true, 95.00, 'Perseid Meteor Shower', 6, 16);
INSERT INTO public.celestial_events VALUES (5, 'Transit', 'Several hours', true, 99.99, 'Transit of Venus', 1, 17);
INSERT INTO public.celestial_events VALUES (6, 'Stellar Explosion', 'Few weeks to months', false, 0.00, 'Supernova', 2, 18);
INSERT INTO public.celestial_events VALUES (7, 'Aurora', 'Several hours', true, 80.00, 'Aurora Borealis', 7, 19);
INSERT INTO public.celestial_events VALUES (8, 'Eclipse', 'Few minutes', true, 99.99, 'Total Solar Eclipse', 4, 20);
INSERT INTO public.celestial_events VALUES (9, 'Meteor Shower', 'Several days', true, 90.00, 'Leonid Meteor Shower', 3, 21);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Spiral', 13.51, 100000, NULL, NULL, NULL, NULL, 'Milky Way');
INSERT INTO public.galaxy VALUES (2, 'Spiral', 10.00, 220000, NULL, NULL, NULL, NULL, 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'Spiral', 12.00, 60000, NULL, NULL, NULL, NULL, 'Triangulum');
INSERT INTO public.galaxy VALUES (4, 'Elliptical', 13.25, 120000, NULL, NULL, NULL, NULL, 'Messier 87');
INSERT INTO public.galaxy VALUES (5, 'Elliptical', 12.89, 50000, NULL, NULL, NULL, NULL, 'Sombrero');
INSERT INTO public.galaxy VALUES (6, 'Irregular', 13.00, 14000, NULL, NULL, NULL, NULL, 'Large Magellanic Cloud');
INSERT INTO public.galaxy VALUES (7, 'Irregular', 13.00, 7000, NULL, NULL, NULL, NULL, 'Small Magellanic Cloud');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3474.80, 'Only natural satellite of Earth', -20.00, '27.3 days', NULL, NULL, 'The Moon is the fifth largest moon in the Solar System.', 21);
INSERT INTO public.moon VALUES (2, 'Phobos', 22.40, 'Heavily cratered', -40.00, '0.3 days', NULL, NULL, 'Phobos is one of the two moons of Mars.', 15);
INSERT INTO public.moon VALUES (3, 'Deimos', 12.40, 'Smooth surface', -40.00, '1.3 days', NULL, NULL, 'Deimos is the smaller and outermost moon of Mars.', 22);
INSERT INTO public.moon VALUES (4, 'Io', 3642.60, 'Volcanically active', -143.00, '1.8 days', NULL, NULL, 'Io is the most volcanically active body in the Solar System.', 16);
INSERT INTO public.moon VALUES (5, 'Europa', 3121.60, 'Ice-covered surface', -160.00, '3.5 days', NULL, NULL, 'Europa is believed to have a subsurface ocean.', 16);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5268.20, 'Largest moon in the Solar System', -160.00, '7.2 days', NULL, NULL, 'Ganymede has its own magnetic field.', 23);
INSERT INTO public.moon VALUES (7, 'Callisto', 4820.60, 'Heavily cratered', -139.00, '16.7 days', NULL, NULL, 'Callisto is the second largest moon of Jupiter.', 16);
INSERT INTO public.moon VALUES (8, 'Titan', 5150.00, 'Thick atmosphere', -179.00, '15.9 days', NULL, NULL, 'Titan is the only moon with a dense atmosphere.', 24);
INSERT INTO public.moon VALUES (9, 'Rhea', 1527.60, 'Icy surface', -174.00, '4.5 days', NULL, NULL, 'Rhea is the second largest moon of Saturn.', 17);
INSERT INTO public.moon VALUES (10, 'Iapetus', 1469.00, 'Two-tone coloration', -143.00, '79.3 days', NULL, NULL, 'Iapetus has a distinctive two-tone coloration.', 25);
INSERT INTO public.moon VALUES (11, 'Dione', 1122.80, 'Bright wisps', -186.00, '2.7 days', NULL, NULL, 'Dione has bright ice cliffs.', 17);
INSERT INTO public.moon VALUES (12, 'Tethys', 1062.20, 'Large impact crater', -187.00, '1.9 days', NULL, NULL, 'Tethys has a large impact crater called Odysseus.', 26);
INSERT INTO public.moon VALUES (13, 'Enceladus', 504.20, 'Geologically active', -201.00, '1.4 days', NULL, NULL, 'Enceladus has geysers that eject water ice.', 17);
INSERT INTO public.moon VALUES (14, 'Miranda', 471.60, 'Extreme geological features', -187.00, '1.4 days', NULL, NULL, 'Miranda has the tallest cliff in the Solar System.', 18);
INSERT INTO public.moon VALUES (15, 'Ariel', 1157.80, 'Canyons and valleys', -213.00, '2.5 days', NULL, NULL, 'Ariel has the brightest surface of Uranus moons.', 27);
INSERT INTO public.moon VALUES (16, 'Umbriel', 1169.40, 'Dark surface', -214.00, '4.1 days', NULL, NULL, 'Umbriel has a very dark surface.', 18);
INSERT INTO public.moon VALUES (17, 'Titania', 1577.80, 'Largest moon of Uranus', -209.00, '8.7 days', NULL, NULL, 'Titania has a large number of impact craters.', 28);
INSERT INTO public.moon VALUES (18, 'Oberon', 1522.80, 'Second largest moon of Uranus', -200.00, '13.5 days', NULL, NULL, 'Oberon has many large impact craters.', 18);
INSERT INTO public.moon VALUES (19, 'Triton', 2706.80, 'Retrograde orbit', -235.00, '5.9 days', NULL, NULL, 'Triton is the largest moon of Neptune.', 19);
INSERT INTO public.moon VALUES (20, 'Nereid', 340.00, 'Highly eccentric orbit', -235.00, '360.1 days', NULL, NULL, 'Nereid has one of the most eccentric orbits of any moon.', 19);
INSERT INTO public.moon VALUES (21, 'Charon', 1212.00, 'Binary system with Pluto', -220.00, '6.4 days', NULL, NULL, 'Charon is the largest moon of Pluto.', 20);
INSERT INTO public.moon VALUES (22, 'Hydra', 51.00, 'Irregular shape', -220.00, '38.2 days', NULL, NULL, 'Hydra is one of Plutos outer moons.', 20);
INSERT INTO public.moon VALUES (23, 'Nix', 49.80, 'Irregular shape', -220.00, '24.9 days', NULL, NULL, 'Nix is one of Plutos outer moons.', 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (15, 'Mercury', 4879.40, false, 167.00, '87.97', NULL, NULL, 'Mercury is the smallest planet in our solar system.', 1);
INSERT INTO public.planet VALUES (16, 'Venus', 12104.00, false, 464.00, '224.70', NULL, NULL, 'Venus has a thick atmosphere that traps heat.', 2);
INSERT INTO public.planet VALUES (17, 'Earth', 12742.00, false, 15.00, '365.25', NULL, NULL, 'Earth is the only planet known to support life.', 3);
INSERT INTO public.planet VALUES (18, 'Mars', 6779.00, false, -65.00, '687.00', NULL, NULL, 'Mars is known as the Red Planet.', 4);
INSERT INTO public.planet VALUES (19, 'Jupiter', 139820.00, true, -110.00, '4331.00', NULL, NULL, 'Jupiter is the largest planet in our solar system.', 5);
INSERT INTO public.planet VALUES (20, 'Saturn', 116460.00, true, -140.00, '10747.00', NULL, NULL, 'Saturn is famous for its extensive ring system.', 6);
INSERT INTO public.planet VALUES (21, 'Uranus', 50724.00, true, -195.00, '30589.00', NULL, NULL, 'Uranus rotates on its side.', 7);
INSERT INTO public.planet VALUES (22, 'Neptune', 49244.00, true, -200.00, '59800.00', NULL, NULL, 'Neptune has the strongest winds in the solar system.', 1);
INSERT INTO public.planet VALUES (23, 'Pluto', 2376.60, false, -225.00, '90560.00', NULL, NULL, 'Pluto is a dwarf planet in the Kuiper belt.', 2);
INSERT INTO public.planet VALUES (24, 'Ceres', 939.40, false, -105.00, '1680.00', NULL, NULL, 'Ceres is the largest object in the asteroid belt.', 3);
INSERT INTO public.planet VALUES (25, 'Haumea', 1960.00, false, -241.00, '103774.00', NULL, NULL, 'Haumea is known for its elongated shape.', 4);
INSERT INTO public.planet VALUES (26, 'Makemake', 1430.00, false, -243.00, '112897.00', NULL, NULL, 'Makemake is one of the largest known dwarf planets.', 5);
INSERT INTO public.planet VALUES (27, 'Eris', 2326.00, false, -243.00, '203830.00', NULL, NULL, 'Eris is the most massive dwarf planet in the solar system.', 6);
INSERT INTO public.planet VALUES (28, 'Ganymede', 5268.20, false, -160.00, '7.15', NULL, NULL, 'Ganymede is the largest moon of Jupiter.', 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type', 1.00, 577.80, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'M-type', 0.17, 304.20, NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (3, 'Sirius', 'A-type', 25.40, 994.00, NULL, NULL, NULL, 3);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'M-type', 1260.00, 350.00, NULL, NULL, NULL, 4);
INSERT INTO public.star VALUES (5, 'Rigel', 'B-type', 1200.00, 121.00, NULL, NULL, NULL, 5);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 'G-type', 1.52, 579.00, NULL, NULL, NULL, 6);
INSERT INTO public.star VALUES (7, 'Alpha Centauri B', 'K-type', 0.45, 526.00, NULL, NULL, NULL, 7);


--
-- Name: celestial_events_celestial_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_events_celestial_event_id_seq', 9, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 28, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: celestial_events celestial_events_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events
    ADD CONSTRAINT celestial_events_name_key UNIQUE (name);


--
-- Name: celestial_events celestial_events_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events
    ADD CONSTRAINT celestial_events_pkey PRIMARY KEY (celestial_events_id);


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
-- Name: celestial_events celestial_events_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events
    ADD CONSTRAINT celestial_events_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: celestial_events celestial_events_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events
    ADD CONSTRAINT celestial_events_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

