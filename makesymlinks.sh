#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
#
# Taken from: http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
############################

# Variables

dir=~/Documents/Projects/Dotfiles                             # dotfiles directory
olddir=~/Documents/Projects/Dotfiles/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc zshrc tmux.conf gitconfig emacs profile gitignore oh-my-zsh/lib/aliases.zsh oh-my-zsh/oh-my-zsh.sh oh-my-zsh/themes/minimal.zsh-theme"    # list of files/folders to symlink in homedir

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
  echo "Moving any existing dotfiles from ~ to $olddir"
  mv ~/.$file $olddir
  echo "Creating symlink to $file in home directory."
  ln -s $dir/.$file ~/.$file
done
