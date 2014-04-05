# Use autocomplete
autoload -U compinit
compinit -C

# Include functions
for function in ~/.zsh/functions/*; do
  source $function
done

# Load rbenv if available
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi

# Use Vim as visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# Disable autocorrect
unsetopt correct
unsetopt correct_all

# Enable extended globbing
setopt extendedglob

# Allow []
unsetopt nomatch

# Act like Vim
bindkey -v
bindkey jj vi-cmd-mode

# Speed up Ruby tests
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

# Ignore duplicates and blanks in history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

# Save tons of history
HISTSIZE=1000
SAVEHIST=1000

# Disable autosetting Terminal title
DISABLE_AUTO_TITLE=true

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Load aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Load local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
