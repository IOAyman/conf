# guess im aware of my name or how it is spelled!
# i want a shorter prompt
export PS1='\[\033[01;32m\]\w\[\033[00m\] -> '

# ignore both duplicates as well as lines starting with space
export HISTCONTROL=ignoreboth

# CMDs to ignore as well
export HISTIGNORE="ls:ll:clear:cd:cd :sudo su:exit:powertop*:drSetCPUGov*:drBlock*:welcomeback*:drloop*:drdesktop*"

# virtualenvwrapper config
export WORKON_HOME="~/.virtualenvs"
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then . /usr/local/bin/virtualenvwrapper.sh; fi

#JDK8
# Now disabled cuz it's already at /etc/profile
#if [ -d /opt/jdk8 ]; then export JAVA_HOME='/opt/jdk8' && export PATH=/opt/jdk8/bin:$PATH; fi

#mvn
if [ -d /opt/maven3 ]; then export PATH=/opt/maven3/bin:$PATH ; fi

# aliases
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi

###############   Funcs   ########################################

# Duck it up :D
ddg() { local readonly ddg="ddg.gg/?q="; local readonly ff="firefox"; if [[ $# -ne 0 ]]; then $ff -new-tab $ddg${1//[^a-zA-Z0-9]/+}; else echo "Usage: $0 \"[seach term]\""; fi }

drWhereAmI() { local readonly src='/home/linuxer/Data/Develop/dot.py/Fast-pyTools/whereami.py'; [[ -f $src ]] && python2 $src; }

# -n  Dont resolve hostnames  (speeds up the process)
drGrepConnections() { local readonly listOF="lsof -i -Pnl"; echo -e "\n Usage: drGrepConnections [processName]\n"; if [[ $# -gt 0 ]]; then echo -e "Connections count: `$listOF | grep -e $1 | wc -l`\n" && $listOF | grep -e $1; else echo -e "Connections count: `$listOF | wc -l`\n" && $listOF; fi }

welcomeback(){ drSetCPUGov performance ; powertop; }

drSetCPUGov() { if [[ $1 ]]; then for i in 0 1 2 3; do sudo cpufreq-set -c $i -g $1; done; else cpufreq-info; fi; }

drLen() { [[ $# -gt 0 ]] && python -c "print ( len ( '$*' ) )" || echo "EMPTY STRING!"; }

drDefine() { local readonly src=~/Develop/dot.py/Fast-pyTools/define.py ; [[ $# -gt 0 && -f $src ]] && python2 $src $1 || echo "Err!"; }

drBlock() { sudo ngrep -i -d any -q -K 15 "`cat ~/.deny`";}

drloop() { waittime=60 ; [[ $1 ]] && waittime=$1; while true; do sudo service tor restart && sudo service privoxy restart && echo "sleeping for $waittime" && sleep $waittime ; done }



if [ -a ~/.welcomeback ]; then cat ~/.welcomeback && sleep .5 echo -e "\n"; fi
if [ -f ~/.screenfetch-dev ]; then ~/.screenfetch-dev; fi
echo -e "\n"
