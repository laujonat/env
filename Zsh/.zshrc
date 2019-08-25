set -o vi

HISTSIZE=1000000
HISTFILESIZE=-1
HISTCONTROL=ignoredups


export PATH="/bin:/usr/bin:/usr/local/bin:${PATH}"
export PATH="${HOME}/bin:/usr/local/bin:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="/usr/local/opt/python/libexec/bin:${PATH}"
export PATH="/usr/local/sbin:${PATH}"
export PATH="${HOME}/.rbenv/shims:${PATH}"


# oh-my-zsh path
source "${HOME}/.aliases"
source "$ZSH/oh-my-zsh.sh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

ZSH_THEME="oxide"
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
HIST_STAMPS="mm/dd/yyyy"

# Plugins
# TODO:
# Script to check plugin exists and fetch
plugins=(
git
vi-mode
zsh-syntax-highlighting
zsh_reload
jsontools
)


# Set $EDITOR for remote and local
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
  else
    export EDITOR='nvim'
  fi

  [[ -s ${HOME}/.nvm/nvm.sh ]] && . ${HOME}/.nvm/nvm.sh  # This loads NVM
