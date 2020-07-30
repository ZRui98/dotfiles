#!/usr/bin/env bash

WS_0="\u4E00"
WS_1="\u4E8C"
WS_2="\u4E09"
WS_3="\u56DB"
WS_4="\u4E94"
WS_5="\u516D"
WS_6="\u4E03"
while true; do
	WORKSPACE_NUMBER=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
	case $WORKSPACE_NUMBER in
		0)
		echo -e "%{c}%{B#3b3735}%{F#ebdbb2}%{F#d65d0e}$WS_0  %{F#ebdbb2}$WS_1  $WS_2  $WS_3  $WS_4  $WS_5  $WS_6"
			;;
		1)
		echo -e "%{c}%{B#3b3735}%{F#ebdbb2}$WS_0  %{F#d65d0e}$WS_1%{F#ebdbb2}  $WS_2  $WS_3  $WS_4  $WS_5  $WS_6"
			;;
		2)
		echo -e "%{c}%{B#3b3735}%{F#ebdbb2}$WS_0  $WS_1  %{F#d65d0e}$WS_2%{F#ebdbb2}  $WS_3  $WS_4  $WS_5  $WS_6"
			;;
		3)
		echo -e "%{c}%{B#3b3735}%{F#ebdbb2}$WS_0  $WS_1  $WS_2  %{F#d65d0e}$WS_3%{F#ebdbb2}  $WS_4  $WS_5  $WS_6"
			;;
		4)
		echo -e "%{c}%{B#3b3735}%{F#ebdbb2}$WS_0  $WS_1  $WS_2  $WS_3  %{F#d65d0e}$WS_4%{F#ebdbb2}  $WS_5  $WS_6"
			;;
		5)
		echo -e "%{c}%{B#3b3735}%{F#ebdbb2}$WS_0  $WS_1  $WS_2  $WS_3  $WS_4  %{F#d65d0e}$WS_5%{F#ebdbb2}  $WS_6"
			;;
		6)
		echo -e "%{c}%{B#3b3735}%{F#ebdbb2}$WS_0  $WS_1  $WS_2  $WS_3  $WS_4  $WS_5  %{F#d65d0e}$WS_6%{F#ebdbb2}"
			;;
	esac
	sleep 0.1
done
