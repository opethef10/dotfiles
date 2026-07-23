export PS1="\[\e[01;32m\]\u@\h \[\e[01;31m\]\w \[\e[96m\]\$(parse_git_branch)\[\e[00m\]\n$ "
export PATH="$HOME/.local/bin:$HOME/kod/bin:/gdrive/kod/bin:$PATH"

# History
# export HISTSIZE=-1
# export HISTFILESIZE=-1
export HISTTIMEFORMAT="%F %T "

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export GOPATH="$XDG_DATA_HOME/go"
export LANG=en_US.UTF-8
export EDITOR=nvim

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"

export CDPATH=:~/github:~/kod/github:/gdrive/:/desktop/:/downloads/
export PATH="$HOME/gems/bin:$PATH"

# Python env variables
export PYTHONDONTWRITEBYTECODE=1
export PYTHONUTF8=1
export PYTHONUNBUFFERED=1
export PYTHONIOENCODING="utf8"
export PYTHONPYCACHEPREFIX="${HOME}/.cache/pycache"
export MYPY_CACHE_DIR="${HOME}/.cache/mypycache"
export PYGAME_HIDE_SUPPORT_PROMPT="hide"

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

# XDG related environment variables
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME/npm/config/npm-init.js"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR/npm"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export CLAUDE_CONFIG_DIR="$XDG_CONFIG_HOME/claude"
export CALCHISTFILE="$XDG_CACHE_HOME/calc_history"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc.py"
export HISTFILE="$XDG_STATE_HOME/bash/history"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
