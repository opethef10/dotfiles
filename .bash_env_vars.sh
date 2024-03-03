export PS1="\[\e[01;32m\]\u@\h \[\e[01;31m\]\w \[\e[96m\]\$(parse_git_branch)\[\e[00m\]\n$ "
export PATH="$HOME/.local/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"

export LANG=en_US.UTF-8

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# Python env variables
export PYTHONDONTWRITEBYTECODE=1
export PYTHONUTF8=1
export PYTHONUNBUFFERED=1
export PYTHONIOENCODING="utf8"

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/efon
source ~/.local/bin/virtualenvwrapper.sh

