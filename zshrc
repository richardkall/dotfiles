# Set locale
export LANG=sv_SE.UTF-8

# Use Pure (github.com/sindresorhus/pure)
autoload -U promptinit && promptinit
prompt pure

# Use autocomplete
autoload -U compinit
compinit -C
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Makes color constants available
autoload -U colors
colors

# Increase history
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# Enable extended globbing
setopt extendedglob

# Allow []
unsetopt nomatch

# Enable colored output from ls, etc.
export CLICOLOR=1

# Use vim as editor
export EDITOR=vim
export VISUAL=$EDITOR

# Enable syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Initialize nvm
export NVM_DIR=$HOME/.nvm
source $NVM_DIR/nvm.sh

# Load custom functions
for function in ~/.zsh/functions/*; do
  source $function
done

# Load aliases
[[ -f $HOME/.aliases ]] && source $HOME/.aliases

# Load local zshrc
[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local
