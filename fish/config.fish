set -x GOROOT_BOOTSTRAP "/opt/go1.4"
set -x GOROOT "/opt/go"
set -x GOPATH "/opt/ir"
set -x GOBIN "$GOPATH/bin"
set -x PLAN9 "/opt/plan9port"
set -x EDITOR "$GOBIN/A"
set -x ANDROID_HOME "$HOME/Developer/android"

set PATH  "$HOME/Developer/bin" "/opt/local/bin" "/opt/local/sbin" "/usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin"  "$GOROOT/bin" "$GOPATH/bin" "$PLAN9/bin" "$HOME/.cargo/bin" "$ANDROID_HOME/platform-tools" "$ANDROID_HOME/tools/bin" "$ANDROID_HOME/build-tools/25.0.2" "/opt/flutter/bin"

