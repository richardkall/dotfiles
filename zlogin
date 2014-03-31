# Adds the current branch name in green
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo " [%{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}]"
  fi
}

# Makes color constants available
autoload -U colors
colors

# Enable colored output
export CLICOLOR=1

# Expand functions in the prompt
setopt promptsubst

# Prompt
export PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%~%{$reset_color%}$(git_prompt_info) %{$fg[blue]%}➜ %{$reset_color%}'

# Auto-attach/create tmux session
if [[ "$TERM" != 'screen-256color' ]] then
  if ! tmux has-session -t "$USER"; then
    tmux new-session -s "$USER" -d
  fi
  tmux attach -t "$USER"
fi

export PATH="$HOME/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/local/share/npm/bin"

# Load local config
[[ -f ~/.zlogin.local ]] && source ~/.zlogin.local
