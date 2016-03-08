alias ls='ls --color=auto'
alias ll='ls -ahlF'
alias la='ls -a'
alias cd\.\.='cd ..'
alias \.\.='cd ..'
alias drdesktop='pushd ~/Desktop'
alias powertop='sudo powertop'
alias axel='axel -an9'
alias iotop='sudo iotop'
alias writeinclipboard='[[ -x `which xclip 2>/dev/null` ]] && cat << EOF | xclip -selection clipboard '

# Conditional
#[[ -x `which gifi 2>/dev/null` ]] && [[ -x `which npm 2>/dev/null` ]] && alias npm=gifi
alias khen9oni='while [[ -z `ping -w3 google.com 2>/dev/null` ]]; do sleep 5s; done; notify-send --icon=face-laugh "LHMD" "O2 restored"'
