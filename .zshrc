# Add Homebrew path
export PATH="/opt/homebrew/bin:$PATH"

# Use Pure (github.com/sindresorhus/pure)
fpath+=/opt/homebrew/share/zsh/site-functions
autoload -U promptinit && promptinit
prompt pure

# Use autocomplete
autoload -U compinit
compinit -C
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Make color constants available
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
[[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Initialize fnm
eval "$(fnm env)"

# Load custom functions
for function in ~/.dotfiles/zsh/functions/*; do
  source $function
done

# Load aliases
[[ -f $HOME/.aliases ]] && source $HOME/.aliases

# Load local zshrc
[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local
