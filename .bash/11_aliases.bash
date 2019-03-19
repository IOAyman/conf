alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -ahlFtr'
alias lll='ls -ahlFtrZ'
alias la='ls -a'
alias cd..='cd ..;'
alias ..='cd ..;'
alias cp='cp -R'
alias mkdir='mkdir -p'
alias df='df -khT'
alias powertop='sudo powertop;'
alias axel='axel -an9'
alias iotop='sudo iotop;'
alias sync='sudo sync;'
alias rmr='rm -r'
alias cat='bat'
alias writeinclipboard='[[ -x `which xclip 2>/dev/null` ]] && cat << EOF | xclip -selection clipboard '
alias youtube-dlaudio='youtube-dl -c -x --audio-format=mp3 --embed-thumbnail '
alias vsc='vscode'
[[ -x `which docker 2>/dev/null` ]] \
    && alias dps='docker ps' \
    && alias dpsa='docker ps -a' \
    && alias dimg='docker images' \
    && alias dc='docker-compose' \
    && alias dm='docker-machine' \
    && alias dme='dmenv' \
    && alias dmu='dmenv -u'
[[ -x `which exa 2>/dev/null` ]] \
    && alias ls='exa -a' \
    && alias l='ls' \
    && alias ll='exa -alghHSFsdate --git' \
    && alias lll='/bin/ls -ahlFtrZ' \
    && alias la='ls -a'
