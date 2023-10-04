-- command to instanciate a trigger
CREATE TRIGGER users_table_update_archives_trigger
--targeted table
ON users
-- when ?
AFTER UPDATE
-- start of the logic
AS
BEGIN
-- User's first name
--what to do ?
    INSERT INTO archives (updateDate, columnName, oldValue, newValue, Id_users)
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
    INSERT INTO archives (updateDate, columnName, oldValue, newValue, Id_users)
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
    INSERT INTO archives (updateDate, columnName, oldValue, newValue, Id_users)
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
   INSERT INTO archives (updateDate, columnName, oldValue, newValue, Id_users)
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
