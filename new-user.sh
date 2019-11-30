#!/bin/bash
# Script to add a user to Linux system
HOMEDIR="/home/" #Set your home base directory

if [ $(id -u) -eq 0 ]; then
    read -p "Enter username : " USERNAME
    read -s -p "Enter password : " PASSWORD
    #Set password strength settings.
   
    egrep -w "^$USERNAME" /etc/passwd >/dev/null
    if [ $? -eq 0 ]; then
        echo -e "\n$USERNAME exists!\n"
        exit 1
    else
	#perl crypt() is used to create an encrypted password.
	PASS=$(perl -e 'print crypt($ARGV[0], "password")' $PASSWORD)
	useradd -m -p $PASS -d $HOMEDIR$USERNAME $USERNAME
        [ $? -eq 0 ] && echo -e "\nUser has been created!\n" || echo "\nFailed to create user\n"
    fi
else
    echo -e "\nYou must be a root in order to add users to the system.\n"
    exit 2
fi

