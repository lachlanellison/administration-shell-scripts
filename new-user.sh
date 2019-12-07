#!/bin/bash
homedir="/home/" #Set your home base directory

if [ $(id -u) -eq 0 ]; then
    read -p "Enter username : " username
    read -s -p "Enter password : " password
    
    egrep -w "^$username" /etc/passwd >/dev/null
    if [ $? -eq 0 ]; then
        echo -e "\n$username exists!\n"
        exit 1
    else
	#perl crypt() is used to create an encrypted password.
	pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
	useradd -m -p $PASS -d $homedir$username $username
        [ $? -eq 0 ] && echo -e "\nUser has been created!\n" || echo "\nFailed to create user\n"
    fi
else
    echo -e "\nYou must be a root in order to add users to the system.\n"
    exit 2
fi

