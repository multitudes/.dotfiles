#!/bin/bash
# Stop Docker service first
systemctl --user stop docker.service 2>/dev/null || true

# Docker config directory
rm -rf ~/.docker
mkdir -p ~/goinfre/.docker
ln -sf ~/goinfre/.docker ~/.docker 2>/dev/null

# Cache directory
rm -rf ~/.cache
mkdir -p ~/goinfre/.cache
ln -sf ~/goinfre/.cache ~/.cache 2>/dev/null

# Docker data directory - FIX THIS PART
if [ -d ~/.local/share/docker ]; then
    # Backup existing data first
    mkdir -p ~/sgoinfre/docker
    cp -r ~/.local/share/docker/* ~/sgoinfre/docker/ 2>/dev/null
fi

# Remove old directory and create clean symlink
rm -rf ~/.local/share/docker
ln -sf ~/sgoinfre/docker ~/.local/share/docker

# Dotfiles symlinks
ln -sf ~/.dotfiles/gdb/.gdbinit ~/.gdbinit 2>/dev/null
rm -rf ~/.oh-my-zsh
ln -sf ~/.dotfiles/oh-my-zsh ~/.oh-my-zsh 2>/dev/null

# start docker service again
systemctl --user start docker.service 2>/dev/null || true