#!/usr/bin/env bash
SCREEN_START=0
SCREEN_HEIGHT=1080
OPEN=$(pidof lemonbar)
HEIGHT=35
WS_WIDTH=230
SIZE=':size=12'
ICON_WIDTH=39
WIDGET_WIDTH=51
POWER_WIDTH=40
NET_WIDTH=120
BOTTOM=$((( $SCREEN_HEIGHT - 45 )))
BOTTOM2=990
CLOCK_WIDTH=90
DATE_WIDTH=160
GAP=10

if [ "$OPEN" = "" ]; then
	NUM_MONITORS=$(xrandr -d :0 -q | grep ' connected' | wc -l)
	if (( NUM_MONITORS > 1 )); then
		# Load X & Y of mouse
		eval $(xdotool getmouselocation --shell)
		if (( X > 1920 && X <4480 )); then
			SCREEN_START=1920
			SCREEN_HEIGHT=1440
		elif (( X >= 4480 )); then
			SCREEN_START=4480
			SCREEN_HEIGHT=1920
		fi
		HEIGHT=50
		ICON_WIDTH=56
		WIDGET_WIDTH=73
		POWER_WIDTH=57
		NET_WIDTH=172
		WS_WIDTH=329
		SIZE=':size=16'
		CLOCK_WIDTH=129
		DATE_WIDTH=229
		GAP=15
		BOTTOM=$((( $SCREEN_HEIGHT-$HEIGHT-$GAP )))
		BOTTOM2=$((( $BOTTOM-$HEIGHT-$GAP )))
	fi
	/home/ciguatera/scripts/bars/workspace.sh | lemonbar -d -p -f "IPAGothic${SIZE}" -g ${WS_WIDTH}x$HEIGHT+$((( $GAP+ $SCREEN_START )))+${GAP} -n workspaces &

	# /home/ciguatera/scripts/bars/music.sh | lemonbar -d -p -f "FontAwesome${SIZE}" -f "Iosevka Nerd Font${SIZE}" -g 90x$HEIGHT+10+945 -n music | sh &

	# /home/ciguatera/scripts/bars/music_title.sh | lemonbar -d -p -f "Iosevka Nerd Font${SIZE}" -g 315x$HEIGHT+100+945 -n music-title &

	VOLUME_ICON="\uf028"
	echo -e "%{c}%{B#d65d0e}%{F#d65d0e}--%{F#ebdbb2}$VOLUME_ICON%{F#d65d0e}--"| lemonbar -d -p -f "FontAwesome${SIZE}" -f "Iosevka Nerd Font${SIZE}" -g ${ICON_WIDTH}x$HEIGHT+$((( $GAP + $SCREEN_START )))+${BOTTOM2} -n volume-icon &
	/home/ciguatera/scripts/bars/volume.sh | lemonbar -d -p -f "FontAwesome${SIZE}" -f "Iosevka Nerd Font${SIZE}" -g ${WIDGET_WIDTH}x$HEIGHT+$((( $GAP + $ICON_WIDTH + $SCREEN_START )))+${BOTTOM2} -n volume &

	/home/ciguatera/scripts/bars/battery_icon.sh | lemonbar -d -p -f "FontAwesome${SIZE}" -f "Iosevka Nerd Font${SIZE}" -g ${ICON_WIDTH}x$HEIGHT+$((( $GAP * 2 + $ICON_WIDTH + $WIDGET_WIDTH + $SCREEN_START )))+${BOTTOM2} -n battery-icon &
	/home/ciguatera/scripts/bars/battery.sh | lemonbar -d -p -f "FontAwesome${SIZE}" -f "Iosevka Nerd Font${SIZE}" -g ${WIDGET_WIDTH}x$HEIGHT+$((( $GAP * 2 + 2 * $ICON_WIDTH + $WIDGET_WIDTH + $SCREEN_START )))+${BOTTOM2} -n battery &

	NETWORK_ICON="\uf1eb"
	echo -e "%{c}%{B#458588}%{F#458588}--%{F#ebdbb2}$NETWORK_ICON%{F#458588}--"| lemonbar -d -p -f "FontAwesome${SIZE}" -f "Iosevka Nerd Font${SIZE}" -g ${ICON_WIDTH}x$HEIGHT+$((($GAP * 3 + 2 * $ICON_WIDTH + 2 * $WIDGET_WIDTH + $SCREEN_START )))+${BOTTOM2} -n network-icon &
	/home/ciguatera/scripts/bars/network.sh | lemonbar -d -p -f "FontAwesome${SIZE}" -f "Iosevka Nerd Font${SIZE}" -g ${NET_WIDTH}x$HEIGHT+$((($GAP * 3 + 3 * $ICON_WIDTH + 2 * $WIDGET_WIDTH + $SCREEN_START )))+${BOTTOM2} -n network &

	/home/ciguatera/scripts/bars/clock.sh | lemonbar -d -p -f "FontAwesome${SIZE}" -f "Iosevka Nerd Font${SIZE}" -g ${CLOCK_WIDTH}x$HEIGHT+$((( $GAP*2 + $POWER_WIDTH + $SCREEN_START )))+${BOTTOM} -n clock &
	/home/ciguatera/scripts/bars/date.sh | lemonbar -d -p -f "FontAwesome${SIZE}" -f "Iosevka Nerd Font${SIZE}" -g ${DATE_WIDTH}x$HEIGHT+$((( $GAP*2 + $POWER_WIDTH + $CLOCK_WIDTH + $SCREEN_START )))+${BOTTOM} -n date &

	/home/ciguatera/scripts/bars/power.sh | lemonbar -d -p -f "FontAwesome${SIZE}" -g ${POWER_WIDTH}x${HEIGHT}+$((( $GAP + $SCREEN_START )))+${BOTTOM} -n power | sh &
else
	killall lemonbar
fi
