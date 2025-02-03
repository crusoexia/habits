#!/bin/bash

set -e

# vars
declare HABITS_HOME=~/habits

# update apt
sudo apt -y update

# install zsh if it doesn't exists
if ! command -v zsh &> /dev/null; then
    sudo apt install -y zsh
    source ~/.bashrc
fi

# check preconditions
git --version
zsh --version

# git global config
cd ~
rm -f .gitconfig
ln -s "$HABITS_HOME/configs/.gitconfig-personal" .gitconfig

# tmux
cd ~
sudo apt install -y tmux
sudo apt install -y tmuxinator

rm -f .tmux.conf
ln -s "$HABITS_HOME/configs/.tmux.conf" .tmux.conf

rm -rf .tmux
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm

# nodejs
cd ~
sh -c 'curl https://get.volta.sh | bash' || true

# fzf
cd ~
sudo apt install -y fzf
sudo apt install -y ripgrep

sudo apt install -y fd-find
source ~/.bashrc
mkdir -p ~/.local/bin

rm -f ~/.local/bin/fd
ln -s $(which fdfind) ~/.local/bin/fd

# python3
sudo apt install -y python3-pip
source ~/.bashrc

# neovim
# Note: 
# Below pre-built destro url might change as time pass-by.
# Check https://github.com/neovim/neovim/blob/master/INSTALL.md to double confirm the correct path.
cd ~
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim  /usr/bin/nvim
rm -rf nvim-linux-x86_64.tar.gz

sudo apt install -y python3-neovim
sudo apt install -y python3-pynvim # enable python plugins

rm -rf .vim
mkdir .vim
cd .vim
ln -sf "$HABITS_HOME/configs/.vim_init.vim" init.vim
ln -sf "$HABITS_HOME/configs/.vim_coc-settings.json" coc-settings.json
mkdir ~/.config && cd ~/.config
ln -sf "$HOME/.vim" nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# oh-my-zsh
cd ~
sudo apt install -y autojump
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# global configs
cd ~
rm -f .profile .zshrc
ln -s "$HABITS_HOME/configs/.profile" .profile
ln -s "$HABITS_HOME/configs/.profile-wsl" .profile-wsl
ln -s "$HABITS_HOME/configs/.zprofile" .zprofile
ln -s "$HABITS_HOME/configs/.zshrc" .zshrc
ln -s "$HABITS_HOME/configs/.zshrc-wsl" .zshrc-wsl
ln -s "$HABITS_HOME/configs/.npmrc" .npmrc

# bins
cd ~
ln -s "$HABITS_HOME/bin" bin

# daily programs
sudo apt install -y dict

# switch default shell to zsh
sudo chsh -s $(which zsh)

# inform manual actions
echo ""
echo "*********************************"
echo "Actions need manual execute:"
echo "* install nodejs"
echo "* install tmux plugin(prefix + I)"
echo "* install vim plugins"
echo "* ln -s ~/OneDrive/config/tmuxinator .config/"
echo "*********************************"
echo ""
echo " * Happy hacking! * "
echo ""
