#!/bin/bash

# Start SQL Server
/opt/mssql/bin/sqlservr &

# Wait a bit for SQL Server to start up
sleep 30s

# Run the SQL scripts against the database
## The initialization script
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "${SA_PASSWORD}" -d master -i /sqlscripts/init.sql
## The population script
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "${SA_PASSWORD}" -d master -i /sqlscripts/data.sql
## The privileges script
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "${SA_PASSWORD}" -d master -i /sqlscripts/privileges.sql
## The stored procedure script
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "${SA_PASSWORD}" -d master -i /sqlscripts/sp_GetMoviesByDirector.sql
## The trigger script
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "${SA_PASSWORD}" -d master -i /sqlscripts/users_table_update_archives_trigger.sql


# Keep the container running
wait
