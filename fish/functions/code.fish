function code
	if test ! $argv
		cd ~/Documents/Code
		return
	end
	switch $argv
		case bucket
			cd ~/Documents/Code/Bucket
		case go
			cd ~/Documents/Code/Projects/go/src
		case comics
			cd ~/Documents/Code/Bucket/comic_kit
		case audio
			cd ~/Documents/Code/Projects/go/src/audio
		case sovereign
			cd ~/Documents/Code/Repositories/sovereign
		case '*'
			cd ~/Documents/Code
			if test -e $argv
				cd $argv
			end
	end
end 
