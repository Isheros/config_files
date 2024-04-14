
other-conf () {
  # No pass on sudo
  echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$USER
  
  # Update and install needed packages
  sudo apt update -y
  sudo apt upgrade -y
  sudo apt install zsh tmux curl wget gh ninja-build gettext cmake net-tools wireguard wireguard-tools -y
  
  # FZF
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install

  # pyenv
  curl https://pyenv.run | bash
}

nvim-build () {
  git clone https://github.com/neovim/neovim
  cd neovim
  git checkout stable
  
  # To build NVIM
  sudo apt install ninja-build gettext cmake unzip curl build-essential -y
  make CMAKE_BUILD_TYPE=Release

  cd build
  cpack -G DEB
  sudo apt install ./nvim-linux64.deb
  cd ../..
}

nvim-download () {
  arch=$(dpkg --print-architecture)
  if [ arch == arm64 ]; then
    wget https://github.com/noo0nee/config_files/raw/master/nvim_0.9.5_arm64.deb -O ./nvim.deb
  else
    wget https://github.com/noo0nee/config_files/raw/master/nvim_0.9.5_amd64.deb -O ./nvim.deb
  fi
  
  sudo apt install ./nvim.deb -y
}

nvim-conf () {
  while true; do
    read -p "Build neovim from source?[[y]/n]" yn
  
    case $yn in 
	    [yY] ) echo "Building neovim...";
		    nvim-build
        break;;
	    [nN] ) echo "Downloading from repo...";
		    nvim-download
        break;;
	    * ) echo invalid response;;
    esac
  done
  
  git clone https://github.com/NvChad/starter ~/.config/nvim
}

zsh-conf () {
  # Oh-my-zhs
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
  # Highlight
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
  # Material Shell
  curl -L -so ~/.oh-my-zsh/custom/themes/materialshell.zsh-theme https://raw.githubusercontent.com/carloscuesta/materialshell/master/materialshell.zsh

  wget https://github.com/noo0nee/config_files/raw/master/.zshrc -O ~/.zshrc -O ~/.zshrc
}

# wg-conf () {
#    while true; do
#     read -p "Configure Wireguard? [[y]n]" yn
  
#     case $yn in 
# 	    [yY] ) echo "Configuring WireGuard";
# 	      (umask 077 && wg genkey > wg-private-client.key)
#         wg pubkey < wg-private-client.key > wg-public-client.key
# 	    [nN] ) echo "Downloading from repo...";
#         break;;
# 	    * ) echo invalid response;;
#     esac
#   done
#  }


other-conf
nvim-conf
zsh-conf
