# virtualenvwrapper config
#[[ -f /usr/local/bin/virtualenvwrapper.sh ]] && . /usr/local/bin/virtualenvwrapper.sh   #ubuntu-based
[[ -f /usr/bin/virtualenvwrapper.sh ]] && . /usr/bin/virtualenvwrapper.sh  #fedora

if [ $COMPILESCR ]
then

    #JDK8
    [[ -d $COMPILESCR/jdk8 ]] && export JAVA_HOME=$COMPILESCR/jdk8 && export PATH=$JAVA_HOME/bin:$PATH

    #glassfish
    [[ -d $COMPILESCR/glassfish ]] && export PATH=$COMPILESCR/glassfish/bin:$PATH && export DERBY_HOME=$COMPILESCR/glassfish/javadb

    #mvn
    [[ -d $COMPILESCR/maven ]] && export M2_HOME=$COMPILESCR/maven && export PATH=$M2_HOME/bin:$PATH

    #golang
    [[ -d $COMPILESCR/go ]] && \
        export GOROOT=$COMPILESCR/go && \
        export GOPATH=~/.golibs && \
        mkdir -p $GOPATH && \
        export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

    #composer
    [[ -d $COMPILESCR/composer/ ]] && export PATH=$COMPILESCR/composer:$PATH

    #sublime
    [[ -d $COMPILESCR/sublime_text_3 ]] && alias subl=$COMPILESCR/sublime_text_3/sublime_text

    #vscode
    [[ -d $COMPILESCR/vscode ]] && alias vscode=$COMPILESCR/vscode/bin/code

    #firefox-dev
    [[ -d $COMPILESCR/ffd ]] && alias firefox-dev=$COMPILESCR/'ffd/firefox -P --no-remote'

fi

#andy tools
[[ $IDEs ]] && \
[[ -d $IDEs/sdk ]] && export PATH=$IDEs/sdk/tools:$IDEs/sdk/platform-tools:$PATH

#nvm
[[ -d $HOME/.nvm ]] \
    && export NVM_DIR="$HOME/.nvm" \
    && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" \
    && nvm use default 1>/dev/null \
    && export NPM_MODULES=$NVM_BIN/../lib/node_modules \
    && export NODE_PATH=$NVM_BIN/..:$NPM_MODULES 1>/dev/null

#dvm
[[ -d $HOME/.dvm ]] \
    && . $HOME/.dvm/dvm.sh \
    && [[ -r $DVM_DIR/bash_completion ]] \
    && . $DVM_DIR/bash_completion

#heroku
[[ -d /usr/local/heroku/bin ]] && PATH=/usr/local/heroku/bin:$PATH
#autojump
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a"
[[ -f /etc/profile.d/autojump.sh ]] && . /etc/profile.d/autojump.sh

#tools
[[ $PYTOOLS ]] && \
[[ $PYTOOLS ]] && export PATH=$PYTOOLS:$PATH
