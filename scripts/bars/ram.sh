#! /usr/bin/env bash

while :
do
	RAM=$(free --mega | awk '/Mem:/ {print $3}')
	echo -e "%{B#}%{F#} RAM  %{B#}%{F#}$RAM"
done
