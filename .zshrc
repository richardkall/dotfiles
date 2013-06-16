export PATH="$HOME/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"
export DOTFILES=$HOME/.dotfiles

# Initialize autocomplete
autoload -U compinit
compinit

# Initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi

# Intialize tmuxinator
[ -s $HOME/.tmuxinator/scripts/tmuxinator ] && source $HOME/.tmuxinator/scripts/tmuxinator

source $DOTFILES/.zsh/config.zsh
source $DOTFILES/.zsh/prompt.zsh
source $DOTFILES/.zsh/aliases.zsh
