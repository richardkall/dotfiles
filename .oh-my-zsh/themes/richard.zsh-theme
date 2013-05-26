precmd() {
   print -rP '$fg[cyan]$(get_pwd)$(git_prompt_info)'
}

PROMPT='$reset_color→ '

function get_pwd() {
   echo "${PWD/$HOME/~}"
}

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo " $fg[green]$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")$reset_color"
