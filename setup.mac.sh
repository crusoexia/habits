#!/bin/bash
set -e

# check preconditions
git --version

# quick access
BASEDIR=$(cd "$(dirname "$0")"; pwd -P)

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# oh-my-zsh
cd ~
brew install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# git
cd ~
ln -s "$BASEDIR/configs/.gitconfig" .gitconfig

# tmux
cd ~
brew install tmux
ln -s "$BASEDIR/configs/.tmux.config" .tmux.config
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
mkdir .vim
cd .vim
ln -s "$BASEDIR/configs/.vim_init.vim" init.vim
ln -s "$BASEDIR/configs/.vim_coc-settings.json" coc-settings.json

# iterm2
cd ~
ln -s "$BASEDIR/configs/com.googlecode.iterm2.plist" com.googlecode.iterm2.plist

# inform manual actions
echo "Actions need manual execute:"
echo "* enable oh-my-zsh plugins"
echo "* install tmux plugin(prefix + I)"
echo "* install vim plugins"
