#!/bin/bash

# Define the dotfiles directory
DOTFILES_DIR="$HOME/.dotfiles"

# List of dotfiles to be linked
declare -a DOTFILES=(
    ".bashrc"
	".zshrc"
    ".gitconfig"
	".gitignore_global"

    # Add more dotfiles as needed
)

# Create symlinks for each dotfile
# Check if the dotfile exists
if [ -f "$HOME/.bashrc" ]; then
	# Backup the existing dotfile
	mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
fi
if [ -f "$HOME/.zshrc" ]; then
	# Backup the existing dotfile
	mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
fi
if [ -f "$HOME/.gitconfig" ]; then
	# Backup the existing dotfile
	mv "$HOME/.gitconfig" "$HOME/.gitconfig.bak"
fi
if [ -f "$HOME/.gitignore_global" ]; then
	# Backup the existing dotfile
	mv "$HOME/.gitignore_global" "$HOME/.gitignore_global.bak"
fi
if [ -f "$HOME/.gdbinit" ]; then
	# Backup the existing dotfile
	mv "$HOME/.gdbinit" "$HOME/.gdbinit.bak"
fi
if [ -f "$HOME/.tmux.conf" ]; then
	# Backup the existing dotfile
	mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.bak"
fi	

if [ -f "$HOME/.alacrytty.yml" ]; then
	# Backup the existing dotfile
	mv "$HOME/.alacrytty.yml" "$HOME/.alacrytty.yml.bak"
fi

# Create a symlink to the dotfile
ln -sf "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"
ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTFILES_DIR/alacritty/.alacritty.yml" "$HOME/.alacritty.yml"

# only for linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then 
	ln -sf "$DOTFILES_DIR/gdb/.gdbinit" "$HOME/.gdbinit"
fi

echo "Dotfiles have been linked."