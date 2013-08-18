# Config files
alias aliases='vim $DOTFILES/.zsh/aliases.zsh'
alias vimrc='vim $DOTFILES/.vimrc'

# Unix/OS X
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias e=$EDITOR

# Folders
alias desktop='cd ~/Desktop'
alias dotfiles='cd $DOTFILES'
alias home='cd ~'
alias sites='cd ~/Sites'

# Flush DNS cache
alias flushdns='dscacheutil -flushcache'

# Show/hide hidden files
alias showhidden='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'

# Tmux/tmuxinator
alias tn='tmux new-session -s'
alias ta='tmux attach -t'
alias ts='tmux switch -t'
alias tls='tmux ls'
alias tm='tmuxinator'
alias tmn='tmuxinator new'
alias tmo='tmuxinator open'
alias tmc='tmuxinator copy'
alias tml='tmuxinator list'
alias tmd='tmuxinator delete'

# Git
alias g=git
alias gs='git status -sb'
alias ga='git add'
alias gc='git commit'
alias gca='git commit --amend'
alias gb='git branch'
alias go='git checkout'
alias gl='git log'
alias gd='git diff'
alias gp='git push'
alias gm='git merge'

# Bundler
alias b=bundle

# Tests/specs
alias r='zeus rake RAILS_ENV=test'
alias s='zeus rspec'
alias c='zeus cucumber RAILS_ENV=test'
alias cw='zeus cucumber --profile=wip RAILS_ENV=test'
alias cs='zeus cucumber --profile=slow RAILS_ENV=test'

# Rails
alias z=zeus
alias m='zeus rake db:migrate && zeus rake db:rollback && zeus rake db:migrate && zeus rake db:migrate RAILS_ENV=test && zeus rake db:test:prepare'
alias rb='zeus rake db:rollback'
