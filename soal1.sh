#!/bin/bash

unzip nature.zip

absf=$(pwd)/nature
cd $absf

for f in *.jpg 
do
	if base64 -d $f | xxd -r > decoded-$f; then
		echo "$f converted!"
		rm $f
	fi
done
