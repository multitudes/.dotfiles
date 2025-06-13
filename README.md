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
https://github.com/ThePrimeagen/vim-fundamentals/blob/master/lessons/exercise-0-hjkl-x.md  


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

## oh my zsh
To check if Oh My Zsh is activated, you can:

1. Look for the `.oh-my-zsh` directory:
```bash
ls -la ~/.oh-my-zsh
```

2. Check your .zshrc file for Oh My Zsh configuration:
```bash
grep "oh-my-zsh" ~/.zshrc
```

The "macOS" greeting comes from this line in your .zshrc:
```bash
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Code specific to macOS
    echo "macOS"
    ...
fi
```


## hostname

As for "MutantBot" - this is your computer's hostname. You can check it with:
```bash
hostname
```

To change it, you can use:
```bash
sudo scutil --set HostName yournewname
```

If you want to remove the "macOS" greeting, you can simply remove or comment out the `echo "macOS"` line in your .zshrc file.

To fully activate Oh My Zsh with a theme, make sure these lines are in your .zshrc:
```bash
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"  # or any other theme you prefer
source $ZSH/oh-my-zsh.sh
```

## symlinks
A symlink (symbolic link) is a special type of file that points to another file or directory. Think of it as a shortcut or alias. Here's a simple explanation:

Symlink Basics:
It's like a pointer or reference to another file/directory
Changes to the original file are reflected in the symlink
Deleting the symlink doesn't delete the original file
Deleting the original file breaks the symlink
Example from your dotfiles:
In your setup script, you have several symlinks:

This creates a symlink from .bashrc to your dotfiles repository's .bashrc. The -s flag creates a symbolic link, and -f forces the creation even if the destination already exists. Symbolic Links (Soft Links)
Created with ln -s
Points to the pathname of another file
Can link across different filesystems
Can point to directories
If the original file is deleted, the link breaks
Shows up in ls -l with an l at the start and -> pointing to the target


### Hard Links
Created with ln (without -s)
Points directly to the inode (data) of the file
Must be on the same filesystem
Cannot link to directories
Original file data remains accessible even if the original filename is deleted
Appears as a regular file in ls -l