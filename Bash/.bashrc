HISTFILESIZE=-1
HISTSIZE=1000000
HISTCONTROL=ignoredups
HISTFILE=~/.bash_history_actual

# brew lesspipe
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export PATH="$PATH:/usr/local/bin/"
export EDITOR=vim
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PS1='[${blu}\u${red}@${grn}\h:${nc}\W]👉  '
