#!/bin/zsh
set -e

[ -e ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.old$$
[ -d ~/.zim ]  || mkdir ~/.zim/
cp `pwd`/zimfw.zsh ~/.zim
[ -e ~/.zshenv ] || ln -s `pwd`/zshenv ~/.zshenv
[ -e ~/.zlogin ] || ln -s `pwd`/zlogin ~/.zlogin
[ -e ~/.zimrc ] || ln -s `pwd`/zimrc ~/.zimrc
pushd ~
zsh ~/.zim/zimfw.zsh install
popd

ln -s `pwd`/zshrc ~/.zshrc
dircolors -p >~/.dir_colors
