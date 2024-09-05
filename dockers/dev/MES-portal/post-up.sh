#!/bin/sh

docker exec -d mes_portal_php56_web_1 sh -c "sh /docker/tmp/fix-hosts.sh"
docker exec -d mes_portal_php56_fpm_1 sh -c "sh /docker/tmp/fix-hosts.sh"
docker exec -d mes_portal_php56_db_1 sh -c "sh /docker/tmp/fix-hosts.sh"

docker exec -d mes_portal_php56_fpm_1 sh -c "sh /docker/docker-up.sh >> /var/log/docker-up.log 2>&1"
