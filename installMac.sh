#!/bin/bash

# Hombrew
#echo 'Installing Homebrew'
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# ZSH and Oh my ZSH
#echo 'Installing Zsh and oh-my-zsh'
#brew install zsh
#chsh -s /usr/local/bin/zsh
#compaudit | xargs chmod g-w,o-w /usr/local/share/zsh/
#compaudit | xargs chmod g-w,o-w /usr/local/share/zsh/site-functions
#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Oh-my-zsh config
cp -rv .zshrc ~

# Material Shell ZSH
curl -L -o ~/.oh-my-zsh/custom/themes/materialshell.zsh-theme https://raw.githubusercontent.com/carloscuesta/materialshell/master/materialshell.zsh


# echo 'Installing terminator'
# sudo pacman -S terminator

# Vim config 
cp -rv .vimrc ~
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

#echo 'Copying dotfiles for i3, termninator, ranger, gtk'
#cp -rv .config ~

#echo 'Copying dotfiles profile, and Static files'
#cp -rv Static ~
#cp -rv .profile ~

