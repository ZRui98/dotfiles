#! /usr/bin/env bash

while :
do
	VOLUME=$(amixer -c 0 sget Master | awk -F"[][]" '/%/ {if ($6=="off" || $4=="off"){printf " XX "}else{printf "%4s", $2};}')
	echo -e "%{c}%{B#d8d9d4}%{F#d8d9d4}--%{F#ccb05f}$VOLUME%{F#d8d9d4}--"
	sleep 1
done
