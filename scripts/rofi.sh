#! /usr/bin/env bash

while getopts wr options
do
	case $options in
		r)
			rofi -show run -terminal xst -g 92x24
			;;
		w)
			rofi -show window
			;;
	esac
done
