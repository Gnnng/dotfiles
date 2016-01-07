#!/bin/bash

# This script creates symlinks

########## Variables

dir=~/dotfiles                      # dotfiles directory
olddir=~/dotfiles_old               # old dotfiles backup directory
files="
vimrc
zshrc
ycm_extra_conf.py
tmux.conf
gitconfig
gitignore_global
"                                   # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    mv ~/.$file ~/dotfiles_old/
    ln -s $dir/$file ~/.$file
done
