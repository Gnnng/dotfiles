#!/bin/bash

set -x -e

sudo apt-get update

# to use add-apt-repository
sudo apt-get install -y software-properties-common python-software-properties

# use https version
# sudo apt-get install -y apt-transport-https
# echo "deb https://ppa.launchpad.net/neovim-ppa/stable/ubuntu xenial main" | sudo tee -a /etc/apt/sources.list.d/neovim.list
# echo "deb-src https://ppa.launchpad.net/neovim-ppa/stable/ubuntu xenial main" | sudo tee -a /etc/apt/sources.list.d/neovim.list

sudo add-apt-repository -y ppa:neovim-ppa/unstable

sudo apt-get update
sudo apt-get install -y neovim python-dev python-pip python3-dev python3-pip

pip install neovim
pip3 install neovim



