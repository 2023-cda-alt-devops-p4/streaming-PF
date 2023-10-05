FROM mcr.microsoft.com/mssql/server

# Copy the initialization script into the container with the right permissions
COPY --chmod=755 init-sql-server.sh /usr/src/app/init-sql-server.sh

# Set the entrypoint to our custom script
ENTRYPOINT ["/usr/src/app/init-sql-server.sh"]
