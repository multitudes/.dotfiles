
# Check if the operating system is Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
############## this is for berlin 42
	~/.scripts/createsymlinks.sh

	# start from my sgoinfre folder but this breaks when starting a terminal from vscode with the path from folder
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

	# open a new incognito window in Firefox for evaluations
	alias eval='firefox --private-window https://profile.intra.42.fr/' 
	alias gmail='firefox https://gmail.com'
	
	
	# First, find and fix permissions
	for dir in $(compaudit); do
		chmod go-w "$dir"
	done

	# Then load completion system
	autoload -Uz compinit
	compinit

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
	# set up tab completion for qcd
	compdef '_values "qcd" webserv inception books' qcd
    alias python='python3'
    alias norminette=flake8
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
	autoload -Uz compinit
	compinit
    
	# Code specific to macOS
	echo "macOS"
	
	# First, find and fix permissions
	# for dir in $(compaudit); do
	# 	chmod go-w "$dir"
	# done

	# Then load completion system
	# for go
	export PATH=$PATH:/usr/local/go/bin

	# for alacritty
	# check if the config file exists
    # for alacritty
    if [ ! -L /usr/local/bin/alacritty ]; then
        ln -s /Applications/Alacritty.app/Contents/MacOS/alacritty /usr/local/bin/alacritty
    fi
    
    # check if the config file exists
    if [ ! -L $HOME/.config/alacritty/alacritty.toml ]; then
        mkdir -p $HOME/.config/alacritty
        ln -s ~/.dotfiles/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
    fi
fi

# common to both linux and macOS
# ignore duplicates in history when consecutively typed
HISTCONTROL=ignoredups
# vim style command line editing
set -o vi

# alias to edit zshrc and bashrc
alias rceditz='$EDITOR $HOME/.zshrc'
alias rcedit='$EDITOR $HOME/.bashrc'

# CDPATH is like PATH but for directories
export CDPATH=$HOME:$HOME/Developer:$HOME/Music:$HOME/:$HOME/Music:..

# Number of commands to keep in memory
HISTSIZE=10000

# Number of commands to save to the history file
SAVEHIST=10000

# this allows your fav editor to be used in the terminal
# or when viewing a file in the terminal with less and pressint v
EDITOR=vim
VISUAL=vim

# quick edit of the zshrc file
alias rczedit='$EDITOR $HOME/.zshrc'

# Dont delete the wrong file
alias rm='rm -i'

alias python='python3'
ZSH_THEME="powerlevel10k/powerlevel10k"
. "$HOME/.langflow/uv/env"
