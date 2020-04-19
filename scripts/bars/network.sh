#! /usr/bin/env bash

while :
do
	NETWORK_NAME=$(nmcli | grep -wEo 'wlp3s0: connected to \w+[-_]?\w+'| awk '{printf "%-14s", $4}'| xargs)
	# NETWORK_NAME="BELL230"

	PAD=$(printf '%0.1s' "A"{1..100})
	PADLENGTH=17
	PADSIZE=$(((PADLENGTH-${#NETWORK_NAME})/2-1))
	OUTPUT=$(printf '%%{B#d9d8d4}%%{F#d9d8d4}%*.*s%%{F#7b6072}%s%%{F#d9d8d4}%*.*s' 0 "$PADSIZE" "$PAD" "$NETWORK_NAME" 0 "$PADSIZE" "$PAD")
	echo -e "$OUTPUT"
	sleep 5
done
