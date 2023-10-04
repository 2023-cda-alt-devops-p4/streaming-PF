-- =================================================================
-- = Stored procedure to get a list of movies for a given director =
-- =================================================================

CREATE PROCEDURE sp_GetMoviesByDirector
@DirectorFirstName NVARCHAR(50),
@DirectorLastName NVARCHAR(50)
AS
BEGIN
    SELECT m.title
    FROM movies m
    JOIN directs d ON m.Id_movies = d.Id_movies
    JOIN directors dir ON d.Id_directors = dir.Id_directors
    WHERE dir.firstName = @DirectorFirstName AND dir.lastName = @DirectorLastName;
END;