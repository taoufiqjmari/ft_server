#!/bin/sh
#	cleanup docker resources (containers, images)	#

docker rm -f $(docker ps -aq)
docker rmi -f $(docker images -aq)
