#!/bin/bash

#checks web services on vboxes and nginx lb
curl -I http://localhost:8083
if [ $? -ne 0 ]; then
	echo "nginx lb is not responding"
	exit 1	
fi
curl -I http://localhost:8081
if [ $? -ne 0 ]; then
	echo "web1 is not responding on localhost"
	exit 1	
fi
curl -I http://localhost:8082
if [ $? -ne 0 ]; then
	echo "web2 is not responding on localhost"
	exit 1	
fi

#checks that nginx lb is doing round-robin lb on both web1 and web2 in 10 checks
check="false"
check1="false"
check2="false"
n=1
while [ "$n" -le 10 ] && [ "$check" == "false" ]; do
	req=$(curl -s GET http://localhost:8083)
	if [ "$req" == "Hello from server web1 !" ]; then
		check1="true"
		echo "web 1 is in lb"
	fi
	if [ "$req" == "Hello from server web2 !" ]; then
		check2="true"
		echo "web 2 is in lb"
	fi
	if [ "$check1" == "true" ] && [ "$check2" == "true" ]; then
		check="true"
		echo "both web servers are in lb"
	fi
	(( n++ ))
done
if [ "$check" != "true" ]; then
	echo "in 10 checks we did not get both web servers responses"
	exit 1
fi
echo "all services are running"