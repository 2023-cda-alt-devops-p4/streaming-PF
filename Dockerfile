# build-time variables
ARG SERVER_VERSION=2022-latest

# oficial MS SQL server image
FROM mcr.microsoft.com/mssql/server:${SERVER_VERSION}

# environment variables
ENV ACCEPT_EULA=Y
ENV MSSQL_TCP_PORT=1433






