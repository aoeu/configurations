#!/bin/sh

main() {
# TODO(aoeu): Serving godoc causes this program to exit on first run (only). Why?
# pgrep godoc || ~/bin/serve-godoc.sh

	launch	'1'  'alacritty --command tmux '           && \
	launch	'2'  'firefox'                             && \
	launch	'3'  'acme -f /mnt/font/GoMono/16a/font '
# TODO(aoeu): The following programs are too slow to start. What can be done?
#	launch	'8'  'rocketchat-desktop'                  && \
#	launch	'9'  'g-calendar'                          && \
#	launch '10'  'slack'
}

launch() {
	workspaceNum=$1 2>>/tmp/workspaces.log
	command=$2 2>>/tmp/workspaces.log
	i3-msg "workspace $workspaceNum; exec $command" 2>>/tmp/workspaces.log
	sleep 0.75 2>>/tmp/workspaces.log
	i3-msg "move container to workspace $workspaceNum" 2>>/tmp/workspaces.log
	sleep 0.75 2>>/tmp/workspaces.log
}

touch /tmp/workspaces.log
main 2>>/tmp/workspaces.log
