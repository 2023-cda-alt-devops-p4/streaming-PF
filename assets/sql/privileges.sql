-- ================
-- = Create Roles =
-- ================

-- Admin
CREATE LOGIN [admin] WITH PASSWORD = 'Adm1n***'
USE master
CREATE USER [Admin] FOR LOGIN [admin];
CREATE ROLE AdminRole;
EXEC sp_addrolemember 'AdminRole', 'Admin'
GRANT CONTROL ON DATABASE::master TO AdminRole;


-- User
CREATE LOGIN [user] WITH PASSWORD = 'Pi3rre***'
USE master
CREATE USER [User] FOR LOGIN [user];
CREATE ROLE UserRole;
EXEC sp_addrolemember 'UserRole', 'User'
DENY INSERT, UPDATE, DELETE, EXECUTE, ALTER ON DATABASE::master TO UserRole
DENY CREATE TABLE, CREATE PROCEDURE, CREATE FUNCTION, CREATE VIEW TO UserRole;
GRANT SELECT TO UserRole;


-- EXEC sp_helprolemember 'AdminRole';
-- EXEC sp_droprolemember 'AdminRole', 'Admin';
-- DROP ROLE AdminRole;
-- DROP LOGIN [admin];
-- DROP USER [Admin];
