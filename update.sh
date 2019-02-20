#!/bin/zsh
echo 'Downloading Material Shell ZSH theme'
curl -L -o ~/.oh-my-zsh/custom/themes/materialshell.zsh-theme https://raw.githubusercontent.com/carloscuesta/materialshell/master/materialshell.zsh
echo 'Updating dotfiles'
cp -v .vimrc ~
cp -v .zshrc ~
vim +PluginInstall +qall
