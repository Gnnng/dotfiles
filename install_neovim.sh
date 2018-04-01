#!/bin/bash

sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim
sudo apt-get install -y python-dev python-pip python3-dev python3-pip

sudo pip install neovim
sudo pip3 install neovim



