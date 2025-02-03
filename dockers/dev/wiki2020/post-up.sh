#!/bin/sh

docker exec -d mes_wiki2020_web_1 sh -c "sh /docker/tmp/fix-hosts.sh"
docker exec -d mes_wiki2020_fpm_1 sh -c "sh /docker/tmp/fix-hosts.sh"
docker exec -d mes_wiki2020_db_1 sh -c "sh /docker/tmp/fix-hosts.sh"

docker exec -d mes_wiki2020_fpm_1 sh -c "sh /docker/docker-up.sh >> /var/log/docker-up.log 2>&1"
