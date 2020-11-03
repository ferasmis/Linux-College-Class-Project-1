#!/bin/bash

###
#perform PROJECT1 for CS125: Create user account and assign password from words.txt.
#Coded by: Feras 
###

read -p "Please run this script using sudo, else will not assign password to users and cannot copy shadow file to Sandbox. 
Press Enter key to proceed."

cd ~


##Create sandbox directory in home
mkdir sandbox


##cd to sandbox directory
cd sandbox


##Download the passwords file online
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/darkweb2017-top10000.txt


##shuf the downloaded file and randomly select 100 entries then save it to words.txt
shuf darkweb2017-top10000.txt | head -n 100 | cat > words.txt


##loop and create users with random passwords from word.txt
for x in 1 2 3 4 5
do
	randompw=$(shuf words.txt | tail -n 1)
	useradd -m user$x
	echo user$x:$randompw | chpasswd
	echo "UserID:" user$x "has been created with the following password:" $randompw
done


##cp shadow to sandbox directory
cp /etc/shadow ../sandbox/


