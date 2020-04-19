#!/usr/bin/env bash
while :
do
	ICON=$(acpi -b | awk -F"[ ,%]" 'FNR==2 {if($3=="Discharging"){printf ($5>87) ? "\uf240" : ($5>62) ? "\uf241" : ($5>37)? "\uf242" : "\uf243"}else{printf "\uf1e6"};exit;}')
	echo -e "%{c}%{B#88aa55}%{F#88aa55}--%{F#d9d8d4}$ICON%{F#88aa55}--"
	sleep 5
done
