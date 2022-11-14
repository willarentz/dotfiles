#!/usr/bin/bash

sudo apt update && sudo apt -y upgrade

sudo apt install -y fish grc lua5.3 fzf bat ruby neovim direnv nodejs yarn npm golang mosh colordiff
EXA_VERSION=$(curl -s "https://api.github.com/repos/ogham/exa/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
curl -Lo exa.zip "https://github.com/ogham/exa/releases/latest/download/exa-linux-x86_64-v${EXA_VERSION}.zip"
sudo unzip -q exa.zip bin/exa -d /usr/local
go install github.com/x-motemen/ghq@latest
sudo ln -s $(which batcat) /usr/bin/bat

RELEASE=$(lsb_release -sr)
if [[ "$RELEASE" == "20.04" ]]; then
    RIPGREP_VERSION=$(curl -s "https://api.github.com/repos/BurntSushi/ripgrep/releases/latest" | grep -Po '"tag_name": "\K[0-9.]+')
    curl -Lo ripgrep.deb "https://github.com/BurntSushi/ripgrep/releases/latest/download/ripgrep_${RIPGREP_VERSION}_amd64.deb"
    sudo apt install -y ./ripgrep.deb
    rm -f ripgrep.deb
else
    sudo apt install -y ripgrep
fi


sudo usermod --shell $(which fish) $USER

$HOME/go/bin/ghq get http://github.com/willarentz/dotfiles
sudo ln -s /usr/bin/batcat /usr/bin/bat

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $HOME/miniconda3_linux.sh
fish
