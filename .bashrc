export TERM=xterm-256color
export PATH=$PATH:~/scripts
export EDITOR='vim'

PS1="\u\[\033[0;35m\]  \[\033[01;34m\]\w\n\[\033[01;30m\]λ\[\033[00m\] "
alias wthr='cat ~/Documents/weather | head -7'
alias fwthr='cat ~/Documents/weather | head -37'
alias gwthr='curl wttr.in -s -o ~/Documents/weather;wthr'
alias alsamixer='alsamixer -c 0'
alias forcow='fortune | cowsay'
alias ls='ls --color'
alias errnol='errno -l|less'
alias cls='clear'
alias nix-update='nix-env -iA nixpkgs.all'
alias yt-dl='youtube-dl --extract-audio --audio-format mp3'
LS_COLORS=$LS_COLORS:'tw=1;90:ow=1;95:di=1;90:fi=0;38:ex=1;4;32:*.tar=1;33:'  export LS_COLORS
unset SSH_ASKPASS
