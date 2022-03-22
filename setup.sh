#!/bin/sh

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
if [ -d $HOME/.config ]
then
  echo ".config exists"
else
  echo "making: .config"
  mkdir $HOME/.config
fi
cp `pwd`/.vim $HOME/.vim
cp `pwd`/.vimrc $HOME/.vimrc
cp `pwd`/.tmux.conf $HOME/.tmux.conf
cp `pwd`/.tmux.powerline.conf $HOME/.tmux.powerline.conf
cp -R `pwd`/.config/fish $HOME/.config/fish
cp -R `pwd`/.config/nvim $HOME/.config/nvim
cp -R `pwd`/.config/peco $HOME/.config/peco
cp -R `pwd`/.config/tmux $HOME/.config/tmux
cp -R `pwd`/.config/vim $HOME/.config/vim

sleep 1
echo 'Installing fisher plugins'
# installing fisher plugins

#fisher install jorgebucaran/fisher
#fisher install eth-p/fish-plugin-sudo
#fisher install takashabe/fish-fzf
#fisher install decors/fish-ghq
fisher install barnybug/docker-fish-completion
