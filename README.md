# .dotfiles

## Overview

I use both macOS and Linux, so I wanted to have a single repository for my dotfiles that would work on both systems.  

On the machines I use a symlink to the dotfiles in this repository.  For example, to link the `.bashrc` file, I would run the following command:

```bash
ln -s ~/.dotfiles/bash/.bashrc ~/.bashrc 
```

IMPORTANT: The script assumes you put the .dotfiles folder in your home directory. This is also for compatibility with different systems.

## zsh

## Bash

## git


## Neovim
Neovim, which uses Lua for configuration, looks for its configuration files in several places, one of which is the `~/.config/nvim/` directory.   
By creating a symbolic link from your actual configuration files (which could be in your `.dotfiles` directory or elsewhere) to `~/.config/nvim/`, you're telling Neovim to treat the linked files as its configuration.  
```
ln -s path/to/your/.dotfiles/nvim .config/nvim
```

The nvim folder is meant to have a symlink in the .config file in the Linux home
The LSP (language server protocol) for Nvim is included in the settings.
I looked up some other flavours ov Vim like spacevim and onivim but they are deprecated as of today. NeoVim seems the best vim solution avalaible right now. Also check the primagen about Nvim.  

### Some Vim Resources to Learn VIM or NVIM
https://github.com/ThePrimeagen/vim-nav-playground  
https://theprimeagen.github.io/vim-fundamentals/  
https://www.youtube.com/watch?v=VVdmmN0su6E  
`vimtutor`  
curl https://raw.githubusercontent.com/ThePrimeagen/vim-fundamentals/master/course-website/lessons/exercise-0-hjkl-x.md > exercise.md && vim exercise.md 


## compinit warning
zsh compinit: insecure directories, run compaudit for list. Ignore insecure directories and continue [y] or abort compinit [n]? what could it be?
This warning is related to the security of the directories used by `zsh` for completion. It means that some directories in your `$fpath` have insecure permissions. You can fix this by running `compaudit` to identify the insecure directories and then adjusting their permissions.

Here are the steps to resolve this issue:

1. **Run `compaudit` to identify insecure directories:**
      compaudit
2. **Change the permissions of the insecure directories:**
   For each directory listed by `compaudit`, change the permissions to be more secure. Typically, you want to ensure that only the owner has write permissions. You can use the `chmod` command to do this. For example:
      chmod 755 /path/to/insecure/directory
3. **Re-run `compinit` to ensure the issue is resolved:**
      compinit
If you want to ignore the warning and continue without fixing the permissions, you can add the following line to your `.zshrc` file before calling `compinit`:
zstyle ':completion:*' rehash true
Here is an example of how you might modify your `.zshrc` file:
# Ignore insecure directories warning
zstyle ':completion:*' rehash true

# Initialize zsh completion
autoload -Uz compinit
compinit
This will suppress the warning, but it is recommended to fix the permissions for better security.

also run
```bash
for dir in $(compaudit); do
    sudo chmod g-w,o-w "$dir"
done
```

check who is responsible for those directories again with 
```bash
ls -ld $(compaudit)
```
