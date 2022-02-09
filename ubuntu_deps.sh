!#/bin/sh

sudo apt update
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
sudo apt install -y lua5.3 fzf bat ruby neovim ripgrep direnv
