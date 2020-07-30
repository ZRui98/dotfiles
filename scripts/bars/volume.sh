#! /usr/bin/env bash

while :
do
	VOLUME=$(amixer -c 0 sget Master | awk -F"[][]" '/%/ {if ($6=="off" || $4=="off"){printf " XX "}else{printf "%4s", $2};}')
	echo -e "%{c}%{B#ebdbb2}%{F#ebdbb2}--%{F#282828}$VOLUME%{F#ebdbb2}--"
	sleep 1
done
