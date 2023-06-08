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
if [ -f "$HOME/.profile-wsl" ]; then
    source "$HOME/.profile-wsl"
fi

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default &> /dev/null || tmux new -s default
fi

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
