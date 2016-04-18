#!/bin/bash
docker exec $(docker ps | awk '/projetal_middletier*|projetal_edge*/ {print $NF}' | shuf -n 1) bash -c "killall java"
