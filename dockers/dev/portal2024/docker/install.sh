#!/bin/sh

echo "> /docker/install.sh - JUST EXIT DEV?"
exit 1

echo "> /docker/install.sh - BEGIN"

cd /portal

echo "< /docker/install.sh - NOTHING DONE END (TO BE DEV)"
exit 1

cd app/config

# Check if app/config/parameters.yml exists
if [ -f "parameters.yml" ]; then
    echo "/portal/app/config/parameters.yml does exist. Exiting installation script, possibly already installed."
    exit 1
fi

# Loop through config files templates
for i in parameters.yml; do
    if [ ! -f "$i" ]; then
        cp "$i-docker" "$i"
        echo "Created /portal/app/config/$i from /portal/app/config/$i-docker"
    fi
done

cd ..
cd ..

composer install
#composer dump-autoload

cd app
./console doctrine:migrations:migrate
./console assets:install
./console assetic:dump

echo "< /docker/install.sh - END"
