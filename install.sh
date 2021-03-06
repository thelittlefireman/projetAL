#!/bin/bash

sudo service apache2 stop

docker stop $(docker ps -a -q)

docker rm $(docker ps -a -q)

docker run -d -p 80:80 --name eurekaDocker eureka 

docker run -d -p 1191:9191 -p 1192:9192 --link eurekaDocker:localhost --name middletier1 --hostname middletier1  middletier

docker run -d -p 1291:9191 -p 1292:9192 --link eurekaDocker:localhost --name middletier2  --hostname middletier2 middletier

docker run -d -p 1391:9191 -p 1392:9192 --link eurekaDocker:localhost --name middletier3  --hostname middletier3 middletier

docker run -d -p 2190:9090 -p 2192:9092 --link eurekaDocker:localhost --link middletier1:middletier1 --link middletier2:middletier2 --link middletier3:middletier3 --name edge1 edge

docker run -d -p 2290:9090 -p 2292:9092 --link eurekaDocker:localhost --link middletier1:middletier1 --link middletier2:middletier2 --link middletier3:middletier3  --name edge2 edge

docker run -d -p 2390:9090 -p 2392:9092 --link eurekaDocker:localhost --link middletier1:middletier1 --link middletier2:middletier2 --link middletier3:middletier3  --name edge3 edge

echo docker lancées :

docker ps -a
exit 0
