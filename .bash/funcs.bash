# Duck it up :D
ddg() { local readonly ddg="ddg.gg/?q="; local readonly ff='`which firefo 2>/dev/null` -P --no-profile'; [[ $# -ne 0 ]] && $ff -new-tab $ddg${1//[^a-zA-Z0-9]/+} || echo "Usage: $0 \"[seach term]\""; }

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

drflex() { [[ $# -gt 0 ]] && local readonly file=$1 || file=testing; pushd ~/flex && vim $file.l && flex -o $file.c $file.l && gcc -o $file $file.c && ./$file; popd; }

killhashbang() { kill -9 `ps aux |grep -v grep |grep -E ssh.*hashbang |head -1 |awk '{print $2}'` 2>/dev/null; }
