#!/bin/bash


## Stop Postgres and pgadmin:
docker-compose -f postgres-pgadmin_docker-compose.yaml down

## Remove the data from the DB. CAUTION! Debugging only!
docker volume rm docker_postgres

## Remove dangling stuff:
docker system prune -f
