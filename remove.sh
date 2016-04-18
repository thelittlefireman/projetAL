#!/bin/bash

sudo service apache2 stop
sudo service tomcat7 stop
sudo service nginx stop

docker stop $(docker ps -a -q)

docker rm $(docker ps -a -q)
docker ps -a
exit 0
