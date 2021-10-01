#!/bin/bash
serverstart(){
	sudo service apache2 start #Starting apache2 Server
	if [ $? -eq 0 ] #result of Previous Command
	then
		echo "service started successfully"
		sudo mv index.html /var/www/html/   #Moving index file to server
		echo "server started successfully"
		firefox 127.0.0.1  #opening localhost to check
	else
		echo "service not started"
		echo "trying to reinstall apache2"
		sudo apt-get install --reinstall apache2 #if not reinstall apache2 server
	fi
}

which apache2 > /dev/null #checking Apache2 is installed or not
if [ $? -eq 0 ]
then
 	echo "apache2 is already installed"
	serverstart
else
	ping -c 3 google.com
	if [ $? -eq 0 ]
	then
		sudo apt-get update -y
		sudo apt-get install apache2 -y
		serverstart
	else
		echo "check your internet connection"
	fi
fi
