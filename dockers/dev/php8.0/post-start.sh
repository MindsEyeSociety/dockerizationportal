#!/bin/sh

docker exec -d mes_portal_php80_web_1 sh -c "sh /docker/tmp/fix-hosts.sh"
docker exec -d mes_portal_php80_fpm_1 sh -c "sh /docker/tmp/fix-hosts.sh"
docker exec -d mes_portal_php80_db_1 sh -c "sh /docker/tmp/fix-hosts.sh"

docker exec -d mes_portal_php80_fpm_1 sh -c "sh /docker/docker-start.sh >> /var/log/docker-start.log"
