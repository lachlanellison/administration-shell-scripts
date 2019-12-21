#!/bin/bash
DIRECTORY="safe-rm-recycle"
echo "What file would you like to remove?"
read TOREMOVE
if [ -z "$TOREMOVE" ]; then
	echo "You must choose a file to remove"
else
	if [ -f "$TOREMOVE" ]; then
		echo "$TOREMOVE exists, we can proceed."
	else
		echo "$TOREMOVE does not exist."
		exit
	fi
fi
if [ -d "$DIRECTORY" ]; then
	echo " "
else
	`mkdir $DIRECTORY`
	echo "Directory safe-rm-recycle created."
fi
`cp $TOREMOVE $DIRECTORY`
`rm -f $TOREMOVE`
echo "File has been removed, a copy has been saved to $DIRECTORY"
