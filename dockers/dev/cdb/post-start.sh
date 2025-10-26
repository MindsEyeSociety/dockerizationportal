#!/usr/bin/env bash
set -e

# Load the resolver (adjust path as needed)
. "$(dirname "$0")/../../../scripts/host/lib/resolve-container-name.sh"

# Example usage
API_CONTAINER=$(resolve_name mes_cdb mes_cdb_api_1)
WEB_CONTAINER=$(resolve_name mes_cdb mes_cdb_web_1)
DB_CONTAINER=$(resolve_name mes_cdb mes_cdb_db_1)

docker exec -d $WEB_CONTAINER sh -c "sh /docker/tmp/fix-hosts.sh"
docker exec -d $API_CONTAINER sh -c "sh /docker/tmp/fix-hosts.sh"
docker exec -d $DB_CONTAINER sh -c "sh /docker/tmp/fix-hosts.sh"

docker exec -d $API_CONTAINER sh -c "sh /docker/docker-start.sh >> /var/log/docker-start.log 2>&1"

echo "Post-start script executed successfully."
echo
echo "API Container: $API_CONTAINER"
echo "Web Container: $WEB_CONTAINER"
echo "DB Container: $DB_CONTAINER"
echo ------------------------------
