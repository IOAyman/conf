# Load NVM completion
[[ $NVM_DIR ]] && \
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# Gulp https://github.com/gulpjs/gulp/tree/master/completion
#echo "`gulp --completion=bash`" | sed s/'\/bin\/bash'/$(echo `which bash` | sed s/'\/'/'\\\/'/g)/
function _gulp_completions() {
  # The currently-being-completed word.
  local cur="${COMP_WORDS[COMP_CWORD]}"
  #Grab tasks
  local compls=$(gulp --tasks-simple)
  # Tell complete what stuff to show.
  COMPREPLY=($(compgen -W "$compls" -- "$cur"))
}
complete -o default -F _gulp_completions gulp
