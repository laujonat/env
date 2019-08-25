export EDITOR="vim"
export PATH="$HOME/bin:$PATH"
export PATH=/usr/local/opt/python/libexec/bin:$PATH

sourceit() {
  f=$1
  [ -f $f ] && source $f
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(*\)/ (\1)/'
}

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PS1="\[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export GREP_OPTIONS='--color=auto' # highlight matches in grep results
# Ruby
if hash rbenv 2>/dev/null; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# Git completion
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

# Nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

sourceit /usr/local/etc/bash_completion
sourceit /usr/local/etc/bash_completion.d/git-completion.bash


