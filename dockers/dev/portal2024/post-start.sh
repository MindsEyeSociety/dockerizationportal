#!/bin/sh

docker exec -d mes_portal2024_web_1 sh -c "sh /docker/tmp/fix-hosts.sh"
docker exec -d mes_portal2024_api_1 sh -c "sh /docker/tmp/fix-hosts.sh"
docker exec -d mes_portal2024_db_1 sh -c "sh /docker/tmp/fix-hosts.sh"

docker exec -d mes_portal2024_api_1 sh -c "sh /docker/docker-start.sh >> /var/log/docker-start.log 2>&1"
