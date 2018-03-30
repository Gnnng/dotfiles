#!/bin/bash

# prerequisite
packages="build-essential pkg-config curl git python-setuptools ruby stow zsh tmux cscope ctags vim silversearcher-ag"
sudo apt-get update && sudo apt-get install -y $packages

# package mananer for vim: Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# package manager for zsh: antigen
git clone https://github.com/zsh-users/antigen.git ~/dotfiles/antigen

# finall, stow them all
stow_packages="antigen-zsh vim tmux git gdb"
stow $stow_packages

# read .vimrc and install
vim +PluginInstall +qall

# read .zshrc and install
zsh

echo "Run this to switch to zsh: chsh -s \$(which zsh)"
