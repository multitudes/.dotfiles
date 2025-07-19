

# Check if the operating system is Linux - for 42 Berlin
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
############## this is for berlin 42
	# ~/.dotfiles/scripts/createsymlinks.sh

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

    # GPG and Git signing configuration
    export GPG_TTY=$(tty)
    export GPG_AGENT_INFO=""  # Force Git to always use gpg-agent

    # Function to reset GPG agent if needed
    gpg_fix() {
        gpg-connect-agent updatestartuptty /bye >/dev/null
        git config --global gpg.program $(which gpg)
    }

    # Add alias for easy fix
    alias fix-git-signing='gpg_fix'
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    autoload -Uz compinit
    compinit
    
    # Code specific to macOS
    echo "macOS"
    
    # Homebrew setup for M1 Mac
    if [[ -f "/opt/homebrew/bin/brew" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    
    # Go path
    export PATH=$PATH:/usr/local/go/bin
    
    # For alacritty
    if [ ! -L /usr/local/bin/alacritty ]; then
        ln -sf /Applications/Alacritty.app/Contents/MacOS/alacritty /usr/local/bin/alacritty
    fi
    
    # Check if the alacritty config file exists
    if [ ! -L $HOME/.config/alacritty/alacritty.toml ]; then
        mkdir -p $HOME/.config/alacritty
        ln -sf ~/.dotfiles/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
    fi
    
    # macOS-specific aliases
    alias python='python3'
    
    # Add useful macOS aliases
    alias brewup='brew update && brew upgrade'
    alias finder='open -a Finder'
    alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
    alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
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

alias python="python3"

# ZSH_THEME="powerlevel10k/powerlevel10k"

. "$HOME/.langflow/uv/env"


# ###################################
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/mpaulson/.local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/mpaulson/.local/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/mpaulson/.local/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/mpaulson/.local/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/laurentb/.docker/completions $fpath)
autoload -Uz compinit
compinit
eval "$(starship init zsh)"
# End of Docker CLI completions
alias k="kubecolor"
