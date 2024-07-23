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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric(15,0),
    galaxy_type_id integer,
    distance_from_earth_light_years bigint
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_within_the_solar_system boolean NOT NULL,
    is_spherical boolean,
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
    name character varying(30) NOT NULL,
    description text,
    is_within_the_solar_system boolean NOT NULL,
    planet_type_id integer,
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milkyway Galaxy', 'This is the galaxy that Earth is in. The dense parts of the Milky Way Galaxy look like a haze in the night sky, and are dimly lit, so it is also called the Milky Way Galaxy.', 13610000000000, 4, 28000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'The Andromeda Galaxy is a barred spiral galaxy and is the nearest major galaxy to the Milky Way.', 10010000000, 3, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Messier 81', 'It is called the Bode Galaxy after Johann Bode, who discovered it in 1774.', 13310000000, 5, 11740000);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'The Large Magellanic Cloud is a dwarf galaxy and a satellite galaxy of the Milky Way.', 1101000000, 5, 158200);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Along with the Large Magellanic Cloud, it is a satellite galaxy of the Milky Way Galaxy.', 450000, 5, 199000);
INSERT INTO public.galaxy VALUES (6, 'Comet Galaxy', 'It is a spiral galaxy within Abell 2667, and as it moves quickly through the galaxy cluster, tidal forces are stripping it of its stars and gas, giving it the appearance of a comet.', NULL, 3, 3200000);
INSERT INTO public.galaxy VALUES (7, 'other', 'other', NULL, NULL, NULL);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Elliptical galaxy', 'An elliptical galaxy is a type of galaxy with an approximately ellipsoidal shape and a smooth, nearly featureless image. ');
INSERT INTO public.galaxy_type VALUES (2, 'Lenticular galaxy', 'A lenticular galaxy (denoted S0) is a type of galaxy intermediate between an elliptical (denoted E) and a spiral galaxy in galaxy morphological classification schemes.');
INSERT INTO public.galaxy_type VALUES (3, 'Spiral galaxy', 'Most spiral galaxies consist of a flat, rotating disk containing stars, gas and dust, and a central concentration of stars known as the bulge.');
INSERT INTO public.galaxy_type VALUES (4, 'Barred spiral galaxy', 'A barred spiral galaxy is a spiral galaxy with a central bar-shaped structure composed of stars.');
INSERT INTO public.galaxy_type VALUES (5, 'others', 'Some galaxies have unusual properties due to interactions with other galaxies.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', true, true, 15);
INSERT INTO public.moon VALUES (2, 'Mars I Phobos', true, false, 16);
INSERT INTO public.moon VALUES (3, 'Mars II Deimos', true, false, 16);
INSERT INTO public.moon VALUES (4, 'Jupiter III Ganymede', true, true, 17);
INSERT INTO public.moon VALUES (5, 'Jupiter IV Callisto', true, true, 17);
INSERT INTO public.moon VALUES (6, 'Jupiter I Io', true, true, 17);
INSERT INTO public.moon VALUES (7, 'Jupiter II Europa', true, true, 17);
INSERT INTO public.moon VALUES (8, 'Jupiter V Amalthea', true, false, 17);
INSERT INTO public.moon VALUES (9, 'Jupiter VI Himalia', true, NULL, 17);
INSERT INTO public.moon VALUES (10, 'Jupiter XIV Thebe', true, false, 17);
INSERT INTO public.moon VALUES (11, 'Jupiter VII Elara', true, true, 17);
INSERT INTO public.moon VALUES (12, 'Jupiter VIII Pasiphae', true, NULL, 17);
INSERT INTO public.moon VALUES (13, 'Titan', true, true, 18);
INSERT INTO public.moon VALUES (14, 'Saturn V Rhea', true, true, 18);
INSERT INTO public.moon VALUES (15, 'Saturn VIII Iapetus', true, true, 18);
INSERT INTO public.moon VALUES (16, 'Saturn IV Dione', true, true, 18);
INSERT INTO public.moon VALUES (17, 'Saturn III Tethys', true, true, 18);
INSERT INTO public.moon VALUES (18, 'Uranus III Titania', true, true, 19);
INSERT INTO public.moon VALUES (19, 'Uranus IV Oberon', true, true, 19);
INSERT INTO public.moon VALUES (20, 'Uranus II Umbriel', true, true, 19);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Mercury', 'The temperature difference between day and night is huge', true, 1, 1);
INSERT INTO public.planet VALUES (14, 'Venus', 'Its size is similar to that of Earth, but its surface is hot and highly pressurized.', true, 1, 1);
INSERT INTO public.planet VALUES (15, 'Earth', 'The only planet in the solar system where life has been confirmed', true, 1, 1);
INSERT INTO public.planet VALUES (16, 'Mars', 'The surface is red and contains huge volcanoes and canyons.', true, 1, 1);
INSERT INTO public.planet VALUES (17, 'Jupiter', 'The largest planet in the solar system, composed mainly of hydrogen gas.', true, 2, 1);
INSERT INTO public.planet VALUES (18, 'Saturn', 'It is a gas giant like Jupiter and has rings that can be seen even with a small telescope.', true, 2, 1);
INSERT INTO public.planet VALUES (19, 'Uranus', 'It rotates almost sideways.', true, 3, 1);
INSERT INTO public.planet VALUES (20, 'Neptune', 'A strong storm is believed to be blowing on the surface.', true, 3, 1);
INSERT INTO public.planet VALUES (21, 'Kepler-22b', 'It is an exoplanet orbiting within the habitable zone of the star Kepler 22.', false, 4, 7);
INSERT INTO public.planet VALUES (22, 'TRAPPIST-1d', 'It is a rocky exoplanet orbiting the red dwarf star TRAPPIST-1 near the inside of its habitable zone.', false, 1, 7);
INSERT INTO public.planet VALUES (23, 'Proxima Centauri b', 'Proxima Centauri b is the closest star to the Sun.', false, 1, 2);
INSERT INTO public.planet VALUES (24, 'Gliese 581g', 'The surface temperature ranges from -31°C to -12°C, allowing liquid water to exist, and it is believed that the planet could maintain an environment suitable for life.', false, 1, 7);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial planets', 'That is composed primarily of silicate, rocks or metals.');
INSERT INTO public.planet_type VALUES (2, 'Jupiter-type planets', 'A general term for planets similar to Jupiter when classifying planets.');
INSERT INTO public.planet_type VALUES (3, 'Uranus-type plantes', 'A giant planet made up of ice and liquid water, including methane and ammonia.');
INSERT INTO public.planet_type VALUES (4, 'not clear', 'Not been determined');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our solar system. A G-type main sequence star (yellow dwarf).', 4600, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'The closest star to the Sun, a red dwarf star, part of the Alpha Centauri star system.', 4500, 7);
INSERT INTO public.star VALUES (3, 'Sirius', 'The brightest star in the constellation Canis Major. A binary system consisting of an A-type main sequence star and a white dwarf.', 300, 7);
INSERT INTO public.star VALUES (4, 'Altair', 'The brightest star in Aquila, it is an A-type main sequence star and one of the stars that make up the Summer Triangle.', 1000, 7);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'A red supergiant located at the shoulder of Orion. It is a variable star and is predicted to explode as a supernova in the future.', 10, 7);
INSERT INTO public.star VALUES (6, 'Rigel', 'A blue-white supergiant star located at the foot of the constellation Orion. It is extremely bright and massive.', 8, 7);
INSERT INTO public.star VALUES (7, 'other', 'other', NULL, 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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

