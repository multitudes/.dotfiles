# .dotfiles

## Neovim
Neovim, which uses Lua for configuration, looks for its configuration files in several places, one of which is the `~/.config/nvim/` directory.   
By creating a symbolic link from your actual configuration files (which could be in your `.dotfiles` directory or elsewhere) to `~/.config/nvim/`, you're telling Neovim to treat the linked files as its configuration.  
```
ln -s path/to/your/.dotfiles/nvim .config/nvim
```


The nvim folder is meant to have a symlink in the .config file in the Linux home