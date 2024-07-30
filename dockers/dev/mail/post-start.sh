#!/bin/sh

docker exec -d mes_portal_mail_1 bash -c "bash /docker/tmp/fix-hosts.sh"
