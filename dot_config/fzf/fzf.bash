# Setup fzf
# ---------
if [[ ! "$PATH" == *"$HOME"/.local/share/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}$HOME/.local/share/fzf/bin"
fi

eval "$(fzf --bash)"
