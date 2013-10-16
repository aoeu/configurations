# GOPATH must be set to build and install packages outside the standard Go tree
# It must contain an src directory with your packages underneath.
set -x GOPATH (echo $HOME"/Documents/Code/Projects/go")
set -x GOSOURCE (echo $HOME"/Documents/Code/Repositories/go")

set -x PLAN9 (echo $HOME"/Documents/Code/Repositories/plan9/")
set -x MYBIN (echo $HOME"/bin")
set -x RUBYPATH (echo "/usr/local/Cellar/ruby/1.9.3-p286/bin")
set -x APPENGINE (echo $HOME"/Documents/Code/Bucket/go_appengine")
set -x PATH (echo "/usr/local/bin") $PATH $MYBIN $GOBIN $RUBYPATH $PLAN9 (echo $PLAN9"/bin")

fortune
echo ☮ ♡ ∞
