#! /usr/bin/env bash
OPEN=$(pidof lemonbar)
HEIGHT=35
WS_WIDTH=230
SIZE=':size=12'
ICON_WIDTH=39
WIDGET_WIDTH=51
POWER_WIDTH=40
NET_WIDTH=110
BOTTOM=1035
BOTTOM2=990
CLOCK_WIDTH=90
DATE_WIDTH=160
GAP=10
if [ "$OPEN" = "" ]; then
	NUM_MONITORS=$(xrandr -d :0 -q | grep ' connected' | wc -l)
	if (( NUM_MONITORS > 1 )); then
		HEIGHT=55
		ICON_WIDTH=62
		WIDGET_WIDTH=80
		POWER_WIDTH=63
		NET_WIDTH=173
		WS_WIDTH=362
		SIZE=':size=18'
		CLOCK_WIDTH=141
		DATE_WIDTH=251
		GAP=20
		BOTTOM=$((( 1080-$HEIGHT-$GAP )))
		BOTTOM2=$((( $BOTTOM-$HEIGHT-$GAP )))
	fi
	/home/ciguatera/scripts/bars/workspace.sh | lemonbar -d -p -f "IPAGothic${SIZE}" -g ${WS_WIDTH}x$HEIGHT+${GAP}+${GAP} -n workspaces &

	# /home/ciguatera/scripts/bars/music.sh | lemonbar -d -p -f FontAwesome -f Iosevka Nerd Font -g 90x$HEIGHT+10+945 -n music | sh &

	# /home/ciguatera/scripts/bars/music_title.sh | lemonbar -d -p -f Iosevka Nerd Font -g 315x$HEIGHT+100+945 -n music-title &

	 VOLUME_ICON="\uf028"
	 echo -e "%{c}%{B#ccb05f}%{F#ccb05f}--%{F#d8d9d4}$VOLUME_ICON%{F#ccb05f}--"| lemonbar -d -p -f "FontAwesome${SIZE}" -f "Iosevka Nerd Font${SIZE}" -g ${ICON_WIDTH}x$HEIGHT+${GAP}+${BOTTOM2} -n volume-icon &
	/home/ciguatera/scripts/bars/volume.sh | lemonbar -d -p -f "FontAwesome${SIZE}" -f "Iosevka Nerd Font${SIZE}" -g ${WIDGET_WIDTH}x$HEIGHT+$((( $GAP + $ICON_WIDTH )))+${BOTTOM2} -n volume &

	/home/ciguatera/scripts/bars/battery_icon.sh | lemonbar -d -p -f "FontAwesome${SIZE}" -f "Iosevka Nerd Font${SIZE}" -g ${ICON_WIDTH}x$HEIGHT+$((( $GAP * 2 + $ICON_WIDTH + $WIDGET_WIDTH )))+${BOTTOM2} -n battery-icon &
	/home/ciguatera/scripts/bars/battery.sh | lemonbar -d -p -f "FontAwesome${SIZE}" -f "Iosevka Nerd Font${SIZE}" -g ${WIDGET_WIDTH}x$HEIGHT+$((( $GAP * 2 + 2 * $ICON_WIDTH + $WIDGET_WIDTH)))+${BOTTOM2} -n battery &

	 NETWORK_ICON="\uf1eb"
	 echo -e "%{c}%{B#7b6072}%{F#7b6072}--%{F#d9d8d4}$NETWORK_ICON%{F#7b6072}--"| lemonbar -d -p -f "FontAwesome${SIZE}" -f "Iosevka Nerd Font${SIZE}" -g ${ICON_WIDTH}x$HEIGHT+$((($GAP * 3 + 2 * $ICON_WIDTH + 2 * $WIDGET_WIDTH)))+${BOTTOM2} -n network-icon &
	/home/ciguatera/scripts/bars/network.sh | lemonbar -d -p -f "FontAwesome${SIZE}" -f "Iosevka Nerd Font${SIZE}" -g ${NET_WIDTH}x$HEIGHT+$((($GAP * 3 + 3 * $ICON_WIDTH + 2 * $WIDGET_WIDTH)))+${BOTTOM2} -n network &

	/home/ciguatera/scripts/bars/clock.sh | lemonbar -d -p -f "FontAwesome${SIZE}" -f "Iosevka Nerd Font${SIZE}" -g ${CLOCK_WIDTH}x$HEIGHT+$((( $GAP * 2 + $POWER_WIDTH  )))+${BOTTOM} -n clock &
	/home/ciguatera/scripts/bars/date.sh | lemonbar -d -p -f "FontAwesome${SIZE}" -f "Iosevka Nerd Font${SIZE}" -g ${DATE_WIDTH}x$HEIGHT+$((( $GAP * 2 + $POWER_WIDTH + $CLOCK_WIDTH  )))+${BOTTOM} -n date &

	/home/ciguatera/scripts/bars/power.sh | lemonbar -d -p -f "FontAwesome${SIZE}" -g ${POWER_WIDTH}x$HEIGHT+${GAP}+${BOTTOM} -n power | sh &
else
	killall lemonbar
fi
