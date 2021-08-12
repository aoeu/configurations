#!/bin/sh
set -e

# Usually the track-point device is named "TPPS/2 IBM TrackPoint" or "TPPS/2 Elan TrackPoint"
# trackpointDeviceName=`xinput list | grep 'TPPS.*TrackPoint' | awk '{print $3" "$4" "$5}'`

# Ideally, we would use the device name instead of the device ID, but the device name can appear twice(!)
# and Xorg will request picking an ID instead. So we'll naively brute-force all matching IDs in a loop.
# trackpointDeviceID=`xinput list | grep 'TPPS.*TrackPoint' | sed -E 's/^.*id=([0-9]+).*$/\1/g'`
for trackpointDeviceID in `xinput list | grep 'TPPS.*TrackPoint' | sed -E 's/^.*id=([0-9]+).*$/\1/g'`
do
	# Emulate the middle mouse button.
	xinput set-prop "$trackpointDeviceID" 'libinput Middle Emulation Enabled' 1

	# Enable clicking and dragging of middle mouse button (instead of track-pad based scrolling).
	# https://bbs.archlinux.org/viewtopic.php?pid=1791624#p1791624
	# https://wayland.freedesktop.org/libinput/doc/latest/scrolling.html
	xinput set-prop "$trackpointDeviceID" 'libinput Scroll Method Enabled' 0 0 0

done
