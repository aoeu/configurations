#!/bin/sh
# Utilize with `crontab -e` (no sudo) and `*/15 * * * * /fully/qualified/filepath/checkbattery.sh`.

test "Charging" = $(cat /sys/class/power_supply/BAT0/status) && \
	exit 0

threshold="10" message="Battery power is lower than $threshold%"
battery_percent=$(head /sys/class/power_supply/BAT0/capacity)

test "$battery_percent" -lt "$threshold" && \
	DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id --user)/bus" \
	notify-send --urgency=critical "$message"
