function cdl
	set symlink (string trim --right --chars=/ "$argv[1]")
	set dir (readlink "$symlink")
	test -z "$dir"; and echo "'$symlink' does not appear to be a symbolic link" 1>&2; and return 1
	cd "$dir"
end
