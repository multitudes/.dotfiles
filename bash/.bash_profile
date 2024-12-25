# bash profile executes automatically when you log in
# —that is, they apply only to your login shell

# create tne simlinks between the dotfiles and the home directory
~/.scripts/createsymlinks.sh

# if there is a .bashrc file in the home directory, source it
if [ -f "$HOME/.bashrc" ]
then
  source "$HOME/.bashrc"
fi