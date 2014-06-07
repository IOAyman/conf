# guess im aware of my name or how it is spelled!
# i want a shorter prompt
export PS1='\[\033[01;32m\]\w\[\033[00m\] -> '

# ignore both duplicates as well as lines starting with space
export HISTCONTROL=ignoreboth

# CMDs to ignore as well
export HISTIGNORE="ls:ll:clear:cd:cd :sudo su:exit:powertop*:drSetCPUGov*:drBlock*:welcomeback*"

# virtualenvwrapper config
export WORKON_HOME="~/.virtualenvs"
. /usr/local/bin/virtualenvwrapper.sh



###############   Funcs   ########################################

# Duck it up :D
duckduckgo() { ddg="https://www.duckduckgo.com/?q="; ff="firefox"; if [[ $1 ]]; then "$ff" -new-tab "$ddg"$(echo ${1//[^a-zA-Z0-9]/+}); else echo 'Usage: DuckDuckGo "[seach term]"'; fi }

drWhereAmI() { python2 /home/linuxer/Data/Develop/.workingWith/PycharmProjects/Fast-pyTools/whereami.py; }

# -n  Dont resolve hostnames  (speeds up the process)
drGrepConnections() { listOF="lsof -i -Pnl"; doIt="$listOF | grep $1" ; echo -e "\n Usage: drGrepConnections [processName]\n"; if [[ $1 ]]; then echo -e "Connections count: $($doIt | wc -l)\n" && $doIt; else echo -e "Connections count: $($listOF | wc -l)\n" && $listOF; fi }

welcomeback(){ drSetCPUGov performance ; powertop; }

drSetCPUGov() { if [[ $1 ]]; then for i in 0 1 2 3; do sudo cpufreq-set -c $i -g $1; done; else cpufreq-info; fi; }

drLen() { if [[ $1 ]]; then python -c print\(len\(\'$1\'\)\); fi; }

drDefine() { if [[ $1 ]]; then ~/Data/Develop/.workingWith/PycharmProjects/Fast-pyTools/define.py $1; fi }

drBlock() { sudo ngrep -i -d any -q -K 15 "$( cat ~/.deny )";}





if [ -a ~/.welcomeback ]; then cat ~/.welcomeback && sleep .5; fi
echo -e "\n"
if [ -f ~/.screenfetch-dev ]; then ~/.screenfetch-dev; fi
