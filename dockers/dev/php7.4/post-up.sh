#!/bin/sh

docker exec -d mes_portal_php74_web_1 sh -c "sh /docker/tmp/fix-hosts.sh"
docker exec -d mes_portal_php74_fpm_1 sh -c "sh /docker/tmp/fix-hosts.sh"
docker exec -d mes_portal_php74_db_1 sh -c "sh /docker/tmp/fix-hosts.sh"

docker exec -d mes_portal_php74_fpm_1 sh -c "sh /docker/docker-up.sh >> /var/log/docker-up.log"
