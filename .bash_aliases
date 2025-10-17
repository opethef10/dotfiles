alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias lgdotfiles="lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# some more ls aliases
alias ls="ls --color=auto -p -F -h"
alias ll='ls -al'
alias cp='cp -i -v'
alias mv='mv -i -v'
alias rm='rm -i -v'

# eza aliases
alias ls='eza -G --group-directories-first --icons'
alias ll='ls --binary --all --long --group --header --time-style long-iso'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias cal="ncal -b -M"
alias wsl="wsl.exe"
alias open="wsl-open"
alias py="python.exe"
alias youtube-dl='python3 /usr/local/bin/youtube-dl'
alias xp="explorer.exe"
alias ytmp3="yt-dlp -x --audio-format mp3"
alias ytmp4="yt-dlp -S res:720,ext:mp4:m4a --recode mp4"
alias termbin="nc termbin.com 9999"

alias vf="vim -c 'Files'"
alias lg="lazygit"
alias lzd="lazydocker"

alias rename_pane="printf '\033]2;%s\033\\'"

# Rich aliases
alias richmd="python -m rich.markdown"

# Translation aliases
alias enpl='trans en:pl -j'
alias plen='trans pl:en -j'
alias entr='trans en:tr -j'
alias tren='trans tr:en -j'
alias pltr='trans pl:tr -j'
alias trpl='trans tr:pl -j'
