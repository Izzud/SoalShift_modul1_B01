#!/bin/bash

input="$1"
key=${input:0:2}

#echo $key

lower=abcdefghijklmnopqrstuvwxyz
lower=$lower$lower
upper=$(echo $lower | tr [a-z] [A-Z])

output="$input [decrypted]"

cat "$input" | tr [${lower:$key:26}${upper:$key:26} [${lower:0:26}${upper:0:26}] > "$output"
