#!/usr/bin/env bash

nm-applet &
picom --experimental-backend --config ~/.config/picom/picom.conf &
dunst &
~/.config/qtile/.fehbg &

megasync &
nextcloud &

xautolock -time 8 -locker betterlockscreen -notify 30 -notifier notify-send &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown # start polkit agent from GNOME

