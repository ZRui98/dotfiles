#! /usr/bin/env bash

while :
do
	TITLE=$(mpc -f "%title%" current|cut -c -19)
	ARTIST=$(mpc -f "%artist%" current| cut -c -14)
	FORMATTED="$TITLE - $ARTIST"
	PAD=$(printf '%0.1s' "-"{1..50})
	PADLENGTH=43
	PADSIZE=$(((PADLENGTH-2-${#TITLE}-${#ARTIST}-3)/2))
	OUTPUT=$(printf '%%{B#484c4e}%%{F#484c4e}%*.*s%%{F#657983}%s \uf068 %s%%{F#484c4e}%*.*s' 0 "$PADSIZE" "$PAD" "$TITLE" "$ARTIST" 0 "$PADSIZE" "$PAD")
	echo -e "$OUTPUT"
	sleep 3
done
