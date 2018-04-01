#!/bin/bash

# exit upon error
set -e

# make sure git is available
which git

# shallow clone the submodules
git submodule update --init --depth 1

# TODO: conditional installation for ubuntu
apt_packages="build-essential pkg-config curl python-setuptools ruby stow zsh tmux cscope ctags vim silversearcher-ag cmake"
sudo apt-get update && sudo apt-get install -y $apt_packages

# finall, stow them all
stow_packages="zsh vim neovim tmux git gdb"
stow $stow_packages

# read .vimrc and install
vim +PlugInstall +qall

# read .zshrc and install
zsh -i -c exit

echo -e "Finish installing, run this to make zsh the default:\nchsh -s $(which zsh)"
