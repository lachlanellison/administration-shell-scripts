#!/bin/bash
NO=0
echo "Select a number of files to create"
read FOLDERNO

while [ $COUNT -lt $FILENO ]
	do
		NO=`expr $NO + 1`
		FOLDERNAME="Folder_$NO"
		mkdir $FOLDERNAME
	done
