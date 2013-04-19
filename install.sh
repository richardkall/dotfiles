#!/bin/bash

# dotfiles folder
DIR=~/.dotfiles

# Backup folder
BACKUP_DIR=~/.dotfiles_old

# List of files & folders to symlink
FILES=".zshrc .zshenv .gitconfig .powconfig .tmuxinator .tmux.conf .oh-my-zsh/custom .oh-my-zsh/themes/richard.zsh-theme .ssh"
#files="bashrc vimrc vim zshrc oh-my-zsh"

# Create backup folder
echo "Creating $BACKUP_DIR for backup of any existing dotfiles..."
mkdir -p $BACKUP_DIR
echo "...done!"

# Change to the dotfiles folder
echo "Changing to the $DIR folder..."
cd $DIR
echo "...done!"

# Move/backup existing dotfiles then create symlinks
for FILE in $FILES; do
  echo "Backing up $FILE from ~ to $BACKUP_DIR..."
  mv ~/$FILE $BACKUP_DIR
  echo "...done!"
  echo "Creating symlink to $FILE in home directory..."
  ln -s $DIR/$FILE ~/$FILE
  echo "...done!"
done
