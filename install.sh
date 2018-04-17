#!/bin/bash

# exit upon error
set -e -x

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

# optional, won't stop running
./install_neovim.sh && nvim +PlugInstall +qall || echo nvim and vim-plug not installed

# read .zshrc and install
zsh -i -c exit 0

echo -e "Finish installing, run this to make zsh the default:\nchsh -s $(which zsh)"
