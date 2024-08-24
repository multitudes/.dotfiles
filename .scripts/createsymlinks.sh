#!/bin/bash
# This script creates symlinks to the .docker folder on goinfre
# because the goinfre storage is deleted regularly
# and the .docker folder is too big to be stored in the home directory
# therefore everytime I log in I need to recreate the symlink
rm -rf ~/.docker
mkdir -p ~/goinfre/.docker
ln -sf ~/goinfre/.docker ~/.docker
ls -l ~/.docker
