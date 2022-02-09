!#/bin/sh

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
sudo apt install -y lua5.3
sudo apt install -y fzf
sudo apt install -y bat
sudo apt install -y ruby
sudo apt install -y neovim

