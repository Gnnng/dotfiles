#!/bin/bash


sudo apt-get install -y apt-transport-https
echo "deb https://ppa.launchpad.net/neovim-ppa/stable/ubuntu xenial main" | sudo tee -a /etc/apt/sources.list.d/neovim.list
echo "deb-src https://ppa.launchpad.net/neovim-ppa/stable/ubuntu xenial main" | sudo tee -a /etc/apt/sources.list.d/neovim.list

sudo apt-get update
sudo apt-get install -y neovim
sudo apt-get install -y python-dev python-pip python3-dev python3-pip

sudo pip install neovim
sudo pip3 install neovim



