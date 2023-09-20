function cdl
	set symlink (string trim --right --chars=/ "$argv[1]")
	set dir (readlink "$symlink")
	test -n "$dir" && cd "$dir"
end
