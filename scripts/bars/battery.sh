#!/usr/bin/env bash
while :
do
	PERCENT=$(acpi | awk -F [\ ,] 'FNR==1 {printf "%4s", $5}')
	echo -e "%{B#d9d8d4}%{c}%{F#d9d8d4}--%{F#88aa55}$PERCENT%{F#d9d8d4}--"
	sleep 5
done
