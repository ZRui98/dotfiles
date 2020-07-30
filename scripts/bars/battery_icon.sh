#!/usr/bin/env bash
while :
do
	ICON=$(acpi -b | awk -F"[ ,%]" 'FNR==1 {if($3=="Discharging"){printf ($5>87) ? "\\uf240" : ($5>62) ? "\\uf241" : ($5>37)? "\\uf242" : "\\uf243"}else{printf "\\uf1e6"};exit;}')
	echo -e "%{c}%{B#98971a}%{F#98971a}--%{F#ebdbb2}$ICON%{F#98971a}--"
	sleep 5
done
