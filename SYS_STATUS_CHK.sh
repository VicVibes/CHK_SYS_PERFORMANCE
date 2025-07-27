#!/bin/bash
#
#check memory
#Author: Adewumi Victor 
#Version: V1
######################
#CHECK SYS INFO
######################

set -eo pipefail # -e to exit cmd when script fail / -o pipefail when there is an error in pipe dont run the cmd 


RAM=$(free -m | awk '/Mem/ {print $3}') # get ram usage 

DISK=$(df -m | grep ubuntu--vg-ubuntu--lv | awk '{print $4}') # get disk space(modify if disk name is different)

CPU_LOAD=$( top -bn1 | grep "load average" | awk '{print $12}' | tr -d "," ) # to check CPU average load for 1_min 

CPU_AVE=2.00 # for cpu of 2 cores 


#chk RAM

if [ "$RAM" -ge 3200 ]; then
	echo "MEMORY USE HIGH: $RAM MB"

else
	echo "MEMORY USE NORMAL: $RAM MB"
fi

#chk DISK 

if [ "$DISK" -gt 10800 ]; then # YOU CAN CHANGE BASE ON NEEDS
	echo "NORMAL DISK SPACE"

elif [ "$DISK" -ge 2000 ]; then
	echo "Disk Space Running Low"

else 
	echo "DISK SPACE LOW: $DISK MOUNT DISK"
fi

CPU=$(echo "$CPU_LOAD > $CPU_AVE" | bc )  #  

echo "$CPU_LOAD"

#chk CPU 
 
if [ "$CPU" -eq 1 ]; then
	echo "CPU USAGE HIGH"

else 
	echo "CPU USAGE NORMAL"
fi
