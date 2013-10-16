############################
# Temporary or OS Specific #
############################
if test -e ${HOME}/.bash_burner
then
	source ${HOME}/.bash_burner
fi
export PATH="${PATH}:${HOME}/bin"
export PATH="/usr/local/bin:${PATH}"

##############
# Rudiments #
#############

PS1="[ travis@\w ] \j\n "
set -o vi
set -o noclobber
	
#########################
# Environment Variables #
#########################


###########
# Aliases #
###########

# grep
alias g='grep '
alias gi='grep -i '
alias gv='grep -v '

# ls
alias ls='ls -GF'

#############
# Functions #
#############

err() {
    echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
}

function trash {
	for fileName in $*  
	do
		mv "$fileName" ~/.Trash
		if [ $? -eq 0 ]; then 
			echo "Moved '$fileName' to Trash"
		else
			echo "Could not move '$fileName' to Trash"
		fi
	done
}

function makem3u {
    IFS="
"
    echo  "#EXTM3U" > $1
    for file in $(ls);
    do
        echo "#EXTINF:" >> $1
        echo "$file"    >> $1
    done
}

function pyserv {
	python -m SimpleHTTPServer 8080
}
