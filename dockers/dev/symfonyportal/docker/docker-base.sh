#!/bin/sh

echo "> /docker/docker-base.sh - BEGIN"

# load settings
. /docker/.settings

# test project directory link
cd /
until [ `ls -1 | grep portal | wc -l` -gt 0 ]
do
    echo "Waiting for project volume mount"
done

# test database start
until [ "$(echo "show databases like 'mesportal'" | mysql -uroot -hdb -pmesportal -N 2>/dev/null | wc -l)" -gt 0 ]
do
  echo "Waiting for database server to start"
  sleep 1
done

# fix log and cache files
if [ -d "/portal/app/logs" ]; then
  chmod -R 777 /portal/app/logs
fi
if [ -d "/portal/app/cache" ]; then
  chmod -R 777 /portal/app/cache
fi

echo "< /docker/docker-base.sh - END"
