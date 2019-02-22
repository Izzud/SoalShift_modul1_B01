#!/bin/bash

lower=abcdefghijklmnopqrstuvwxyz
lower=$lower$lower
upper=$(echo $lower | tr [a-z] [A-Z])

for f in no-4/*; do
	fname=$(basename "$f")
	key=${fname:0:2}
	output="$fname [decrypted]"

	cat "$f" | tr [${lower:$key:26}${upper:$key:26} [${lower:0:26}${upper:0:26}] > no-4/"$output"
done
