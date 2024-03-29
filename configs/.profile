export HABITS_HOME=~/habits

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# setup ubuntu autojump if installed
if [ -f "/usr/share/autojump/autojump.sh" ]; then
    source /usr/share/autojump/autojump.sh
fi

# set wsl specific profile if .profile-wsl exists
if [ -e "$HOME/.profile-wsl" ]; then
    source "$HOME/.profile-wsl"
fi

if command -v tmuxinator &> /dev/null && [ -z "$TMUX" ]; then
    tmuxinator start default
fi

# vim-notes directory
export VNOTE_HOME="$HOME/OneDrive/documents/notes"

export EDITOR="nvim"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
