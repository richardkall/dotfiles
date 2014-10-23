# Use Pure (github.com/sindresorhus/pure)
fpath=(/usr/local/share/zsh/site-functions $fpath)
autoload -U promptinit && promptinit
prompt pure

# Use autocomplete
autoload -U compinit
compinit -C
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Include custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# Make color constants available
autoload -U colors
colors

# Enable colored output from ls, etc
export CLICOLOR=1

# Save tons of history
setopt hist_ignore_all_dups
setopt inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# Enable extended globbing
setopt extendedglob

# Allow []
unsetopt nomatch

# Act like Vim
bindkey -v
bindkey jj vi-cmd-mode

# Use Vim as visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# Load rbenv if available
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi

# Load NVM
source $(brew --prefix nvm)/nvm.sh' 1

# Speed up Ruby tests
export RUBY_GC_HEAP_INIT_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

# Set up PATH
export PATH="$HOME/.bin:$HOME/.rbenv/shims:/usr/local/lib/node_modules:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/local/share/npm/bin"

# Include aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Include custom config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
