export PATH="$HOME/bin:$PATH"

[ -z "$TMUX"  ] && { tmux a -t default || exec tmux new -s default; }
