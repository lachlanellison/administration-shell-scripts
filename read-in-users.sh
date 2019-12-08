#!/bin/bash
echo "User set to read in:"
read FILE
while READIN= read -r LINE
do
        egrep -w "^$LINE" /etc/passwd > /dev/null
        if [ $? -eq 0 ]; then
                echo -e "$LINE User Account Exists! Will now exit script"
                exit 1
        else
                useradd $LINE
                [ $? -eq 0 ] && echo -e "$LINE User Account has been created" || echo "$LINE User Account creation has failed"
        fi

done < "$FILE"
