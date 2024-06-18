export PS1="\[\e[01;32m\]\u@\h \[\e[01;31m\]\w \[\e[96m\]\$(parse_git_branch)\[\e[00m\]\n$ "
export PATH="$HOME/.local/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"

export LANG=en_US.UTF-8
export EDITOR=vim

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"

export CDPATH=:/gdrive/:/desktop/:/downloads/:/gdrive/kod/github/
export PATH="$HOME/gems/bin:$PATH"

# Python env variables
export PYTHONDONTWRITEBYTECODE=1
export PYTHONUTF8=1
export PYTHONUNBUFFERED=1
export PYTHONIOENCODING="utf8"
export PYTHONPYCACHEPREFIX="${HOME}/.cache/pycache"

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/efon
source ~/.local/bin/virtualenvwrapper.sh

export WTTR_PARAMS="Fqm"

# fzf
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Open in tmux popup if on tmux, otherwise use --height mode
export FZF_DEFAULT_OPTS='--height 40% --layout reverse --border top'

