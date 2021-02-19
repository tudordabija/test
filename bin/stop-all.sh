#!/bin/bash

#stop all : docker + vagrant boxes

bin/docker-stop.sh
vagrant destroy --force