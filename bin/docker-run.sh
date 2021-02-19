#!/bin/bash

#run nginxLB container daemonized and export port 8083
DOCKER=$(which docker)

${DOCKER} run -d -p 8083:80 nginxlb:0.1
if [ $? -ne 0 ]; then
	echo "something went wrong ... "
	exit 1
fi