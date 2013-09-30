export PATH="$HOME/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/local/share/npm/bin"

# Initialize autocomplete
autoload -U compinit
compinit -C

# Initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi

source $HOME/.zsh/config.zsh
source $HOME/.zsh/prompt.zsh
source $HOME/.zsh/aliases.zsh

# Auto-attach/create tmux session
if [[ "$TERM" != "screen-256color" ]] then
  if ! tmux has-session -t "$USER"; then
    tmux new-session -s "$USER" -d
  fi
  tmux attach -t "$USER"
fi
