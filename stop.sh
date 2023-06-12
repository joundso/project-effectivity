#!/bin/bash

# set -e 
# set -o pipefail

cd ./docker

docker-compose --env-file postgres.env -f postgres-pgadmin_docker-compose.yaml down
docker-compose --env-file budibase.env -f budibase_docker-compose.yaml down

cd ..

docker system prune -f
