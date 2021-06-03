#!/bin/sh
# todo: stop and start mysql without using sudo

# Stop femr app by killing first PID shown
#kill $(ps aux | grep java | grep -v 'grep' | awk 'NR==1{print $2}')

## stop mysql
#sudo -S launchctl unload -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist

## get the latest updated images. This is assuming femr developers
## pushed updated docker image to remote docker registry.
#docker-compose pull

if [ -x "$(command -v docker)" ]; then
    echo "Update docker"
    # command
else
    echo "Install docker"
    pip install docker
fi

if [ -x "$(command -v docker-compose)" ]; then
    echo "Update docker-compose"
else
    echo "Install docker-compose"
    pip install docker-compose
fi

docker-compose down
docker-compose pull
docker-compose up

docker -v
docker-compose -v

## start mysql
#sudo -S launchctl load -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist
