#!/bin/bash
set -e

cd ~

sudo apt install curl git vim exuberant-ctags zsh gdb python-minimal
git clone https://github.com/niklasb/linux-config

# SSH
if [ ! -e .ssh ]; then
  mkdir .ssh
fi
curl https://github.com/niklasb.keys >> .ssh/authorized_keys

# Git
git config --global user.name "Niklas Baumstark"
git config --global user.email niklas.baumstark@gmail.com

# Vim
git clone https://github.com/niklasb/vimrc
cd vimrc
git submodule update --init
cd ~
ln -s ~/vimrc/vimrc .vimrc
ln -s ~/vimrc/vim .vim

# zsh
ln -s ~/linux-config/zshrc .zshrc

# GDB
git clone https://github.com/niklasb/gdbinit
cd gdbinit
./setup.sh
cd ~
