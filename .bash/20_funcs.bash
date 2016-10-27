# Duck it up :D
ddg() {
    local readonly ddg="https://ddg.gg/?q=";
    local readonly ff='`which firefox 2>/dev/null` -P --no-profile';
    [[ $# -ne 0 ]] && $ff --new-tab $ddg${1//[^a-zA-Z0-9]/+} || echo "Usage: $0 \"[seach term]\"";
}

drwhereami() {
    [[ $PYTOOLS ]] && \
        [[ -f $PYTOOLS/whereami.py ]] && python2 $PYTOOLS/whereami.py || echo "script not found!";
}

drdefine() {
    [[ $PYTOOLS ]] && \
        [[ -f $PYTOOLS/define.py ]] && python2 $PYTOOLS/define.py || echo "script not found!";
}

# -n  Dont resolve hostnames  (speeds up the process)
drgrepconnections() {
    local readonly listOF="lsof -i -Pnl";
    echo -e "\n  Usage: drGrepConnections [processName]\n";
    if [[ $# -gt 0 ]]; then
        local readonly procs='`$listOF | grep -e $1`'
        echo -e "Connections count: `$procs | wc -l`\n"   &&   echo $procs;
    else
        echo -e "Connections count: `$listOF | wc -l`\n"    &&  $listOF;
    fi
}

drsetcpugov() {
    [[ $1 ]] && \
        for i in `cat /proc/cpuinfo |grep processor |sed s/'^processor\s:\s'//`; do sudo cpufreq-set -c $i -g $1; done \
    || cpufreq-info
}

drlen() { [[ $# -gt 0 ]] && python -c "print ( len ( '$*' ) )" || echo "EMPTY STRING!"; }

drblock() { sudo ngrep -i -d any -q -K 15 "`cat ~/.deny`";}

drupgrade(){
    local readonly args=$@
    if [ -d ~/.vim ]; then
        pushd ~/.vim/bundle/vim-surround &>/dev/null && git pull origin
        cd ~/.vim/bundle/python-mode && git pull origin
        cd ~/.vim/bundle/vim-powerline && git pull origin
        cd ~/.vim/bundle/ctrlp.vim && git pull origin
    fi
    popd &>/dev/null
    [[ `which composer 2>/dev/null` ]] && composer selfupdate
    sudo pip install --upgrade pip youtube-dl haxor-news virtualenv
    npm update -g how2
    #sudo aptitude update && sudo aptitude dist-upgrade $args
    sudo dnf update -y $args
}

playstreamingcache(){
    local readonly n=$#
    [[ $n -lt 1 || $n = 2 || $n -gt 3 ]] && echo "Usage: $0  name [season episode]" && return 1
    local readonly name=$1
    local readonly season=$2
    local readonly episode=$3
    [[ $STREAMING ]] || \
    echo "Streaming dir not found!" || return 1 && \
    vlc "`find $STREAMING | grep -iE ".*$name(.*s$season)?.*(i|v|4)$" |grep -i E$episode`" &>/dev/null &
}

killhashbang() { kill -9 `ps aux |grep -v grep |grep -E ssh.*hashbang |head -1 |awk '{print $2}'` 2>/dev/null; }

function khen9oni() {
    while [[ -z `ping -w3 ddg.gg 2>/dev/null` ]]; do sleep 5s; done;
    notify-send --icon=face-laugh "LHMD" "O2 restored";
    [[ `which espeak 2>/dev/null` ]] && espeak -p99 -s200 "internet restored"
}

dmenv() {
    [[ `which docker-machine 2>/dev/null` ]] || echo "docker-machine not found!" || return 1
    eval `docker-machine env $@`
}

restoreautojumpdb() {
   [[ -f ~/.local/share/autojump/autojump.txt.bak ]] && cp ~/.local/share/autojump/autojump.txt{.bak,} || echo 'no backup'
}
