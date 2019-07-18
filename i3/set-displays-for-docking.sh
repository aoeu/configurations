#!/bin/sh
logfile='/tmp/docking.log'
date > $logfile

connectedDisplays=$(xrandr | grep '\<connected\>'  | awk '{print $1}' | sort | tr '\n' ',')

if [ 'eDP-1,' = "$connectedDisplays" ] ; then
	echo 'not docked' >> $logfile
	xrandr  --output eDP-1 --primary --mode 2560x1440 \
            --output HDMI-1 --off \
            --output DP-2 --off &&  \
                        exit 0
fi


if [  'DP-2,eDP-1,HDMI-1,' = "$connectedDisplays" ] ; then
	echo 'docked' >> $logfile
	xrandr  --output eDP-1  --off \
            --output HDMI-1 --mode 1920x1080 --rotate left \
            --output DP-2 --mode 3840x2160 --rotate normal --right-of HDMI-1 && \
                        exit 0
fi
