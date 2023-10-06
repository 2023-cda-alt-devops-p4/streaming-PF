-- ===============================
-- = Queries for testing purpose =
-- ===============================

--Selects titles and release dates from the most recent to older movie
SELECT title, releaseDate
FROM movies
ORDER BY releaseDate DESC;

-- last and first names, of actors that are older than 30, in alphabetical order
SELECT
    firstname,
    lastname,
    YEAR(GETDATE()) - YEAR(birthDate) -
        CASE
            WHEN MONTH(GETDATE()) * 100 + DAY(GETDATE()) < MONTH(birthDate) * 100 + DAY(birthDate) THEN 1
            ELSE 0
        END AS age
FROM
    Actors
WHERE
    birthDate <= DATEADD(YEAR, -30, GETDATE())
ORDER BY
    lastName,
    firstName;

-- Gives the main actor for a movie
SELECT
    a.firstName,
    a.lastName
FROM
    actors AS a
JOIN
    plays_in AS pi ON a.Id_actors = pi.Id_actors
JOIN
    movies AS m ON pi.Id_movies = m.Id_movies
JOIN
    roles AS r ON pi.Id_roles = r.Id_roles
WHERE
    m.title = 'Inception'
AND
    r.role = 'Main';

-- Gives a list of films for a given actor
SELECT
    m.title
FROM
    movies AS m
JOIN
    plays_in AS pi ON m.Id_movies = pi.Id_movies
JOIN
    actors AS a ON pi.Id_actors = a.Id_actors
WHERE
    a.lastName = 'DiCaprio';

-- Adds a movie
INSERT INTO movies (title, length, releaseDate)
VALUES ('The Godfather', '02:55:00.0000000', '1972-10-18');

-- Adds an actor
INSERT INTO actors (lastName, firstName, birthDate)
VALUES ('Brando', 'Marlon', '1924-04-03');

-- Update a movie by name
UPDATE movies
SET length = '02:29:00.0000000', releaseDate = '2010-07-16'
WHERE title = 'Inception';

-- Deletes an actor
DELETE actors
WHERE lastName = 'Brando';

-- Selects the 3 last added actors
SELECT TOP 3 *
FROM actors
ORDER BY Id_actors DESC;