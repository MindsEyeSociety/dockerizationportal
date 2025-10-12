#!/bin/sh

echo "> /docker/docker-up.sh - BEGIN"

/docker/docker-base.sh
/docker/install-api.sh
/docker/install-ui.sh

echo "< /docker/docker-up.sh - END"
