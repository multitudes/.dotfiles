# .dotfiles

## Overview

I use both macOS and Linux, so I wanted to have a single repository for my dotfiles that would work on both systems.  

On the machines I use a symlink to the dotfiles in this repository.  For example, to link the `.bashrc` file, I would run the following command:

```bash
ln -s ~/.dotfiles/bash/.bashrc ~/.bashrc 
```

## Neovim
Neovim, which uses Lua for configuration, looks for its configuration files in several places, one of which is the `~/.config/nvim/` directory.   
By creating a symbolic link from your actual configuration files (which could be in your `.dotfiles` directory or elsewhere) to `~/.config/nvim/`, you're telling Neovim to treat the linked files as its configuration.  
```
ln -s path/to/your/.dotfiles/nvim .config/nvim
```


The nvim folder is meant to have a symlink in the .config file in the Linux home