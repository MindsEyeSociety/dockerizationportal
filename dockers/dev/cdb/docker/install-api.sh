#!/bin/sh

echo "> /docker/install-api.sh - BEGIN"

cd /cdb-api

# Check if .env exists
if [ -f ".env" ]; then
    echo "/cdb-api/.env does exist. Exiting installation script, possibly already installed."
    exit 1
fi

cp .env-docker .env
echo "Created /cdb-api/.env from /cdb-api/.env-docker"

npm install
npx knex migrate:latest
npx knex seed:run --specific=001-v1-geolocations.js
npx knex seed:run --specific=002-v1-games.js

echo "< /docker/install-api.sh - END"
