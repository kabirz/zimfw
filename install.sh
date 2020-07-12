
[-f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.bak
mkdir ~/.zim/
cp zimfw.sh ~/.zim
ln -s `pwd`/zshenv ~/.zshenv
ln -s `pwd`/zshrc ~/.zshrc
ln -s `pwd`/zlogin ~/.zlogin
ln -s `pwd`/zimrc ~/.zimrc
pushd ~
zsh ~/.zim/zimfw.zsh install
popd

