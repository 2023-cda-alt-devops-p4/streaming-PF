-- ====================================
-- = command to instantiate a trigger =
-- ====================================

-- Trigger for users archives

CREATE TRIGGER users_table_update_archives_trigger
--targeted table
ON users
-- when ?
AFTER UPDATE
-- start of the logic
AS
BEGIN
-- User's first name
-- what to do ?
    INSERT INTO usersArchives (userUpdateDate, columnName, oldValue, newValue, Id_users)
-- what data ?
    SELECT
        -- returns the current date and time
        GETDATE(),
        -- precises the column that has been changed
        'firstName',
        -- old value (DELETED)
        d.firstName,
        -- new value (INSERTED)
        i.firstName,
        -- id of the user that updated its table
        i.Id_users
    -- targets the INSERTED table as i and joins the DELETED table as d and make sure they have the same user id
    FROM
        INSERTED i
        JOIN DELETED d
            ON i.Id_users = d.Id_users
    -- makes sure there has been a change in the column
    WHERE
        i.firstName <> d.firstName

-- User's last name
    INSERT INTO usersArchives (userUpdateDate, columnName, oldValue, newValue, Id_users)
    SELECT
        GETDATE(),
        'lastName',
        d.lastName,
        i.lastName,
        i.Id_users
    FROM
        INSERTED i
        JOIN DELETED d
            ON i.Id_users = d.Id_users
    WHERE
        i.lastName <> d.lastName

-- User's email
    INSERT INTO usersArchives (userUpdateDate, columnName, oldValue, newValue, Id_users)
    SELECT
        GETDATE(),
        'email',
        d.email,
        i.email,
        i.Id_users
    FROM
        INSERTED i
        JOIN DELETED d
            ON i.Id_users = d.Id_users
    WHERE
        i.email <> d.email

-- User's privilege
   INSERT INTO usersArchives (userUpdateDate, columnName, oldValue, newValue, Id_users)
    SELECT
        GETDATE(),
        'Id_privileges',
        d.Id_privileges,
        i.Id_privileges,
        i.Id_users
    FROM
        INSERTED i
        JOIN DELETED d
            ON i.Id_users = d.Id_users
    WHERE
        i.Id_privileges <> d.Id_privileges

END;
GO

-- Trigger for global archives

CREATE TRIGGER trg_actors_update_timestamp
ON actors
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON

    UPDATE actors
    SET updateDate = GETDATE()
    WHERE Id_actors IN (SELECT Id_actors FROM INSERTED);
END;
GO

CREATE TRIGGER trg_movies_update_timestamp
ON movies
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON

    UPDATE movies
    SET updateDate = GETDATE()
    WHERE Id_movies IN (SELECT Id_movies FROM INSERTED);
END;
GO

CREATE TRIGGER trg_directors_update_timestamp
ON directors
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON

    UPDATE directors
    SET updateDate = GETDATE()
    WHERE Id_directors IN (SELECT Id_directors FROM INSERTED);
END;
GO

CREATE TRIGGER trg_roles_update_timestamp
ON roles
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON

    UPDATE roles
    SET updateDate = GETDATE()
    WHERE Id_roles IN (SELECT Id_roles FROM INSERTED);
END;
GO

CREATE TRIGGER trg_archives_update_timestamp
ON usersArchives
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON

    UPDATE usersArchives
    SET updateDate = GETDATE()
    WHERE Id_usersArchives IN (SELECT Id_usersArchives FROM INSERTED);
END;
GO

CREATE TRIGGER trg_privileges_update_timestamp
ON privileges
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON

    UPDATE privileges
    SET updateDate = GETDATE()
    WHERE Id_privileges IN (SELECT Id_privileges FROM INSERTED);
END;
GO

CREATE TRIGGER trg_users_update_timestamp
ON users
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON

    UPDATE users
    SET updateDate = GETDATE()
    WHERE Id_users IN (SELECT Id_users FROM INSERTED);
END;
