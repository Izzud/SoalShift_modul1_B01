#!/bin/bash

unzip nature.zip
cd nature/

for f in *.jpg 
do
        if base64 -d $f | xxd -r > decrypted-$f; then
                echo "$f decrypted!"
                rm $f
                mv decrypted-$f $f
        fi
done

