#!/bin/bash

# Start SQL Server
/opt/mssql/bin/sqlservr &

# Wait a bit for SQL Server to start up
sleep 30s

# Run the SQL scripts against the database
# path to sqlcmd utility that should connect to localhost server (-S) with the SA username (-U) and its password (-P) on the master database (-d) and run (-i) the specified file
## The privileges script
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "${SA_PASSWORD}" -d master -i /sqlscripts/privileges.sql
## The initialization script
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "${SA_PASSWORD}" -d master -i /sqlscripts/init.sql
## The trigger scripts
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "${SA_PASSWORD}" -d master -i /sqlscripts/triggers.sql
## The stored procedure script
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "${SA_PASSWORD}" -d master -i /sqlscripts/sp_GetMoviesByDirector.sql
## The population script
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "${SA_PASSWORD}" -d master -i /sqlscripts/data.sql




# Keep the container running
wait
