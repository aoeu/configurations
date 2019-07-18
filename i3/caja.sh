#!/bin/sh
# This script is intended for starting caja(1) on systems
# running MATE where i3 has been set as MATE's windowmanager.
# 
# Startin caja directl on such systems results in a fullscreen,
# "unwindowed" desktop view that dominates an entire i3 workspace
# and seemingly can only be exited by the user using kill(1) on the 
# caja process ID. 
#
# Instead, this script starts caja in a way that causes it a file
# browser to appear without a creating a desktop, and nicely 
# interops with i3 for file browsing.
unset DESKTOP_AUTOSTART_ID && exec /usr/bin/caja --no-desktop $@
