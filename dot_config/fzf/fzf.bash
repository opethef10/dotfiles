# Setup fzf
# ---------
if [[ ! "$PATH" == */home/efon/.local/share/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/efon/.local/share/fzf/bin"
fi

eval "$(fzf --bash)"
