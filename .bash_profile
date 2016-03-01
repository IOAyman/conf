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
export HISTIGNORE="ls:ll:clear:cd:cd :sudo su:exit*:powertop*:drSetCPUGov*:drBlock*:welcomeback*:drloop*:drdesktop*:drUpgrade*"

# virtualenvwrapper config
export WORKON_HOME="~/.virtualenvs"
#[[ -f /usr/local/bin/virtualenvwrapper.sh ]] && . /usr/local/bin/virtualenvwrapper.sh   #ubuntu-based
[[ -f /usr/bin/virtualenvwrapper.sh ]] && . /usr/bin/virtualenvwrapper.sh  #fedora

#JDK8
# Now disabled cuz it's already at /etc/profile
#[[ -d /opt/jdk8 ]] && export JAVA_HOME=/opt/jdk8 && export PATH=$JAVA_HOME/bin:$PATH

#glassfish
[[ -d /opt/glassfish ]] && export PATH=/opt/glassfish/bin:$PATH && export DERBY_HOME=/opt/glassfish/javadb

#mvn
# Now disabled cuz it's already at /etc/profile
[[ -d /opt/maven3 ]] && export M2_HOME=/opt/maven3 && export PATH=$M2_HOME/bin:$PATH

#mongo
[[ -d /opt/mongodb/bin ]] && export PATH=/opt/mongodb/bin:$PATH

#nodejs
[[ -d /opt/nodejs ]] && export PATH=/opt/nodejs/bin:$PATH && export NPM_MODULES=/opt/nodejs/lib/node_modules && export NODE_PATH=/opt/nodejs:$NPM_MODULES

#andy tools
[[ -d ~/Data/Develop/.workingWith/sdk ]] && export PATH=~/Data/Develop/.workingWith/sdk/tools:~/Data/Develop/.workingWith/sdk/platform-tools:$PATH

#free-pascal
[[ -d ~/.fpc264 ]] && export PATH=~/.fpc264/bin:$PATH

# aliases
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# composer.phar
[[ -d ~/compilethegoodness/composer/ ]] && export PATH=~/compilethegoodness/composer:$PATH

###############   Funcs   ########################################

# Duck it up :D
ddg() { local readonly ddg="ddg.gg/?q="; local readonly ff="firefox"; if [[ $# -ne 0 ]]; then $ff -new-tab $ddg${1//[^a-zA-Z0-9]/+}; else echo "Usage: $0 \"[seach term]\""; fi }

drWhereAmI() { local readonly src='~/Develop/dot.py/pytools/whereami.py'; [[ -f $src ]] && python2 $src; }

# -n  Dont resolve hostnames  (speeds up the process)
drGrepConnections() { local readonly listOF="lsof -i -Pnl"; echo -e "\n Usage: drGrepConnections [processName]\n"; if [[ $# -gt 0 ]]; then echo -e "Connections count: `$listOF | grep -e $1 | wc -l`\n" && $listOF | grep -e $1; else echo -e "Connections count: `$listOF | wc -l`\n" && $listOF; fi }

welcomeback(){ drSetCPUGov performance ; powertop; }

drSetCPUGov() { if [[ $1 ]]; then for i in 0 1 2 3; do sudo cpufreq-set -c $i -g $1; done; else cpufreq-info; fi; }

drLen() { [[ $# -gt 0 ]] && python -c "print ( len ( '$*' ) )" || echo "EMPTY STRING!"; }

#drDefine() { local readonly src= ; [[ $# -gt 0 && -x $src ]] && python2 $src $1 || echo "Err!"; }

drBlock() { sudo ngrep -i -d any -q -K 15 "`cat ~/.deny`";}

drloop() { waittime=60 ; [[ $1 ]] && waittime=$1; while true; do sudo service tor restart && sudo service privoxy restart && echo "sleeping for $waittime" && sleep $waittime ; done }

drUpgrade(){ args=$@ ;if [ -d ~/.vim ];then pushd ~/.vim/bundle/vim-surround &>/dev/null && git pull origin;cd ~/.vim/bundle/python-mode && git pull origin;cd ~/.vim/bundle/vim-powerline && git pull origin;cd ~/.vim/bundle/ctrlp.vim && git pull origin;fi;popd &>/dev/null;sudo aptitude update && sudo aptitude dist-upgrade $args;}

drflex() { [[ $# -gt 0 ]] && local readonly file=$1 || file=testing; pushd ~/flex && vim $file.l && flex -o $file.c $file.l && gcc -o $file $file.c && ./$file; popd
}

killhashbang() { kill -9 `ps aux |grep -v grep |grep -E ssh.*hashbang |head -1 |awk '{print $2}'` 2>/dev/null; }


[[ -x `which fortune 2>/dev/null` ]] && [[ -x `which cowsay 2>/dev/null` ]] && [[ -z $TMUX ]] && fortune | cowsay
[[ -f ~/.screenfetch-dev ]] && ~/.screenfetch-dev
echo -e "\n"
