export EDITOR=vim
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

# Speed up Ruby tests
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

# Use vi mode
bindkey -v

# Disable autocorrect
unsetopt correct
unsetopt correct_all

# Expand commands
setopt PROMPT_SUBST

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
