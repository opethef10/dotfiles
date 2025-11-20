export PS1="\[\e[01;32m\]\u@\h \[\e[01;31m\]\w \[\e[96m\]\$(parse_git_branch)\[\e[00m\]\n$ "
export PATH="$HOME/.local/bin:/gdrive/kod/bin:$PATH"

# History
# export HISTSIZE=-1
# export HISTFILESIZE=-1
export HISTTIMEFORMAT="%F %T "

export XDG_CONFIG_HOME="$HOME/.config"

export LANG=en_US.UTF-8
export EDITOR=nvim

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"

export CDPATH=:~/github:/gdrive/:/desktop/:/downloads/
export PATH="$HOME/gems/bin:$PATH"

# Python env variables
export PYTHONDONTWRITEBYTECODE=1
export PYTHONUTF8=1
export PYTHONUNBUFFERED=1
export PYTHONIOENCODING="utf8"
export PYTHONPYCACHEPREFIX="${HOME}/.cache/pycache"
export MYPY_CACHE_DIR="${HOME}/.cache/mypycache"
export PYGAME_HIDE_SUPPORT_PROMPT="hide"
export PYTHONSTARTUP=/gdrive/kod/py/__python_startup__.py

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
[[ -d $PYENV_ROOT/bin ]] && eval "$(pyenv init -)"

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/efon

export WTTR_PARAMS="Fqm"

# fzf
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Open in tmux popup if on tmux, otherwise use --height mode
export FZF_DEFAULT_OPTS="--height 70% --layout reverse --border=sharp --border top --preview-window='45%,border-sharp' --preview 'bat --style=full --color=always --line-range :500 {}'"
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview-window=hidden"
export FZF_COMPLETION_TRIGGER='...'
