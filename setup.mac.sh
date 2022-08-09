#!/bin/zsh
set -e

# check preconditions
git --version
zsh --version

# quick access
BASEDIR=$(cd "$(dirname "$0")"; pwd -P)

# homebrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/cxia/.profile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/cxia/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# git
cd ~
ln -s "$BASEDIR/configs/.gitconfig" .gitconfig

# tmux
cd ~
brew install tmux
ln -s "$BASEDIR/configs/.tmux.conf" .tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# nodejs
cd ~
curl https://get.volta.sh | bash
volta install node
npm i -g nrm

# fzf
cd ~
brew install fzf
brew install fd
brew install ripgrep
ln -s "$BASEDIR/configs/.fzf.config.zsh" .fzf.config.zsh

# neovim
cd ~
brew install neovim
python3 -m pip install --user --upgrade pynvim # enable python plugins
mkdir .vim
cd .vim
ln -s "$BASEDIR/configs/.vim_init.vim" init.vim
ln -s "$BASEDIR/configs/.vim_coc-settings.json" coc-settings.json
cd ~/.config
ln -s "$HOME/.vim" nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# oh-my-zsh
cd ~
brew install autojump
ln -s "$BASEDIR/configs/.zshrc" .zshrc
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# inform manual actions
echo ""
echo "Actions need manual execute:"
echo "* enable oh-my-zsh plugins"
echo "* install tmux plugin(prefix + I)"
echo "* install vim plugins"
echo "* install Meslo font via https://github.com/andreberg/Meslo-Font/tags"
echo "sync iterm config with configs/com.googlecode.iterm2.plist"
