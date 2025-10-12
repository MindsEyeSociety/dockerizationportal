#!/bin/sh

echo "> /docker/install-ui.sh - BEGIN"

cd /cdb-ui

# Check if .env exists
if [ -f ".env" ]; then
    echo "/cdb-ui/.env does exist. Exiting installation script, possibly already installed."
    exit 1
fi

cp .env-docker .env
echo "Created /cdb-ui/.env from /cdb-ui/.env-docker"

npm install

echo "< /docker/install-ui.sh - END"
