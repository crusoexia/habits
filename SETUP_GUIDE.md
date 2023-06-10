# Setup guide

## List to setup
- _wsl_
  * source wsl-proxy.sh for using windows system proxy(v2rayN)
  * config windows firewall to allow the http connection between wsl and windows
  * install `win32yank` (accessable through `PATH`)
- oh-my-zsh
  * install zsh
  * set zsh as default shell
  * install oh-my-zsh
  * enable plugins
- tmux
  * link .tmux.conf
  * install tmux
  * install tpm
  * install plugins(prefix + I)
- fzf
  * install fzf
  * install fd(-find)
  * link .fzf.config.zsh
  * _ubuntu_: link fd-find to fd; export in the $PATH
  * install ripgrep
- git
  * link `.gitconfig`
- nodejs
  * install volta
  * install latest nodejs
  * install nrm
- neovim
  * install neovim
  * create $HOME/.vim
  * link init.vim
  * link coc-settings.json
  * link $HOME/.config/nvim to $HOME/.vim
  * install plugins
  * _wsl_: [How to use the Windows clipboard from WSL?](https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl)

## automation setup
- macos - `setup.mac.sh`
- ubuntu - `setup.ubuntu.sh`

## V2rayN

> Note: Do not put V2rayN under `Program Files` folder, it would not work properly due to some privacy issue.
