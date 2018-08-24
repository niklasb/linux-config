#!/bin/bash
set -e

cd ~

sudo apt install curl git vim exuberant-ctags zsh gdb silversearcher-ag \
  python-minimal python-virtualenv python-pip \
  python3-minimal python3-virtualenv python3-pip
git clone https://github.com/niklasb/linux-config

# SSH
if [ ! -e .ssh ]; then
  mkdir .ssh
  curl https://github.com/niklasb.keys >> .ssh/authorized_keys
fi

# Git
git config --global user.name "Niklas Baumstark"
git config --global user.email niklas.baumstark@gmail.com

# Vim
git clone https://github.com/niklasb/vimrc
cd vimrc
git submodule update --init
cd ~
ln -s ~/vimrc/vimrc .vimrc
ln -s ~/vimrc/gvimrc .gvimrc
ln -s ~/vimrc/vim .vim

# NVM
curl -o-  https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

# zsh
ln -s ~/linux-config/zshrc .zshrc
sudo chsh -s /bin/zsh $(whoami)

# GDB
git clone https://github.com/niklasb/gdbinit
cd gdbinit
./setup.sh
cd ~
