#!/bin/sh

echo "> /docker/docker-base.sh - JUST EXIT DEV?"
exit 1

echo "> /docker/docker-base.sh - BEGIN"

# load settings
. /docker/.settings

# test project directory link
cd /
until [ `ls -1 | grep cdb-ui | wc -l` -gt 0 ]
do
    echo "Waiting for project volume mount"
done

# test project directory link
cd /
until [ `ls -1 | grep cdb-api | wc -l` -gt 0 ]
do
    echo "Waiting for project volume mount"
done

# test database start
until [ "$(echo "show databases like 'cdb'" | mysql -uroot -hdb -pcdb -N 2>/dev/null | wc -l)" -gt 0 ]
do
  echo "Waiting for database server to start"
  sleep 1
done

echo "< /docker/docker-base.sh - END"
