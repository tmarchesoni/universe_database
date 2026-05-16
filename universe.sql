-- =============================================
-- BANCO DE DADOS CELESTE - universe
-- =============================================

CREATE DATABASE universe;
\c universe

-- =====================
-- TABELA: galaxy
-- =====================
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    galaxy_type TEXT NOT NULL,
    distance_light_years NUMERIC,
    number_of_stars NUMERIC,
    has_black_hole BOOLEAN NOT NULL
);

-- =====================
-- TABELA: star
-- =====================
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    spectral_type VARCHAR(10) NOT NULL,
    age_millions_years INT,
    is_main_sequence BOOLEAN NOT NULL
);

-- =====================
-- TABELA: planet
-- =====================
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    star_id INT NOT NULL REFERENCES star(star_id),
    has_rings BOOLEAN NOT NULL,
    has_life BOOLEAN NOT NULL,
    diameter_km INT,
    orbital_period_days NUMERIC
);

-- =====================
-- TABELA: moon
-- =====================
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    planet_id INT NOT NULL REFERENCES planet(planet_id),
    is_spherical BOOLEAN NOT NULL,
    has_atmosphere BOOLEAN NOT NULL,
    diameter_km INT,
    orbital_period_days NUMERIC
);

-- =====================
-- TABELA: constellation
-- =====================
CREATE TABLE constellation (
    constellation_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    number_of_stars INT NOT NULL,
    is_zodiac BOOLEAN NOT NULL
);

-- =====================
-- DADOS: galaxy
-- =====================
INSERT INTO galaxy (name, galaxy_type, distance_light_years, number_of_stars, has_black_hole) VALUES
    ('Milky Way', 'Spiral', 0, 400000000000, TRUE),
    ('Andromeda', 'Spiral', 2537000, 1000000000000, TRUE),
    ('Triangulum', 'Spiral', 2730000, 40000000000, FALSE),
    ('Large Magellanic', 'Irregular', 158200, 30000000000, FALSE),
    ('Small Magellanic', 'Irregular', 200000, 3000000000, FALSE),
    ('Centaurus A', 'Elliptical', 13000000, 100000000000, TRUE);

-- =====================
-- DADOS: star
-- =====================
INSERT INTO star (name, galaxy_id, spectral_type, age_millions_years, is_main_sequence) VALUES
    ('Sun', 1, 'G2V', 4600, TRUE),
    ('Sirius A', 1, 'A1V', 242, TRUE),
    ('Alpha Centauri A', 1, 'G2V', 6000, TRUE),
    ('Betelgeuse', 1, 'M1I', 8, FALSE),
    ('Rigel', 1, 'B8I', 8, FALSE),
    ('Proxima Centauri', 1, 'M5V', 4850, TRUE);

-- =====================
-- DADOS: planet
-- =====================
INSERT INTO planet (name, star_id, has_rings, has_life, diameter_km, orbital_period_days) VALUES
    ('Mercury', 1, FALSE, FALSE, 4879, 87.97),
    ('Venus', 1, FALSE, FALSE, 12104, 224.70),
    ('Earth', 1, FALSE, TRUE, 12756, 365.25),
    ('Mars', 1, FALSE, FALSE, 6792, 686.97),
    ('Jupiter', 1, TRUE, FALSE, 142984, 4332.59),
    ('Saturn', 1, TRUE, FALSE, 120536, 10759.22),
    ('Uranus', 1, TRUE, FALSE, 51118, 30688.50),
    ('Neptune', 1, TRUE, FALSE, 49528, 60182.00),
    ('Proxima b', 6, FALSE, FALSE, 14000, 11.19),
    ('Proxima c', 6, FALSE, FALSE, 20000, 1928.00),
    ('Rigel I', 5, FALSE, FALSE, 90000, 510.00),
    ('Rigel II', 5, TRUE, FALSE, 110000, 1200.00);

-- =====================
-- DADOS: moon
-- =====================
INSERT INTO moon (name, planet_id, is_spherical, has_atmosphere, diameter_km, orbital_period_days) VALUES
    ('Moon', 3, TRUE, TRUE, 3474, 27.32),
    ('Phobos', 4, FALSE, FALSE, 22, 0.32),
    ('Deimos', 4, FALSE, FALSE, 12, 1.26),
    ('Io', 5, TRUE, TRUE, 3643, 1.77),
    ('Europa', 5, TRUE, TRUE, 3122, 3.55),
    ('Ganymede', 5, TRUE, TRUE, 5268, 7.15),
    ('Callisto', 5, TRUE, FALSE, 4821, 16.69),
    ('Titan', 6, TRUE, TRUE, 5150, 15.95),
    ('Enceladus', 6, TRUE, TRUE, 504, 1.37),
    ('Mimas', 6, TRUE, FALSE, 396, 0.94),
    ('Dione', 6, TRUE, FALSE, 1123, 2.74),
    ('Rhea', 6, TRUE, FALSE, 1527, 4.52),
    ('Miranda', 7, TRUE, FALSE, 472, 1.41),
    ('Ariel', 7, TRUE, FALSE, 1158, 2.52),
    ('Umbriel', 7, TRUE, FALSE, 1169, 4.14),
    ('Titania', 7, TRUE, FALSE, 1578, 8.71),
    ('Oberon', 7, TRUE, FALSE, 1523, 13.46),
    ('Triton', 8, TRUE, TRUE, 2707, 5.88),
    ('Nereid', 8, FALSE, FALSE, 340, 360.14),
    ('Proteus', 8, FALSE, FALSE, 420, 1.12);

-- =====================
-- DADOS: constellation
-- =====================
INSERT INTO constellation (name, galaxy_id, number_of_stars, is_zodiac) VALUES
    ('Orion', 1, 7, FALSE),
    ('Scorpius', 1, 18, TRUE),
    ('Ursa Major', 1, 7, FALSE),
    ('Canis Major', 1, 5, FALSE),
    ('Leo', 1, 9, TRUE),
    ('Cassiopeia', 1, 5, FALSE);
