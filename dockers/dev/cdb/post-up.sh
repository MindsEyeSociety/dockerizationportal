#!/bin/sh

docker exec -d mes_cdb_web_1 sh -c "sh /docker/tmp/fix-hosts.sh"
docker exec -d mes_cdb_api_1 sh -c "sh /docker/tmp/fix-hosts.sh"
docker exec -d mes_cdb_db_1 sh -c "sh /docker/tmp/fix-hosts.sh"

docker exec -d mes_cdb_api_1 sh -c "sh /docker/docker-up.sh >> /var/log/docker-up.log 2>&1"
