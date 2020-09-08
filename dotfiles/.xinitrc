#!/bin/sh

# some resources
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# enable restart X
/usr/bin/setxkbmap -option terminate:ctrl_alt_bksp

# setup status bar
while true; do
	xsetroot -name "$(xsetcmus) • $(echo 'ip: '$(myip)) • $(vpn_up_or_down) • $(sudo iw dev | grep ssid | awk {'print $2'}) • $(chg_or_dis)$(echo "$(cat /sys/class/power_supply/BAT0/capacity)$(echo "%")") • $(date +%I:%M)"
sleep 5    
done &

# autostart 
setxkbmap dvorak &
xbindkeys &
xautolock -time 10 -locker 'slock' &
unclutter &
clipmenud &

# start window manager
exec dwm
