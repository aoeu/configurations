alias w3m='w3m -o auto_image=FALSE'
function cdl { local dir=`readlink $1`; [[ -n "$dir" ]] && cd "$dir"; }
EDITOR="$HOME/bin/A.sh export EDITOR"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/bin:$PATH"
GOROOT=$HOME/go export GOROOT
GOPATH=$HOME/ir export GOPATH
GOBIN=$GOPATH/bin export GOBIN
PATH=$HOME/bin:$GOBIN:$GOROOT/bin:$PATH export PATH
PLAN9=$HOME/plan9port export PLAN9
PATH=$PATH:$PLAN9/bin export PATH
ANDROID_HOME="$HOME/android" export ANDROID_HOME # deprecated 
ANDROID_SDK_ROOT="$HOME/android" export ANDROID_SDK_ROOT
exec fish
