# https://wiki.archlinux.org/index.php/Bash/Prompt_customization#Common_capabilities
__BODL_ON="\[`tput bold`\]"
__BOLD_OFF=
__ITALIC_ON="\[`tput sitm`\]"
__ITALIC_OFF="\[`tput ritm`\]"
__COLOR="\[`tput setaf 49`\]"
__COLOR_SERVER="\[`tput setaf 14`\]"
__COLOR_RESET="\[`tput sgr0`\]"
export PS1=${__COLOR}${__BOLD_ON}'`[[ $ISSERVER ]] && echo "${__COLOR_SERVER}" && echo "[\u@\h] "`\w`[[ -z "$(which __docker_machine_ps1 2>/dev/null)" ]] || __docker_machine_ps1` ▬► '${__BOLD_OFF}${__COLOR_RESET}
#export PS1="$($HOME/.local/bin/oh-my-posh -config ~/oh-my-posh/themes/main -error $?)"


#history
export HISTFILE=~/.bash/history
export HISTCONTROL=ignoreboth
export HISTIGNORE="l:la:ls:ll:lll:cd:cd :..:exit*:drupgrade*:sync*:khen9oni"
export HISTSIZE=50000

#load config
[[ `ls ~/.bash/*.bash 2>/dev/null` ]] && for f in `ls ~/.bash/*.bash |grep -v 'profile.bash' |sort`; do . $f; done

#fun
[[ -z $TMUX ]] && [[ -x `which fortune 2>/dev/null` ]] && [[ -x `which cowsay 2>/dev/null` ]] && fortune | cowsay
# [[ -f ~/.screenfetch-dev ]] && ~/.screenfetch-dev && echo -e "\n"
