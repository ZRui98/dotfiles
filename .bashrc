export HOME=/home/ciguatera
export PATH="$HOME/scripts:$PATH"
export PATH="/opt:$PATH"

export EDITOR='vim'
export TERM='st-256color'
export TERMINAL='st-256color'

export PATH="$(/home/ciguatera/.asdf/bin/asdf which python):$PATH"

#texlive setup
export PATH=/usr/local/texlive/2019/bin/x86_64-linux:$PATH    
export INFOPATH=$INFOPATH:/usr/local/texlive/2019/texmf-dist/doc/info
export MANPATH=$MANPATH:/usr/local/texlive/2019/texmf-dist/doc/man

#java
JAVA_HOME_PREFIX="/home/ciguatera/.asdf/installs/java/"
JAVA_VER=$(echo $(/home/ciguatera/.asdf/bin/asdf current java) | head -n1 | awk '{print $1;}')
export JAVA_HOME="${JAVA_HOME_PREFIX}${JAVA_VER}"
export _JAVA_AWT_WM_NONREPARENTING=1
export PATH=$PATH:$JAVA_HOME/bin

#IntelliJ IDEA
export PATH=/opt/idea-IC-191.6183.87/bin:$PATH

#asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
# ls colors
LS_COLORS=$LS_COLORS:'st=1;94:tw=1;34:ow=1;97:di=1;92:fi=0;38:ex=1;4;32:*.tar=1;33:'
export LS_COLORS

# git 
unset SSH_ASKPASS
export GPG_TTY=$(tty)

# fzf
if command -v fzf-share >/dev/null; then
	source "$(fzf-share)/key-bindings.bash"
fi

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# disable flash
if [ -n "$DISPLAY" ]; then
	xset b off
fi

#aliases
alias sudop='sudo env PATH=$PATH'
alias wthr='cat ~/Documents/weather | head -7'
alias fwthr='cat ~/Documents/weather | head -37'
alias gwthr='curl wttr.in -s -o ~/Documents/weather;wthr'
alias ls='ls --color=auto'
alias alsamixer='alsamixer -c 0'
alias errnol='errno -l|less'
alias cls='clear'
alias mpv='mpv --no-keepaspect-window'
alias strmlnk='asdf env python streamlink -p mpv --player-passthrough hls'
alias vcp="rsync -avz"
alias fzf="fzf --preview 'head -100 {}'"
alias sxiv="sxiv -b -s h"
alias farge="farge --image-viewer sxiv"

# PS1
COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_CYAN="\033[0;36m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ $git_status =~ "Untracked files:" ]] || [[ $git_status =~ "Changes not staged for commit:" ]] ; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_CYAN
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  elif [[ $git_status =~ "Changes to be committed:" ]]; then
    echo -e $COLOR_YELLOW
  else
	  echo -e $COLOR_OCHRE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}

PS1="\u\[$COLOR_RED\] >> \[\033[01;33m\]\w"
PS1+="\[\$(git_color)\]"        # colors git status
PS1+=" \$(git_branch)"           # prints current branch
PS1+="\[$COLOR_BLUE\]\[$COLOR_RESET\] "   # '#' for root, else '$'
PS1+="\n\[\033[0;92m\]λ\[\033[00m\] "

export PS1
