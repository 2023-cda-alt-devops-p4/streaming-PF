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

-- Gives list of actors for a movie
SELECT *
FROM actors
WHERE
