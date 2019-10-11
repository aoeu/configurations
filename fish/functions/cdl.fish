function cdl
	set dir (readlink $argv[1])
test -n "$dir" && cd "$dir"
end
