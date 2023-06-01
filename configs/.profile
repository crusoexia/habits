# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default &> /dev/null || tmux new -s default
fi
