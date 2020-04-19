#! /usr/bin/env bash

while :
do
	DAY=$(date +%A)
	MONTHDAY=$(date +%b" "%d)
	PAD=$(printf '%0.1s' "-"{1..30})
	PADLENGTH=24
	PADSIZE=$(((PADLENGTH-2-${#DAY}-${#MONTHDAY}-2)/2))
	FORMATTED="$DAY,%{F#484c4e}_%{F#d8d9d4}$MONTHDAY"
	OUTPUT=$(printf '%%{B#484c4e}%%{F#484c4e}%*.*s%%{F#657983}%s%%{F#484c4e}%*.*s' 0 "$PADSIZE" "$PAD" "$FORMATTED" 0 "$PADSIZE" "$PAD")
	echo -e "$OUTPUT"
	sleep 1
done

