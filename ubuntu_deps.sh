#!/bin/sh

sudo apt update && sudo apt -y upgrade

sudo apt install -y fish grc lua5.3 fzf bat ruby neovim ripgrep direnv nodejs yarn npm golang
EXA_VERSION=$(curl -s "https://api.github.com/repos/ogham/exa/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
curl -Lo exa.zip "https://github.com/ogham/exa/releases/latest/download/exa-linux-x86_64-v${EXA_VERSION}.zip"
sudo unzip -q exa.zip bin/exa -d /usr/local
go install github.com/x-motemen/ghq@latest

sudo usermod --shell $(which fish) $USER

$HOME/go/bin/ghq get http://github.com/willarentz/dotfiles

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
fish