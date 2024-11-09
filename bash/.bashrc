### this is for berlin 42
# Check if the operating system is Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	# This has beem used a lot at the beginning of my core curriculum at 42 Berlin
	alias norm='norminette -R CheckForbiddenSourceHeader'
	# This is a very useful alias that i use to compile my c files with the flags that I need
	alias c='cc -Wall -Wextra -Werror'
	# Valgtind all flags
	alias valf='valgrind --leak-check=full --track-origins=yes  --show-leak-kinds=all --track-fds=yes'
	# used for philosophers
	alias hel='valgrind --tool=helgrind -s'
	alias heldrd='valgrind --tool=drd'


	export PATH="$HOME/.local/bin:$PATH"
	export PATH=$HOME/local/bin:$PATH

	# For when i tried to run swift un linux
	export PATH=/goinfre/swift-5.10.1-RELEASE-ubuntu22.04/usr/bin:$PATH
	export PATH=/sgoinfre/goinfre/Perso/lbrusa/swift-5.10.1-RELEASE-ubuntu22.04/usr/bin:$PATH

	# junest allows to install packages without sudo on 42 computers
	export PATH=~/.local/share/junest/bin:/home/lbrusa/.local/share/junest/bin:/sgoinfre/goinfre/Perso/lbrusa/swift-5.10.1-RELEASE-ubuntu22.04/usr/bin:/home/lbrusa/local/bin:/home/lbrusa/local/bin:/home/lbrusa/local/bin:/home/lbrusa/local/bin:/home/lbrusa/.local/bin:/home/lbrusa/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Code specific to macOS
	echo "macOS"
	# Add Anaconda3 to PATH
	export PATH="$HOME/anaconda3/bin:$PATH"

	# Initialize conda
	if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
		. "$HOME/anaconda3/etc/profile.d/conda.sh"
	else
		export PATH="$HOME/anaconda3/bin:$PATH"
	fi
	# for alacritty
	ln -s /Applications/Alacritty.app/Contents/MacOS/alacritty /usr/local/bin/alacritty
	
fi

# common to both linux and macOS
# ignore duplicates in history when consecutively typed
HISTCONTROL=ignoredups

# vim style command line editing
set -o vi

#alias to edit zshrc and bashrc
alias rceditz='$EDITOR $HOME/.zshrc'
alias rcedit='$EDITOR $HOME/.bashrc'

# CDPATH is like PATH but for directories
export CDPATH=$HOME:$HOME/Developer:$HOME/Music:$HOME/:$HOME/Music:..

# Docker aliases
# remove all containers
alias dclean='containers=$(docker ps -aq -f status=exited); [ -n "$containers" ] && docker rm -v $containers'

# NVIM
# use neovim instead of vim
alias vim='nvim'
