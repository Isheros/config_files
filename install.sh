#!/bin/bash
echo 'Updating Pacman'
sudo pacman -Sy

echo 'Installing Zsh and oh-my-zsh'
sudo pacman -S zsh
sudo pacman -S curl
chsh -s $(which zsh)
# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp -rv .zshrc ~
# Material Shell ZSH
curl -L -o ~/.oh-my-zsh/custom/themes/materialshell.zsh-theme https://raw.githubusercontent.com/carloscuesta/materialshell/master/materialshell.zsh

echo 'Installing terminator'

sudo pacman -S terminator

echo 'Installing i3'

sudo pacman -S i3-wm i3blocks dmenu 

echo 'Installing vim'

sudo pacman -S vim

cp -rv .vimrc ~
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo 'Copying dotfiles for i3, termninator, ranger, gtk'
cp -rv .config ~

echo 'Copying dotfiles profile, and Static files'
cp -rv Static ~
cp -rv .profile ~

