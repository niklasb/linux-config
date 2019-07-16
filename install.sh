#!/bin/bash
set -e

cd ~

if which apt-get; then
  sudo apt-get update -y
  sudo apt-get install -y curl git vim exuberant-ctags zsh gdb silversearcher-ag \
    python-minimal python-virtualenv python-pip \
    python3-minimal python3-virtualenv python3-pip
elif which pacman; then
  sudo pacman -Sy gvim python python2 python-pip python2-pip ctags gdb curl git \
    python2-virtualenv python-virtualenv
else
  echo >&2 "Neither pacman nor apt-get found"
fi

#sudo pip3 install keystone-engine

#git clone https://github.com/niklasb/linux-config

# SSH
if [ ! -d .ssh ]; then
  mkdir .ssh
  chmod 700 .ssh
fi
curl https://github.com/niklasb.keys >> .ssh/authorized_keys

# Git
git config --global user.name "Niklas Baumstark"
git config --global user.email niklas.baumstark@gmail.com
git config --global push.default simple

# Vim
git clone https://github.com/niklasb/vimrc
cd vimrc
git submodule update --init
cd ~
ln -s ~/vimrc/vimrc .vimrc
ln -s ~/vimrc/vim .vim

# NVM
git clone https://github.com/lukechilds/zsh-nvm.git ~/.zsh-nvm

# zsh
ln -s ~/linux-config/zshrc .zshrc
sudo chsh -s /bin/zsh $(whoami)

# GDB
git clone https://github.com/niklasb/gdbinit
cd gdbinit
./setup.sh
cd ~

# tmux
if [ ! -d ~/tmux-yank ]; then
  git clone https://github.com/tmux-plugins/tmux-yank ~/tmux-yank
fi
chmod +x ~/tmux-yank/yank.tmux  # should not be necessary
ln -sf ~/linux-config/tmux.conf ~/.tmux.conf
