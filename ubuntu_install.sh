#!/bin/bash

dotfiles_dir=$HOME/dotfiles

# prerequisite
packages="build-essential pkg-config curl git python-setuptools ruby stow zsh tmux"
sudo apt-get update && sudo apt-get install -y $packages

# install linuxbrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >> ~/.zshrc_local
echo 'export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"' >> ~/.zshrc_local
echo 'export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"' >> ~/.zshrc_local
export PATH="$HOME/.linuxbrew/bin:$PATH"

################# For Vim 8.0+
brew install vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

brew install autojump

# clone antigen
antigen_dir=$dotfiles_dir/antigen
git clone https://github.com/zsh-users/antigen.git $antigen_dir
chsh -s $(which zsh)

# finall, stow them all
stow_packages="antigen-zsh vim tmux git"
stow $stow_packages
