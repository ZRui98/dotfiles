#! /usr/bin/env bash

while getopts idm options
do
	case $options in
		i)
			amixer -D pulse sset Master 2%+ &> /dev/null
			;;
		d)
			amixer -D pulse sset Master 2%- &> /dev/null
			;;
		m)
			amixer -c 0 -q -D default set Master toggle &> /dev/null
			;;
	esac
done
