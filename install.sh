#!/bin/bash
OS=$(awk -F= '/^NAME/{print $2}' /etc/os-release)

OS=$(echo "$OS" | tr -d '"' )
case $OS in
 "Ubuntu")
 echo 'Updating apt..'
 sudo apt upgrade -y 

 echo 'Installing zsh and oh-my-zsh'
 sudo apt install zsh tmux curl wget -y

 echo 'Installing neovim'
 wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
 sudo apt install ./nvim-linux64.deb
 
 ;;
  "Arch")
  echo 'Updating Pacman'
  sudo pacman -Sy

  echo 'Installing Zsh and oh-my-zsh'
  sudo pacman -S zsh
  sudo pacman -S curl
#fi
  ;;
esac
# ZSH config
cp -rv .zshrc ~
# Material Shell ZSH
curl -L -so ~/.oh-my-zsh/custom/themes/materialshell.zsh-theme https://raw.githubusercontent.com/carloscuesta/materialshell/master/materialshell.zsh

# Highlight
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Neovim config
echo 'Copying config..'
cp -rvf .config ~
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall

echo "Config zsh"
sudo chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

