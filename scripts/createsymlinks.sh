#!/bin/bash
# for 42 berlin computers
# This script creates symlinks to the .docker folder on goinfre
# because the goinfre storage is deleted regularly
# and the .docker folder is too big to be stored in the home directory
# therefore everytime I log in I need to recreate the symlink
# use 
rm -rf ~/.docker
mkdir -p ~/goinfre/.docker
ln -sf ~/goinfre/.docker ~/.docker 2>/dev/null

rm -rf ~/.cache
mkdir -p ~/goinfre/.cache
ln -sf ~/goinfre/.cache ~/.cache 2>/dev/null

ln -sf ~/sgoinfre/docker ~/.local/share/docker 2>/dev/null

# for my dotfiles
ln -sf ~/.dotfiles/gdb/.gdbinit ~/.gdbinit
# ls -l ~/.docker
ln -s ~/.dotfiles/oh-my-zsh ~/.oh-my-zsh
