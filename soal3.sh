#!/bin/bash

name="password"

while [ 0 ]; do

	#init
	num=1
	flag=0

	#generate
	password=$(cat /dev/urandom | tr -dc A-Za-z0-9 | head -c 12)

	#(test -e) will check if said file exist or not
	while test -e "$name$num.txt"; do
		if [ password != $(echo $name$num.txt)  ]; then
			((num++))
		else
			flag=1
			break
		fi
	done
	
	#if no duplicate password found
	if [ $flag ]; then
		echo $num $password
		filename="$name$num.txt"
		echo $password > $filename
		break
	fi
done

