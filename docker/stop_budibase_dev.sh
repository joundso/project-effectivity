#!/bin/bash


## Stop Postgres and pgadmin:
docker-compose --env-file budibase.env -f budibase_docker-compose.yaml down

## Remove the data volumes. CAUTION! Debugging only! This will delete all settings and files from current containers!
docker volume rm docker_couchdb3_data
docker volume rm docker_minio_data
docker volume rm docker_redis_data

## Remove dangling stuff:
docker system prune -f
