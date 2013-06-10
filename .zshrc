ZSH=$HOME/.oh-my-zsh
ZSH_THEME="richard"

DISABLE_AUTO_UPDATE=true
DISABLE_AUTO_TITLE=true
unsetopt correct_all

plugins=(git github extract gem heroku history pow sublime)
source $ZSH/oh-my-zsh.sh

# Fix slow Git autocomplete
__git_files () {
  _wanted files expl 'local files' _files
}

alias ..='cd ..'
alias ...='cd ..; cd ..'
alias home='cd ~/Sites'
alias sites='cd ~/Sites'
alias desktop='cd ~/Desktop'

alias showhidden='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'

alias h='noglob http'
alias m='mux'
alias b='bundle'
alias migrate='rake db:migrate && rake db:migrate RAILS_ENV=test'

alias z='zeus'
alias zr='zeus rake'
alias zs='zeus rspec'
alias zc='zeus cucumber'
alias zw='zeus cucumber --profile=wip'
alias zslow='zeus cucumber --profile=slow'
alias za='zeus rake RAILS_ENV=test'

alias tn='tmux new-session -s'
alias ta='tmux attach -t'
alias ts='tmux switch -t'
alias tls='tmux ls'

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin

[ -s $HOME/.tmuxinator/scripts/tmuxinator ] && source $HOME/.tmuxinator/scripts/tmuxinator
export EDITOR='vim'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
