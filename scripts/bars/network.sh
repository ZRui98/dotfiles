#! /usr/bin/env bash

while :
do
	NETWORK_NAME=$(/sbin/iwgetid | grep -wEo '"\w+[-_]?\w+"' | cut -d '"' -f 2)
	# NETWORK_NAME="BELL230"

	PAD=$(printf '%0.1s' "A"{1..100})
	PADLENGTH=18
	PADSIZE=$(((PADLENGTH-${#NETWORK_NAME})/2-1))
	OUTPUT=$(printf '%%{B#ebdbb2}%%{F#ebdbb2}%*.*s%%{F#282828}%s%%{F#ebdbb2}%*.*s' 0 "$PADSIZE" "$PAD" "$NETWORK_NAME" 0 "$PADSIZE" "$PAD")
	echo -e "$OUTPUT"
	sleep 5
done
