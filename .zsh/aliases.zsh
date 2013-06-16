# ZSH
alias config='vim $DOTFILES/.zsh/config.zsh'
alias aliases='vim $DOTFILES/.zsh/aliases.zsh'

# Unix/OS X
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias e=$EDITOR
alias cl='clear'

# Folders
alias dotfiles='cd $DOTFILES'
alias home='cd ~'
alias sites='cd ~/Sites'
alias desktop='cd ~/Desktop'

# Flush DNS cache
alias flushdns='dscacheutil -flushcache'

# Show/hide hidden files
alias showhidden='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'

# Tmux
alias n='tmux new-sessions -s'
alias a='tmux attach -t'
alias s='tmux switch -t'
alias tl='tmux ls'

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

# Bundler
alias b=bundle

# Tests/specs
alias r='zeus rake RAILS_ENV=test'
alias s='zeus rspec'
alias c='zeus cucumber'
alias cw='zeus cucumber --profile=wip'
alias cs='zeus cucumber --profile=slow'

# Rails
alias m='rake db:migrate && rake db:rollback && rake db:migrate && rake db:test:prepare'
alias z=zeus
