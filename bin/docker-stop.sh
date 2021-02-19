#!/bin/bash

#stop nginxLB container 
DOCKER=$(which docker)

${DOCKER} stop $(${DOCKER} ps --filter "ancestor=nginxlb:0.1" -q)