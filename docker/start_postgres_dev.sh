#!/bin/bash

set -e 
set -o pipefail

bash ./stop_postgres_dev.sh

## Start Postgres and pgadmin:
docker-compose --env-file postgres.env -f postgres-pgadmin_docker-compose.yaml up -d

# start firefox http://127.0.0.1:8080/
