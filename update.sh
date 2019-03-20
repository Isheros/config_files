#!/bin/zsh
echo 'Updating Vim and ZSH dotfiles...'
cp -v .vimrc ~
cp -v .zshrc ~
vim +PluginInstall +qall
echo 'Updating .config dir...'
cp -vr .config ~
echo 'Copying Static folder...'
cp -vr Static ~
