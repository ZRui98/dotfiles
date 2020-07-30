#!/usr/bin/env bash
while :
do
	PERCENT=$(acpi | awk -F [\ ,] 'FNR==1 {printf "%4s", $5}')
	echo -e "%{B#ebdbb2}%{c}%{F#ebdbb2}--%{F#282828}$PERCENT%{F#ebdbb2}--"
	sleep 5
done
