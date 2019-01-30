#!/bin/sh

main() {
	launch	'1'	'alacritty --command tmux' 	&& \
	launch	'2'	'firefox' 			&& \
	launch	'3'	'ac' 				&& \
	launch	'9'	'g-calendar' 			&& \
	launch	'0'	'slack'
}

launch() {
	workspaceNum=$1
	command=$2
	i3-msg "workspace $workspaceNum; exec $command"
	sleep 0.5
}

main
