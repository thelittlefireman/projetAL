#!/bin/bash

docker build -t eureka -f dockerfileEureka .
docker build -t middletier -f dockerfileMiddle .
docker build -t edge -f dockerfileEdge .

docker pull nginx
exit 0
