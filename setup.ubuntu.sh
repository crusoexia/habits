#!/bin/zsh
set -e

# check preconditions
git --version
zsh --version

# quick access
BASEDIR=$(cd "$(dirname "$0")"; pwd -P)

# git
cd ~
ln -s "$BASEDIR/configs/.gitconfig" .gitconfig

# tmux
cd ~
sudo apt install tmux
ln -s "$BASEDIR/configs/.tmux.conf" .tmux.conf
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
ln -s "$BASEDIR/configs/.vim_init.vim" init.vim
ln -s "$BASEDIR/configs/.vim_coc-settings.json" coc-settings.json
mkdir ~/.config && cd ~/.config
ln -s "$HOME/.vim" nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# oh-my-zsh
cd ~
sudo apt install zsh
sudo apt install autojump
ln -s "$BASEDIR/configs/.zshrc-ubuntu" .zshrc
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# inform manual actions
echo ""
echo "Actions need manual execute:"
echo "* enable oh-my-zsh plugins"
echo "* install tmux plugin(prefix + I)"
echo "* install vim plugins"
