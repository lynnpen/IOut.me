#!/bin/bash

# Required:
# - git
# - git@github.com:JackonYang/vimrc.git

set -e

# env clean
rm -rf ~/.vim

# install
sudo apt-get -y install vim-gtk exuberant-ctags  # vim and ctags

# vimrc
git clone git@github.com:JackonYang/vimrc.git ~/.vim
cd ~/.vim
./install.sh
