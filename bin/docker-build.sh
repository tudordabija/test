#!/bin/bash

#create docker image
DOCKER=$(which docker)

${DOCKER} build -t nginxlb:0.1 .
if [ $? -ne 0 ]; then
	echo "something went wrong ..."
	exit 1
fi