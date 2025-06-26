# bash profile executes automatically when you log in
# —that is, they apply only to your login shell

# create tne simlinks between the dotfiles and the home directory
# Create symlinks when logging in, but only on Linux systems
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Only needed for 42 Berlin computers
    ~/.dotfiles/scripts/createsymlinks.sh
fi

# if there is a .bashrc file in the home directory, source it
if [ -f "$HOME/.bashrc" ]
then
  source "$HOME/.bashrc"
fi