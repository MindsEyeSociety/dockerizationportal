#!/usr/bin/env bash
set -e

# Load the resolver (adjust path as needed)
. "$(dirname "$0")/../../../scripts/host/lib/resolve-container-name.sh"

# Example usage
MAIL_CONTAINER=$(resolve_name mes mes_mail_1)

docker exec -d $MAIL_CONTAINER bash -c "bash /docker/tmp/fix-hosts.sh"

echo "Post-start script executed successfully."
echo
echo "MAIL Container: $MAIL_CONTAINER"
echo ------------------------------
