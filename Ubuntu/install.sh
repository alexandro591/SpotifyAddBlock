#!/bin/bash
state="$(head -n 1 .state)"

if [ "$EUID" -ne 0 ]
then
	echo "Please run as superuser"
	exit
fi

if [ "$state" == "$SUDO_USER $HOSTNAME 1" ]
then
	echo "Service already installed, press any key to update it or ctrl-c to avoid installation"    
	read cap
	echo "Service up to date!"
	cp .hosts_original_ubuntu /etc/hosts
else
	echo "Service is going to be installed, press any key to continue or ctrl-c to avoid installation"   
	read cap
	echo "Service installed!"
	echo "$SUDO_USER $HOSTNAME 1" > .state
	cp /etc/hosts .hosts_original_ubuntu
fi

cat .hosts >> /etc/hosts
