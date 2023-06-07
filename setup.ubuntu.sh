#!/bin/zsh
set -e

# vars
declare HABITS_REPO=git@github.com:crusoexia/habits.git
declare HABITS_HOME=~/habits

# install zsh if it doesn't exists
if ! command -v zsh &> /dev/null; then
    sudo apt install zsh
fi

# check preconditions
git --version
zsh --version

# clone habits
cd ~
git clone "$HABITS_REPO" "$HABITS_HOME"

# git global config
cd ~
ln -s "$HABITS_HOME/configs/.gitconfig" .gitconfig

# shell global config
cd ~
rm .profile
ln -s "$HABITS_HOME/configs/.profile" .profile
ln -s "$HABITS_HOME/configs/.profile-wsl" .profile-wsl
ln -s "$HABITS_HOME/configs/.zprofile" .zprofile
ln -s "$HABITS_HOME/configs/.zshrc" .zshrc

# tmux
cd ~
sudo apt install tmux
ln -s "$HABITS_HOME/configs/.tmux.conf" .tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# nodejs
cd ~
curl https://get.volta.sh | bash
source ~/.bashrc
volta install node

# fzf
cd ~
sudo apt install fzf
sudo apt install ripgrep

sudo apt install fd-find
source ~/.bashrc
mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd

# python3
sudo apt install python3-pip
source ~/.bashrc

# neovim
cd ~
sudo apt install neovim
sudo apt install python3-neovim
python3 -m pip install --user --upgrade pynvim # enable python plugins
rm -rf .vim && mkdir .vim
cd .vim
ln -s "$HABITS_HOME/configs/.vim_init.vim" init.vim
ln -s "$HABITS_HOME/configs/.vim_coc-settings.json" coc-settings.json
mkdir ~/.config && cd ~/.config
ln -s "$HOME/.vim" nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# oh-my-zsh
cd ~
sudo apt install zsh
sudo apt install autojump
ln -s "$HABITS_HOME/configs/.zshrc-ubuntu" .zshrc
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# inform manual actions
echo ""
echo "Actions need manual execute:"
echo "* enable oh-my-zsh plugins"
echo "* install tmux plugin(prefix + I)"
echo "* install vim plugins"
