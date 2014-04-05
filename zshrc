# Modify the prompt to contain git branch name
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo " [%{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}]"
  fi
}
setopt promptsubst
export PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%~%{$reset_color%}$(git_prompt_info) %{$fg[blue]%}➜ %{$reset_color%}'

# Include custom completion functions
fpath=(~/.zsh/completion $fpath)

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
setopt histignoredups
setopt histreduceblanks
HISTFILE=~/.zsh_history
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

# Speed up Ruby tests
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

# Set up PATH
export PATH="$HOME/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/local/share/npm/bin"

# Include aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Include custom config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Auto-attach/create tmux session
if [[ "$TERM" != 'screen-256color' ]] then
  if ! tmux has-session -t "$USER"; then
    tmux new-session -s "$USER" -d
  fi
  tmux attach -t "$USER"
fi
