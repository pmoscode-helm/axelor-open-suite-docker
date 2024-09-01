#!/usr/bin/env bash

set -e

psql -v ON_ERROR_STOP=1 --username "postgres" --dbname "postgres" <<-EOSQL
    CREATE DATABASE axelor;
    CREATE USER axelor WITH ENCRYPTED PASSWORD 'axelorPWD';
    GRANT ALL PRIVILEGES ON DATABASE axelor TO axelor;
    \c axelor
    GRANT ALL ON SCHEMA public TO axelor;
EOSQL
