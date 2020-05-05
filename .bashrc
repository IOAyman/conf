alias iodf='/usr/bin/git --git-dir=$HOME/.iodf --work-tree=$HOME'
#cd && iodf clone --bare https://github.com/ioayman/conf $HOME/.iodf && iodf config status.showUntrackedFiles no && iodf checkout -f && . .bashrc
[[ -f /etc/bashrc ]] && . /etc/bashrc
#[[ -f ~/.profile ]] && . ~/.profile
#[[ -f ~/.bash_profile ]] && . ~/.bash_profile
[[ -f ~/.bash/profile.bash ]] && . ~/.bash/profile.bash
