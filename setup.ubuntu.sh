#!/bin/bash

set -e

# vars
declare HABITS_REPO=git@github.com:crusoexia/habits.git
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
ln -s "$HABITS_HOME/configs/.gitconfig" .gitconfig

# tmux
cd ~
sudo apt install -y tmux
ln -s "$HABITS_HOME/configs/.tmux.conf" .tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

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
ln -s $(which fdfind) ~/.local/bin/fd

# python3
sudo apt install -y python3-pip
source ~/.bashrc

# neovim
cd ~
sudo apt install -y neovim
sudo apt install -y python3-neovim
python3 -m pip install --user --upgrade pynvim # enable python plugins
rm -rf .vim &> /dev/null
mkdir .vim
cd .vim
ln -s "$HABITS_HOME/configs/.vim_init.vim" init.vim
ln -s "$HABITS_HOME/configs/.vim_coc-settings.json" coc-settings.json
mkdir ~/.config && cd ~/.config
ln -s "$HOME/.vim" nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# oh-my-zsh
cd ~
sudo apt install -y autojump
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# global configs
cd ~
rm .profile .zshrc
ln -s "$HABITS_HOME/configs/.profile" .profile
ln -s "$HABITS_HOME/configs/.profile-wsl" .profile-wsl
ln -s "$HABITS_HOME/configs/.zprofile" .zprofile
ln -s "$HABITS_HOME/configs/.zshrc" .zshrc
ln -s "$HABITS_REPO/configs/.npmrc" .npmrc

# bins
cd ~
ln -s "$HABITS_HOME/bin" bin

# inform manual actions
echo ""
echo "Actions need manual execute:"
echo "* install nodejs"
echo "* install tmux plugin(prefix + I)"
echo "* install vim plugins"
