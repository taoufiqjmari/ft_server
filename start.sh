#!/bin/sh
#	cleanup docker resources (containers, images), then build an image and a container based on that image	#
#	HOW TO RUN	#	bash start.sh NAME_OF_IMAGE NAME_OF_CONTAINER	#

docker rm -f $(docker ps -aq)
docker rmi -f $(docker images -aq)
docker build -t $1 .

#	--interactive	#	run container in interactive mode	#
docker run --name $2 -it -p 80:80 -p 443:443 $1

#	--detach	#	run container in detached mode	#
# docker run --name $2 -d -p 80:80 -p 443:443 $1
#	exec	#	to run bash in a running container / to get into the running container in detached mode	#
# docker exec -it $2 bash
