#!/bin/bash

#start vagrant boxes

vagrant destroy --force
vagrant up
if [ $? -ne 0 ]; then
	echo "something went wrong ..."
	exit 1
fi