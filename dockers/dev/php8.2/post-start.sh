#!/bin/sh

docker exec -d mes_portal_php82_web_1 sh -c "sh /docker/tmp/fix-hosts.sh"
docker exec -d mes_portal_php82_fpm_1 sh -c "sh /docker/tmp/fix-hosts.sh"
docker exec -d mes_portal_php82_db_1 sh -c "sh /docker/tmp/fix-hosts.sh"

docker exec -d mes_portal_php82_fpm_1 sh -c "sh /docker/docker-start.sh >> /var/log/docker-start.log"
