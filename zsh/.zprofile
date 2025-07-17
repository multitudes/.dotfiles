# Create symlinks when logging in, but only on Linux systems
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Only needed for 42 Berlin computers
    ~/.dotfiles/scripts/createsymlinks.sh
fi