#!/bin/bash

set -e 
set -o pipefail

bash ./stop_postgres.sh

## Start Postgres and pgadmin:
docker-compose -f postgres-pgadmin_docker-compose.yaml up

# start firefox http://127.0.0.1:8080/
