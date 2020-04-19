xrdb -load ~/.Xresources
xinput --set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" 0.8
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
source /etc/X11/Xsession.d
xset s off -dpms &
dunst &
/home/ciguatera/scripts/bars.sh &
/home/ciguatera/scripts/ac-light &
/home/ciguatera/scripts/monitor-check.sh
udiskie -a -n &
feh --bg-fill ~/Pictures/1557593648275.jpg &
xst &
compton -b --backend glx --paint-on-overlay --vsync opengl-swc
xsetroot -cursor_name left_ptr
exec /usr/local/bin/2bwm 
