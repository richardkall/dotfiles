ZSH=$HOME/.oh-my-zsh
ZSH_THEME="richard"

DISABLE_AUTO_UPDATE=true
DISABLE_AUTO_TITLE=true
unsetopt correct_all

plugins=(git github copydir extract gem heroku history pow terminalapp sublime)
source $ZSH/oh-my-zsh.sh

alias ..='cd ..'
alias ...='cd ..; cd ..'
alias sites='cd ~/Sites'
alias desktop='cd ~/Desktop'

alias showhidden='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'

alias v='vim'
alias m='mux'
alias b='bundle'
alias migrate='rake db:migrate && rake db:test:prepare'
alias z='zeus'
alias zr='zeus rake'
alias zs='zeus rspec'
alias zc='zeus cucumber'
alias zcw='zeus cucumber --profile=wip'
alias zra='zeus rake RAILS_ENV=test'

alias ssh:ec2='ssh -i ~/.ssh/richard-ec2.pem ec2-user@46.137.173.29'

if [ "$TMUX" = "" ]; then tmux; fi

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin

[ -s $HOME/.tmuxinator/scripts/tmuxinator ] && source $HOME/.tmuxinator/scripts/tmuxinator
export EDITOR='vim'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
