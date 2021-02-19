#!/bin/bash

#call check-tools.sh
#build docker image
#build and run vagrant images
#run docker container
#call testing.sh

bin/check-tools.sh
if [ $? -ne 0 ]; then
	echo "something went wrong ... check-tools.sh exited"
	exit 1
fi
bin/docker-build.sh
if [ $? -ne 0 ]; then
	echo "something went wrong ... docker-build.sh exited"
	exit 1
fi
bin/vagrant-up.sh
if [ $? -ne 0 ]; then
	echo "something went wrong ... vagrant-up.sh exited"
	exit 1
fi
bin/docker-run.sh
if [ $? -ne 0 ]; then
	echo "something went wrong ... vagrant-up.sh exited"
	exit 1
fi
bin/check-services.sh
if [ $? -ne 0 ]; then
	echo "something went wrong ... check-services.sh exited"
	echo "attempting stop-all "
	bin/stop-all.sh
	exit 1
fi
