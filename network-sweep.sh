#!/bin/bash
#Sweep your currently connected Network, script will automatically detect your ip/CIDR. If needed you can modify the script to scan an alternative Network.
network=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d"." -f1-3 | tr -d "inet"|tr -d " ") 
for range in `seq 1 254`; do 
ping -c 1 $network.$range | grep "64 bytes" | cut -d " " -f 4 | tr -d ':' &
done
