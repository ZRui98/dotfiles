#!/usr/bin/env bash
CONNECTIONS=$(xrandr | grep -sw 'connected' | wc -l)

if [[ "$CONNECTIONS" -gt "1" ]];then
	/home/ciguatera/scripts/dual.sh
else
	xrandr --output HDMI2 --off
fi;
