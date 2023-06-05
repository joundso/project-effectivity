#!/bin/bash

set -e 
set -o pipefail

bash ./stop.sh

cd ./docker

## Start Postgres and pgadmin:
docker-compose -f postgres-pgadmin_docker-compose.yaml up -d

## Start Budibase and dependencies:
docker-compose --env-file budibase.env -f budibase_docker-compose.yaml up -d

cd ..

# start firefox http://127.0.0.1:8080/
