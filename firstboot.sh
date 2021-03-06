#!/bin/bash

echo
echo -n "We are about to rock n roll, are you ready? (Y/n):"
read CONFIRM
echo

if [ -z $CONFIRM ] || [ $CONFIRM != "Y" ] ; then
	echo "Quitting!"
	exit 1
fi

# Update all packages

echo "Testing internet connection"
ping -c 1 -w 3 au.archive.ubuntu.com
if [ $? ] ; then
	echo "Updating packages"
	echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list
	apt-get update
	apt-get dist-upgrade
else
	echo "Error: Can't ping au.archive.ubuntu.com.  Check internet connection"
	exit 1
fi

echo
echo "Installing packages as determined by Dane..."
	apt install -y vim htop python-pip git google-chrome-stable steam caffeine -f
	pip install awscli --upgrade --user

echo
echo "All done.  Now go get 'em tiger"
