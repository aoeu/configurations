#!/bin/sh
logfile='/tmp/docking.log'
date > $logfile
if [ 'eDP-1' = $(xrandr | grep '\<connected\>' | awk '{print $1}' | tail -1) ] ; then
	echo 'not docked' >> $logfile
	xrandr --output HDMI-2 --off --output HDMI-1 --off --output DP-1 --off --output eDP-1 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DP-2 --off
else
	echo 'docked' >> $logfile
	xrandr --output HDMI-2 --off --output HDMI-1 --off --output DP-1 --primary --mode 3840x2160 --pos 2560x0 --rotate normal --output eDP-1 --off --output DP-2 --off
fi
