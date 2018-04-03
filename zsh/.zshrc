source ~/dotfiles/.repo/zplug/init.zsh

# plugins
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "plugins/z", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "so-fancy/diff-so-fancy", as:command, use:diff-so-fancy
zplug "zsh-users/zsh-autosuggestions", defer:1
zplug "zsh-users/zsh-completions", use:"*.plugin.zsh"
zplug "zsh-users/zsh-syntax-highlighting", use:"*.plugin.zsh", defer:3
zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load

# machine-specific zshrc
[ -f ~/.zshrc_local ] && source ~/.zshrc_local
