#!/bin/bash

#this checks that all tools are available. If not tries to install them

#brew
which brew
if [ $? -ne 0 ]; then
	echo "brew is not installed ... trying to install"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	if [ $? -ne 0 ]; then
		echo "something went wrong installing brew"
		exit 1
	fi
	echo "brew was installed"
fi

#docker
which docker
if [ $? -ne 0 ]; then
	echo "docker is not installed ... trying to install"
	brew cask install docker
	if [ $? -ne 0 ]; then
		echo "something went wrong installing docker"
		exit 1
	fi
	echo "docker was installed"
fi

#virtualbox
which VirtualBox
if [ $? -ne 0 ]; then
	echo "VirtualBox is not installed ... trying to install"
	brew cask install VirtualBox
	if [ $? -ne 0 ]; then
		echo "something went wrong installing VirtualBox"
		exit 1
	fi
	echo "VirtualBox was installed"
fi

#vagrant
which vagrant
if [ $? -ne 0 ]; then
	echo "vagrant is not installed ... trying to install"
	brew cask install vagrant
	if [ $? -ne 0 ]; then
		echo "something went wrong installing vagrant"
		exit 1
	fi
	echo "vagrant was installed"
fi

echo "all tools installed"