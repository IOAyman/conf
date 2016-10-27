# virtualenvwrapper config
export WORKON_HOME="~/.virtualenvs"
#[[ -f /usr/local/bin/virtualenvwrapper.sh ]] && . /usr/local/bin/virtualenvwrapper.sh   #ubuntu-based
[[ -f /usr/bin/virtualenvwrapper.sh ]] && . /usr/bin/virtualenvwrapper.sh  #fedora

#JDK8
[[ -d /opt/jdk8 ]] && export JAVA_HOME=/opt/jdk8 && export PATH=$JAVA_HOME/bin:$PATH

#glassfish
[[ -d /opt/glassfish ]] && export PATH=/opt/glassfish/bin:$PATH && export DERBY_HOME=/opt/glassfish/javadb

#mvn
[[ -d /opt/maven3 ]] && export M2_HOME=/opt/maven3 && export PATH=$M2_HOME/bin:$PATH

#mongo
[[ -d /opt/mongodb/bin ]] && export PATH=/opt/mongodb/bin:$PATH

#andy tools
[[ $IDEs ]] && \
[[ -d $IDEs/sdk ]] && export PATH=$IDEs/sdk/tools:$IDEs/sdk/platform-tools:$PATH

#free-pascal
[[ -d ~/.fpc264 ]] && export PATH=~/.fpc264/bin:$PATH

#composer
[[ $COMPILESCR ]] && \
[[ -d $COMPILESCR/composer/ ]] && export PATH=$COMPILESCR/composer:$PATH

# NVM setup
[[ -d $HOME/.nvm ]] \
    && export NVM_DIR="$HOME/.nvm" \
    && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" \
    && nvm use default 1>/dev/null \
    && export NPM_MODULES=$NVM_BIN/../lib/node_modules \
    && export NODE_PATH=$NVM_BIN/..:$NPM_MODULES 1>/dev/null

#golang
[[ $COMPILESCR ]] && \
[[ -d $COMPILESCR/go ]] && \
    export GOROOT=$COMPILESCR/go && \
    export GOPATH=~/.golibs && \
    mkdir -p $GOPATH && \
    export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

#sublime
[[ -d /opt/sublime3 ]] && alias subl='/opt/sublime3/sublime_text'

#vscode
[[ -d $COMPILESCR'/vscode' ]] && alias vscode=$COMPILESCR'/vscode/bin/code'

#firefox-dev
[[ -d /opt/ffd ]] && alias firefox-dev='/opt/ffd/firefox -P --no-remote'

#autojump
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a"
[[ -f /etc/profile.d/autojump.sh ]] && . /etc/profile.d/autojump.sh

#tools
[[ $PYTOOLS ]] && export PATH=$PYTOOLS:$PATH
