#!/usr/bin/env bash
set -e

# Load the resolver (adjust path as needed)
. "$(dirname "$0")/../../../scripts/host/lib/resolve-container-name.sh"

# Example usage
FPM_CONTAINER=$(resolve_name mes_symfonyportal_fpm_1)
WEB_CONTAINER=$(resolve_name mes_symfonyportal_web_1)
DB_CONTAINER=$(resolve_name mes_symfonyportal_db_1)

docker exec -d $WEB_CONTAINER sh -c "sh /docker/tmp/fix-hosts.sh"
docker exec -d $FPM_CONTAINER sh -c "sh /docker/tmp/fix-hosts.sh"
docker exec -d $DB_CONTAINER sh -c "sh /docker/tmp/fix-hosts.sh"

docker exec -d $FPM_CONTAINER sh -c "sh /docker/docker-up.sh >> /var/log/docker-up.log 2>&1"

echo "Post-up script executed successfully."
echo
echo "FPM Container: $FPM_CONTAINER"
echo "Web Container: $WEB_CONTAINER"
echo "DB Container: $DB_CONTAINER"
echo ------------------------------