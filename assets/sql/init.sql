-- =================
-- = Create Tables =
-- =================

CREATE TABLE movies(
   Id_movies INT IDENTITY(1,1),
   title VARCHAR(50) NOT NULL,
   length TIME NOT NULL,
   releaseDate DATE NOT NULL,
   creationDate DATETIME2 NOT NULL,
   updateDate DATETIME2,
   PRIMARY KEY(Id_movies)
);

CREATE TABLE directors(
   Id_directors INT IDENTITY(1,1),
   lastName VARCHAR(50) NOT NULL,
   firstName VARCHAR(50) NOT NULL,
   creationDate DATETIME2 NOT NULL,
   updateDate DATETIME2,
   PRIMARY KEY(Id_directors)
);

CREATE TABLE roles(
   Id_roles INT IDENTITY(1,1),
   role VARCHAR(50) NOT NULL,
   creationDate DATETIME2 NOT NULL,
   updateDate DATETIME2,
   PRIMARY KEY(Id_roles)
);

CREATE TABLE actors(
   Id_actors INT IDENTITY(1,1),
   lastName VARCHAR(50) NOT NULL,
   firstName VARCHAR(50) NOT NULL,
   birthDate DATE NOT NULL,
   creationDate DATETIME2 NOT NULL,
   updateDate DATETIME2,
   PRIMARY KEY(Id_actors)
);

CREATE TABLE privileges(
   Id_privileges INT IDENTITY(1,1),
   privilege VARCHAR(50) NOT NULL,
   creationDate DATETIME2 NOT NULL,
   updateDate DATETIME2,
   PRIMARY KEY(Id_privileges),
   UNIQUE(privilege)
);

CREATE TABLE users(
   Id_users INT IDENTITY(1,1),
   firstName VARCHAR(50) NOT NULL,
   lastName VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   password VARCHAR(50) NOT NULL,
   Id_privileges INT NOT NULL,
   creationDate DATETIME2 NOT NULL,
   updateDate DATETIME2,
   PRIMARY KEY(Id_users),
   FOREIGN KEY(Id_privileges) REFERENCES privileges(Id_privileges)
);

CREATE TABLE usersArchives(
    Id_usersArchives INT IDENTITY(1,1),
    userUpdateDate DATETIME2 NOT NULL,
    columnName VARCHAR(50) NOT NULL,
    oldValue VARCHAR(50) NOT NULL,
    newValue VARCHAR(50) NOT NULL,
    Id_users INT NOT NULL,
    creationDate DATETIME2 NOT NULL,
    updateDate DATETIME2,
    PRIMARY KEY(Id_usersArchives),
    FOREIGN KEY(Id_users) REFERENCES users(Id_users)
);

CREATE TABLE plays_in(
   Id_movies INT,
   Id_roles INT,
   Id_actors INT,
   PRIMARY KEY(Id_movies, Id_roles, Id_actors),
   FOREIGN KEY(Id_movies) REFERENCES movies(Id_movies),
   FOREIGN KEY(Id_roles) REFERENCES roles(Id_roles),
   FOREIGN KEY(Id_actors) REFERENCES actors(Id_actors)
);

CREATE TABLE directs(
   Id_movies INT,
   Id_directors INT,
   PRIMARY KEY(Id_movies, Id_directors),
   FOREIGN KEY(Id_movies) REFERENCES movies(Id_movies),
   FOREIGN KEY(Id_directors) REFERENCES directors(Id_directors)
);

CREATE TABLE owns(
   Id_movies INT,
   Id_users INT,
   PRIMARY KEY(Id_movies, Id_users),
   FOREIGN KEY(Id_movies) REFERENCES movies(Id_movies),
   FOREIGN KEY(Id_users) REFERENCES users(Id_users)
);

-- Constraints

ALTER TABLE actors
ADD CONSTRAINT DF_creationDate_default_actors
DEFAULT GETDATE() FOR creationDate;

ALTER TABLE directors
ADD CONSTRAINT DF_creationDate_default_directors
DEFAULT GETDATE() FOR creationDate;

ALTER TABLE usersArchives
ADD CONSTRAINT DF_creationDate_default_archives
DEFAULT GETDATE() FOR creationDate;

ALTER TABLE movies
ADD CONSTRAINT DF_creationDate_default_movies
DEFAULT GETDATE() FOR creationDate;

ALTER TABLE privileges
ADD CONSTRAINT DF_creationDate_default_privileges
DEFAULT GETDATE() FOR creationDate;

ALTER TABLE roles
ADD CONSTRAINT DF_creationDate_default_roles
DEFAULT GETDATE() FOR creationDate;

ALTER TABLE users
ADD CONSTRAINT DF_creationDate_default_users
DEFAULT GETDATE() FOR creationDate;