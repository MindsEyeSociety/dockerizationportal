#!/bin/sh

docker exec -d mes-portal_web_1 sh -c "sh /docker/tmp/fix-hosts.sh"
docker exec -d mes-portal_fpm_1 sh -c "sh /docker/tmp/fix-hosts.sh"
docker exec -d mes-portal_db_1 sh -c "sh /docker/tmp/fix-hosts.sh"

docker exec -d mes-portal_fpm_1 sh -c "sh /docker/docker-up.sh >> /var/log/docker-up.log 2>&1"
