GOROOT=/opt/go export GOROOT
GOPATH=/opt/ir export GOPATH
GOBIN=$GOPATH/bin export GOBIN
PLAN9=/opt/plan9port export PLAN9
EDITOR=$GOBIN/A export EDITOR
PATH=$PATH:$HOME/Developer/bin:$GOROOT/bin:${GOPATH//://bin:}/bin:$PLAN9/bin export PATH

alias claro=clear
alias acme='acme -f /mnt/font/GoRegular/13a/font'
