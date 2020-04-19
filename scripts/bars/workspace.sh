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
		echo -e "%{c}%{B#484c4e}%{F#556974}%{F#88aa5f}$WS_0  %{F#556974}$WS_1  $WS_2  $WS_3  $WS_4  $WS_5  $WS_6"
			;;
		1)
		echo -e "%{c}%{B#484c4e}%{F#556974}$WS_0  %{F#88aa5f}$WS_1%{F#556974}  $WS_2  $WS_3  $WS_4  $WS_5  $WS_6"
			;;
		2)
		echo -e "%{c}%{B#484c4e}%{F#556974}$WS_0  $WS_1  %{F#88aa5f}$WS_2%{F#556974}  $WS_3  $WS_4  $WS_5  $WS_6"
			;;
		3)
		echo -e "%{c}%{B#484c4e}%{F#556974}$WS_0  $WS_1  $WS_2  %{F#88aa5f}$WS_3%{F#556974}  $WS_4  $WS_5  $WS_6"
			;;
		4)
		echo -e "%{c}%{B#484c4e}%{F#556974}$WS_0  $WS_1  $WS_2  $WS_3  %{F#88aa5f}$WS_4%{F#556974}  $WS_5  $WS_6"
			;;
		5)
		echo -e "%{c}%{B#484c4e}%{F#556974}$WS_0  $WS_1  $WS_2  $WS_3  $WS_4  %{F#88aa5f}$WS_5%{F#556974}  $WS_6"
			;;
		6)
		echo -e "%{c}%{B#484c4e}%{F#556974}$WS_0  $WS_1  $WS_2  $WS_3  $WS_4  $WS_5  %{F#88aa5f}$WS_6%{F#556974}"
			;;
	esac
	sleep 0.1
done
