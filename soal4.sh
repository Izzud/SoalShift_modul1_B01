#!/bin/bash

key=$(date +"%k")

input="/var/log/syslog"

#echo $key

lower=abcdefghijklmnopqrstuvwxyz
lower=$lower$lower
upper=$(echo $lower | tr [a-z] [A-Z])

#echo $lower
#echo $upper
#echo ${lower:$key:26}

output=$(date +"%H:%M %d-%m-%Y")

cat $input | tr [${lower:26}${upper:26}] [${lower:$key:26}${upper:$key:26}] > no-4/"$output"
