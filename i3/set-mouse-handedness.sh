#!/bin/sh
usage="usage: $0 <mouse name> (r|R|right|l|L|left)"
test $# -ne 2 && {
	echo >&2 $usage
	exit 1
}
mouseName="$(xinput list | grep pointer | grep -i "$1" | cut -f1 | sed 's/⎜   ↳ //; s/       //')"
test "" = "$mouseName" && {
	echo >&2 "could not find a device name that matched the argument '$1' (is it connected?)"
	exit 1
}
mouseID=$(xinput list --id-only "$mouseName")
case $(echo "$2" | cut -c1) in
    l|L) buttonOrder='3 2 1';;
    r|R) buttonOrder='1 2 3';;
    *) echo >&2 $usage; exit 1 ;;
esac
xinput set-button-map $mouseID $buttonOrder
