#################### antigen configuration
source $HOME/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh


# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git-extras
antigen bundle colored-man-pages
antigen bundle aws
antigen bundle autojump
antigen bundle pip
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

# Load the theme.
antigen theme ys

# Tell Antigen that you're done.
antigen apply

################### user configuration
[ -f ~/.zshrc_local ] && source ~/.zshrc_local
