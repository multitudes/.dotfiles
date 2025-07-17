### this is for berlin 42

## this should create the symlinks for .gitconfig etc
# ~/.dotfiles/scripts/createsymlinks.sh

############## this is for berlin 42
# Check if the operating system is Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then

	# start from my sgoinfre folder
	# cd ~/sgoinfre

    # I downloaded the update for VSCode but i need to run it from the downloaded folder
    #alias code='/home/lbrusa/Downloads/usr/share/code/code'

    # This has beem used a lot at the beginning of my core curriculum at 42 Berlin
    alias norm='norminette -R CheckForbiddenSourceHeader'

    # This is a very useful alias that i use to compile my c files with the flags that I need
    alias c='cc -Wall -Wextra -Werror'

    # Valgrind all flags
    alias valf='valgrind --leak-check=full --track-origins=yes  --show-leak-kinds=all --track-fds=yes'
    # used for philosophers
    alias hel='valgrind --tool=helgrind -s'
    alias heldrd='valgrind --tool=drd'

    # remove all containers
    alias dclean='containers=$(docker ps -aq -f status=exited); [ -n "$containers" ] && docker rm -v $containers'

    # use neovim instead of vim
    alias vim='nvim'

    export PATH="$HOME/.local/bin:$PATH"
    export PATH="$HOME/local/bin:$PATH"

    # For when i tried to run swift on linux
    export PATH="/goinfre/swift-5.10.1-RELEASE-ubuntu22.04/usr/bin:$PATH"
    export PATH="/sgoinfre/goinfre/Perso/lbrusa/swift-5.10.1-RELEASE-ubuntu22.04/usr/bin:$PATH"

    # junest allows to install packages without sudo on 42 computers
    export PATH="$HOME/.local/share/junest/bin:$PATH"
    export PATH="/sgoinfre/goinfre/Perso/lbrusa/swift-5.10.1-RELEASE-ubuntu22.04/usr/bin:$PATH"
    export PATH="/home/lbrusa/local/bin:$PATH"
    export PATH="/home/lbrusa/.local/bin:$PATH"
    export PATH="/home/lbrusa/bin:$PATH"
    export PATH="/usr/local/sbin:$PATH"
    export PATH="/usr/local/bin:$PATH"
    export PATH="/usr/sbin:$PATH"
    export PATH="/usr/bin:$PATH"
    export PATH="/sbin:$PATH"
    export PATH="/bin:$PATH"
    export PATH="/usr/games:$PATH"
    export PATH="/usr/local/games:$PATH"
    export PATH="/snap/bin:$PATH"
    export PATH="/home/lbrusa/sgoinfre/go/bin:$PATH"
    export PATH="/home/lbrusa/sgoinfre/go_workspace/bin:$PATH"
    export PATH="/home/lbrusa/sgoinfre/DEV/bin:$PATH"

    # export PATH="/home/lbrusa/sgoinfre/homebrew/bin:$PATH"

    # Initialize Homebrew
    # eval "$(/home/lbrusa/sgoinfre/homebrew/bin/brew shellenv)"

    # Add Homebrew OpenSSL to LD_LIBRARY_PATH
    # export LD_LIBRARY_PATH="$(brew --prefix openssl)/lib:$LD_LIBRARY_PATH"

	alias eval='firefox --private-window https://profile.intra.42.fr/'
	alias gmail='firefox https://gmail.com'

	# Define the quick cd function as in "efficient linux on command line"
	qcd () {
		# Accept 1 argument that's a string key, and perform a different
		# "cd" operation for each key.
		case "$1" in
			webserv)
			cd $HOME/sgoinfre/42-Webserv
			;;
			inception)
			cd $HOME/sgoinfre/42-Inception
			;;
			books)
			cd $HOME/sgoinfre/books
			;;
			# Add more keys here as needed
			*)
			# The supplied argument was not one of the supported keys
			echo "qcd: unknown key '$1'"
			return 1
			;;
		esac
		# Helpfully print the current directory name to indicate where you are
		pwd
	}
# Set up tab completion
complete -W "webserv inception books" qcd
alias python='python3'
alias norminette=flake8

fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Code specific to macOS
	echo "macOS"

	# for go
	export PATH=$PATH:/usr/local/go/bin

	# for alacritty
	ln -sf /Applications/Alacritty.app/Contents/MacOS/alacritty /usr/local/bin/alacritty
	
fi

# common to both linux and macOS

# ignore duplicates in history when consecutively typed
HISTCONTROL=ignoredups
# vim style command line editing
#set -o vi

# alias to edit zshrc and bashrc
alias rceditz='$EDITOR $HOME/.zshrc'
alias rcedit='$EDITOR $HOME/.bashrc'

# CDPATH is like PATH but for directories
export CDPATH=$HOME:$HOME/Developer:$HOME/Music:$HOME/:$HOME/Music:..

# Number of commands to keep in memory
HISTSIZE=10000

# Number of commands to save to the history file
SAVEHIST=10000

# This allows to open your fav editor when in the terminal
# or for ex when viewing a file with less and pressing v
VISUAL=vim
EDITOR=vim

# quick edit of the bashrc file
alias rcedit='$EDITOR $HOME/.bashrc'

# dont delete the wrong files!
alias rm='rm -i'
export PATH=$HOME/.local/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"

alias python='python3'

PS1='\[\e[1;32m\]😀 \[\e[0;0m\]'

