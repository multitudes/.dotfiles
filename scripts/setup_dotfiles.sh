#!/bin/bash

# Define the dotfiles directory
DOTFILES_DIR="$HOME/Dev/.dotfiles"

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

# Create a symlink to the dotfile
ln -s "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"
ln -s "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
ln -s "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
ln -s "$DOTFILES_DIR/git/.gitignore_global" "$HOME/.gitignore_global"


echo "Dotfiles have been linked."