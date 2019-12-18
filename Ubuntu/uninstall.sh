#!/bin/bash
state="$(head -n 1 .state)"

if [ "$EUID" -ne 0 ]
then
	echo "Please run as root"
	exit
fi

if [ "$state" == "$SUDO_USER $HOSTNAME 1" ]
then
	echo "You are going to unninstall the service SpotifyAddBlock, press any key to continue or ctrl-c to avoid uninstallation"
	read cap
	echo "Service uninstalled!"
	cp .hosts_original_ubuntu /etc/hosts
else
	echo "The service is not installed on this machine"
fi

echo "$SUDO_USER $HOSTNAME 0" > .state
