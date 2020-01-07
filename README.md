
# dotfiles [![Build Status](https://travis-ci.org/Gnnng/dotfiles.svg?branch=master)](https://travis-ci.org/Gnnng/dotfiles)


## Installation

```bash
git clone --bare https://github.com/Gnnng/dotfiles $HOME/.dotfiles
cat <<EOF > $HOME/.dotfiles/info/sparse-checkout
.*
!.travis.yml
EOF
alias dotfiles='git --git-dir $HOME/.dotfiles --work-tree=$HOME'
dotfiles config --local core.sparseCheckout true
dotfiles config --local status.showUntrackedFiles no
```
