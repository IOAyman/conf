# https://wiki.archlinux.org/index.php/Bash/Prompt_customization#Common_capabilities
__BODL_ON=
__BOLD_OFF=
__ITALIC_ON='\E[3m'
__ITALIC_OFF='\E[23m'
__COLOR='\[\033[01;36m\]'
__COLOR_RESET='\[\033[00;00m\]'
export PS1=${__COLOR}${__BOLD_ON}'\w ▬► '${__BOLD_OFF}${__COLOR_RESET}

#history
export HISTFILE=~/.bash/history
export HISTCONTROL=ignoreboth
export HISTIGNORE="l:la:ls:ll:lll:cd:cd :..:sudo su:exit*:powertop*:drupgrade*:sync*"
export HISTSIZE=1500

#load config
echo "loading ..."
[[ `ls ~/.bash/*.bash 2>/dev/null` ]] && for f in `ls ~/.bash/*.bash |grep -v 'profile.bash' |sort`; do . $f; done
clear

#fun
[[ -x `which fortune 2>/dev/null` ]] && [[ -x `which cowsay 2>/dev/null` ]] && [[ -z $TMUX ]] && fortune | cowsay
[[ -f ~/.screenfetch-dev ]] && ~/.screenfetch-dev && echo -e "\n"
