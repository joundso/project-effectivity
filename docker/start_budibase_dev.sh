#!/bin/bash

set -e 
set -o pipefail

bash ./stop_budibase_dev.sh

## Start Budibase and all dependencies:
docker-compose --env-file budibase.env -f budibase_docker-compose.yaml up -d

# start firefox http://127.0.0.1:8080/
