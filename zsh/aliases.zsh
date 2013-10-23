# Config files
alias aliases='vim $DOTFILES/zsh/aliases.zsh'
alias vimrc='vim $DOTFILES/vimrc'

# Unix/OS X
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias e=$EDITOR

# Folders
alias desktop='cd ~/Desktop'
alias dotfiles='cd ~/.dotfiles'
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
alias r='rake RAILS_ENV=test'
alias s='rspec'
alias http='noglob http'

# Rails
alias m='rake db:migrate && rake db:migrate RAILS_ENV=test'
alias rb='rake db:rollback && rake db:rollback RAILS_ENV=test'
