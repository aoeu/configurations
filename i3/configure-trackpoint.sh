#!/bin/sh
set -e

# Usually the track-point device is named "TPPS/2 IBM TrackPoint" or "TPPS/2 Elan TrackPoint"
trackpointDeviceName=`xinput list | grep 'TPPS.*TrackPoint' | awk '{print $3" "$4" "$5}'`

# We could also use the device ID instead of the device name, but let's not and know we could.
# trackpointDeviceID=`xinput list | grep 'TPPS.*TrackPoint' | sed -E 's/^.*id=([0-9]+).*$/\1/g'`

# Emulate the middle mouse button.
xinput set-prop "$trackpointDeviceName" 'libinput Middle Emulation Enabled' 1

# Enable clicking and dragging of middle mouse button (instead of track-pad based scrolling).
# https://bbs.archlinux.org/viewtopic.php?pid=1791624#p1791624
# https://wayland.freedesktop.org/libinput/doc/latest/scrolling.html
xinput set-prop "$trackpointDeviceName" 'libinput Scroll Method Enabled' 0 0 0
