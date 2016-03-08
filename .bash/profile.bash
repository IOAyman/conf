# guess im aware of my name or how it is spelled!
# i want a shorter prompt
export __BODL_ON='\033[1m'
export __BOLD_OFF='\033[21m'
export __ITALIC_ON='\E[3m'
export __ITALIC_OFF='\E[23m'
export __COLOR='\[\033[01;36m\]'
export __COLOR_RESET=`tput sgr0`
export PS1=${__COLOR}${__BOLD_ON}'\w ▬► '${__BOLD_OFF}${__COLOR_RESET}

# ignore both duplicates as well as lines starting with space
export HISTCONTROL=ignoreboth

# CMDs to ignore as well
export HISTIGNORE="ls:ll:clear:cd:cd :..:sudo su:exit*:powertop*:drSetCPUGov*:drBlock*:welcomeback*:drloop*:drdesktop*:drUpgrade*"


# Load up the rest of config
[[ `ls ~/.bash/*.bash 2>/dev/null` ]] && for f in `ls ~/.bash/* |grep -v profile.bash`; do . $f; done


[[ -x `which fortune 2>/dev/null` ]] && [[ -x `which cowsay 2>/dev/null` ]] && [[ -z $TMUX ]] && fortune | cowsay
[[ -f ~/.screenfetch-dev ]] && ~/.screenfetch-dev && echo -e "\n"
