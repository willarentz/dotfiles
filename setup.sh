#!/bin/bash

echo 'Backing up old settings'
# first create a backup
FILE=$HOME/dotfile_backup_`date '+%d%m%y-%H:%M'`.tar.gz
tar zcvpf $FILE $HOME/.vim $HOME/.vimrc $HOME/.tmux.conf $HOME/.tmux.powerline.conf 

echo 'Erasing old settings'

# erase current settings
rm -f $HOME/.vim
rm -f $HOME/.vimrc
rm -f $HOME/.tmux.conf
rm -f $HOME/.tmux.powerline.conf
rm -Rf $HOME/.config/fish
rm -Rf $HOME/.config/nvim
rm -Rf $HOME/.config/peco
rm -Rf $HOME/.config/tmux
rm -Rf $HOME/.config/vim

echo 'Installing settings'
# Install by copying the files
mkdir $HOME/.config
cp -v `pwd`/.vim $HOME/.vim
cp -v `pwd`/.vimrc $HOME/.vimrc
cp -v `pwd`/.tmux.conf $HOME/.tmux.conf
cp -v `pwd`/.tmux.powerline.conf $HOME/.tmux.powerline.conf
cp -Rv `pwd`/.config/fish $HOME/.config/fish
cp -Rv `pwd`/.config/nvim $HOME/.config/nvim
cp -Rv `pwd`/.config/peco $HOME/.config/peco
cp -Rv `pwd`/.config/tmux $HOME/.config/tmux
cp -Rv `pwd`/.config/vim $HOME/.config/vim

sleep 1
echo 'Installing fisher plugins'
# installing fisher plugins

fisher install jorgebucaran/fisher
fisher install eth-p/fish-plugin-sudo
fisher install takashabe/fish-fzf
fisher install decors/fish-ghq
fisher install barnybug/docker-fish-completion
