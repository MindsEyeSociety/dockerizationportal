#!/bin/sh

echo "> /docker/install.sh - BEGIN"

cd /cdb-api

# Check if .env exists
if [ -f ".env" ]; then
    echo "/cdb-api/.env does exist. Exiting installation script, possibly already installed."
    exit 1
fi

cp .env-docker .env
echo "Created /cdb-api/.env from /cdb-api/.env-docker"

npm install

cd /cdb-ui

# Check if .env exists
if [ -f ".env" ]; then
    echo "/cdb-ui/.env does exist. Exiting installation script, possibly already installed."
    exit 1
fi

cp .env-docker .env
echo "Created /cdb-ui/.env from /cdb-ui/.env-docker"

npm install

echo "< /docker/install.sh - END"
