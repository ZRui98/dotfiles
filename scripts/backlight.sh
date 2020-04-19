#! /usr/bin/env bash

while getopts id options
do
	case $options in
		i)
			xbacklight -inc 2 &> /dev/null
			;;
		d)
			xbacklight -dec 2  &> /dev/null
			;;
	esac
done
