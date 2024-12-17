#!/bin/zsh
set -e

[ -d ~/.zim ]  || mkdir ~/.zim/
wget https://raw.githubusercontent.com/zimfw/zimfw/refs/heads/master/zimfw.zsh -O ~/.zim/zimfw.zsh
if [[ $? != 0 ]]; then
  cp `pwd`/zimfw.zsh ~/.zim
fi
[ -e ~/.zshenv ] || ln -s `pwd`/zshenv ~/.zshenv
[ -e ~/.zlogin ] || ln -s `pwd`/zlogin ~/.zlogin
[ -e ~/.zimrc ] || ln -s `pwd`/zimrc ~/.zimrc
pushd ~
zsh ~/.zim/zimfw.zsh install
popd

echo "source `pwd`/zshrc" >> ~/.zshrc
dircolors -p >~/.dir_colors
