#!/bin/bash

##delete the sandbox dir
rm -rf sandbox
echo "sandbox directory deleted succesfully"

##loop and create users with passwords from word.txt
for x in 1 2 3 4 5
do
	userdel -f user$x
	echo "UserID:" user$x "has been deleted successfully."
done
