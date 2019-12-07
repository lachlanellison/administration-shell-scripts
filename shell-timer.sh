#!/bin/bash
 hours=$1
 minutes=$2
 seconds=$3
#Syntax = hh:mm:ss in numeric format - 00 00 05. (Timer for 5 seconds)
        while [ $hours -ge 0 ]; do
                 while [ $minutes -ge 0 ]; do
                         while [ $seconds -ge 0 ]; do
				 echo -ne "** $hours:$minutes:$seconds **\033[0K\r"
                                 let "seconds=seconds-1"
                                 sleep 1
                         done
                         seconds=59
                         let "minutes=minutes-1"
                 done
                 minutes=59
                 let "hours=hours-1"
         done
echo "**Timer for $1 :hours $2 :minutes $3 :seconds has completed**"
