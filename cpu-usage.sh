#!/bin/bash
while [ true ] ;do
used=`free -m |awk 'NR==3 {print $4}'`

if [ $used -lt 1000 ] && [ $used -gt 800 ]; then
echo "Free memory is below 1000MB. Check running processes, something is eating your CPU!" | /bin/mail -s "HIGH MEMORY ALERT!" user@mydomain.com


fi
sleep 5
done

