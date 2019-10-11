function up
	set usage 'usage: up [NUM_DIRECTORIES]'
	set n $argv[1]
	test -z "$n" ; and cd ..; and return 0
	test "$n" -eq "$n" ^ /dev/null ; or begin;
	       	echo "$usage"; and return 1
	end
	set path ""
	for i in (seq $argv[1])
		set path "$path../"
	end
	cd $path
end
