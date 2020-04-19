#! /usr/bin/env bash

while :
do
	RESULT=$(mpc status | awk 'NR==2 {if($1=="[playing]"){print "\uf04b"}else{print "\uf04c"};exit;}')
	if [ "$RESULT" = "" ]; then
		RESULT="\uf04c"
	fi
	echo -e "%{c}%{B#556973}%{F#556973}_%{F#d8d9d4}%{A:mpc prev:}\uf04a%{A}%{F#556973}__%{A:mpc toggle:}%{F#d8d9d4}$RESULT%{A}%{F#556973}__%{A:mpc next:}%{F#d8d9d4}\uf04e%{A}%{F#556973}_"
	sleep 1
done
