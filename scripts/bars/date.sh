#! /usr/bin/env bash

while :
do
	DAY=$(date +%A)
	MONTHDAY=$(date +%b" "%d)
	PAD=$(printf '%0.1s' "-"{1..30})
	PADLENGTH=24
	PADSIZE=$(((PADLENGTH-2-${#DAY}-${#MONTHDAY}-2)/2))
	FORMATTED="$DAY,%{F#282828}_%{F#ebdbb2}$MONTHDAY"
	OUTPUT=$(printf '%%{B#282828}%%{F#282828}%*.*s%%{F#d79921}%s%%{F#282828}%*.*s' 0 "$PADSIZE" "$PAD" "$FORMATTED" 0 "$PADSIZE" "$PAD")
	echo -e "$OUTPUT"
	sleep 1
done

