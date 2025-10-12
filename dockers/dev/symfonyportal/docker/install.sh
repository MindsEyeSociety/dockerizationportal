#!/bin/sh

echo "> /docker/install.sh - BEGIN"

cd /portal

composer install
composer dump-autoload

./bin/console doctrine:migrations:migrate

echo "< /docker/install.sh - END"
