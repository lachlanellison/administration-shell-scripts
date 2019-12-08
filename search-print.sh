#!/bin/bash
LOCATION=`ls *.sh`
FILENO=0
PRINTDIR=`pwd`
echo "Printing files and contents from $PRINTDIR"
echo "==============================="
for LOC in $LOCATION; do
        FILENO=$((FILENO+1))
        DISPLAY="`cat $LOC`"
        echo "File Name:$LOC"
        echo "==============================="
        echo "File Contents:"
        echo "$DISPLAY"
        echo "================================"
done
echo "$FILENO files searched"
~                                
