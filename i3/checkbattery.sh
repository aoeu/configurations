#!/bin/sh
# Utilize with `crontab -e` (no sudo) and `*/15 * * * * /fully/qualified/filepath/checkbattery.sh`.

test "Charging" = $(cat /sys/class/power_supply/BAT0/status) && \
	exit 0

threshold="10" message="Battery power is lower than $threshold%"
battery_percent=$(acpi --battery | sed --regexp-extended 's/.*\s([0-9]+)%.*/\1/')

test "$battery_percent" -lt "$threshold" && \
	DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id --user)/bus" \
	notify-send --wait --urgency=critical "$message"
