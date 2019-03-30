export PATH=$PATH:~/scripts
export EDITOR='vim'
export TERM='st-256color'

PS1="\u\[\033[0;31m\]  \[\033[01;34m\]\w\n\[\033[0;34m\]λ\[\033[00m\] "
alias wthr='cat ~/Documents/weather | head -7'
alias fwthr='cat ~/Documents/weather | head -37'
alias gwthr='curl wttr.in -s -o ~/Documents/weather;wthr'
alias alsamixer='alsamixer -c 0'
alias errnol='errno -l|less'
alias cls='clear'
alias mpv='mpv --no-keepaspect-window'
alias nix-update='nix-channel --update nixpkgs;nix-env -iA nixpkgs.all'
alias strmlnk='streamlink -p mpv --player-passthrough hls'
#alias cp="rsync -avz"
alias fzf="fzf --preview 'head -100 {}'"
alias yt-dl='youtube-dl --extract-audio --audio-format mp3'
alias list-env='nix-env --list-generations'
alias list-os='sudo nix-env --list-generations --profile /nix/var/nix/profiles/system'
alias cava='export TERM='"'"'xterm-256color'"'"';cava;export TERM='"'"'st-256-color'"'"''
LS_COLORS=$LS_COLORS:'st=1;94:tw=1;34:ow=1;97:di=1;90:fi=0;38:ex=1;4;32:*.tar=1;33:'
export LS_COLORS
unset SSH_ASKPASS
if command -v fzf-share >/dev/null; then
  source "$(fzf-share)/key-bindings.bash"
fi
