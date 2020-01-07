
# dotfiles [![Build Status](https://travis-ci.org/Gnnng/dotfiles.svg?branch=master)](https://travis-ci.org/Gnnng/dotfiles)


## Installation

```bash
cd $HOME
git clone https://github.com/Gnnng/dotfiles
cd dotfiles
cp -f sparse-checkout .git/info/sparse-checkout
git config --local core.sparseCheckout true
git config --local status.showUntrackedFiles no
    
alias dotfiles='git --git-dir $HOME/dotfiles/.git --work-tree=$HOME'
dotfiles checkout master
```
