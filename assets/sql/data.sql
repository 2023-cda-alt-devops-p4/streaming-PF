-- Inserting movies
INSERT INTO movies (title, length, releaseDate) VALUES
('Inception', '02:28:00', '2010-07-16'),
('Jurassic Park', '02:07:00', '1993-06-11'),
('Back to the Future', '01:56:00', '1985-07-03'),
('Catch Me If You Can', '02:21:00', '2002-12-25'),
('The Departed', '02:31:00', '2006-10-06');

-- Directors
INSERT INTO directors (lastName, firstName) VALUES
('Nolan', 'Christopher'),
('Spielberg', 'Steven'),
('Zemeckis', 'Robert'),
('Spielberg', 'Steven'),
('Scorsese', 'Martin');

-- Link directors to movies
INSERT INTO directs (Id_movies, Id_directors) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 2),
(5, 4);

-- Roles
INSERT INTO roles (role) VALUES
('Main'),
('Secondary');

-- Actors
INSERT INTO actors (lastName, firstName, birthDate) VALUES
('DiCaprio', 'Leonardo', '1974-11-11'),
('Page', 'Elliot', '1987-02-21'),
('Hardy', 'Tom', '1977-09-15'),
('Neill', 'Sam', '1947-09-14'),
('Thompson', 'Lea', '1961-05-31'),
('Holland', 'Tom', '1996-06-01'),
('Coleman', 'Zendaya', '1996-09-01'),
('Chalamet', 'Timothée', '1995-12-27');

-- Link actors to their roles and movies
INSERT INTO plays_in (Id_movies, Id_roles, Id_actors) VALUES
(1, 1, 1),
(1, 2, 2),
(1, 2, 3),
(2, 1, 4),
(2, 2, 5),
(3, 1, 5),
(4, 1, 1),
(5, 1, 1);

-- Mock data for privileges table
INSERT INTO privileges (privilege) VALUES
('Admin'),
('User'),
('Guest');

-- Mock data for users table
INSERT INTO users (firstName, email, password, lastName, Id_privileges) VALUES
('John', 'john@email.com', 'password123', 'Doe', 1),
('Jane', 'jane@email.com', 'securePass456', 'Smith', 2),
('Alice', 'alice@email.com', 'pass789word', 'White', 2),
('Bob', 'bob@email.com', 'bobPass321', 'Brown', 2),
('Charlie', 'charlie@email.com', 'charliePass654', 'Green', 3);

UPDATE users
SET firstName = 'Johny'
WHERE Id_users = 1;


-- Mock data for owns table (linking movies and users)
-- This is a simple random selection of movies for each user.
INSERT INTO owns (Id_movies, Id_users) VALUES
(1, 1),
(3, 1),
(5, 1),
(2, 2),
(4, 2),
(1, 2),
(1, 3),
(3, 3),
(5, 3),
(2, 4),
(3, 4),
(5, 4),
(1, 5),
(2, 5),
(3, 5);

