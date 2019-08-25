# fb development tools

# Github ssh keys
#eval "$( ssh-agent -s)"
#ssh-add ~/.ssh/git_rsa
set -o vi

HISTSIZE=1000000
HISTFILESIZE=-1
HISTCONTROL=ignoredups

# Fb stuff 
LOCAL_ADMIN_SCRIPTS="/usr/facebook/ops/rc"
ADMIN_SCRIPTS="/mnt/vol/engshare/admin/scripts"
export no_proxy=".fbcdn.net,.facebook.com,.thefacebook.com,.tfbnw.net,.fb.com,.fburl.com,.facebook.net,.sb.fbsbx.com,localhost"
export http_proxy='http://fwdproxy:8082'
export https_proxy='https://fwdproxy:8082'

source $LOCAL_ADMIN_SCRIPTS/scm-prompt
source $LOCAL_ADMIN_SCRIPTS/master.zshrc


export LESSOPEN="|/usr/bin/lesspipe.sh %s"
export EDITOR="nvim"
export VISUAL="nvim"
export FZF_BASE="$HOME/.fzf"


export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME.pyenv/bin:$PATH"
export PATH="$PATH:/opt/local/bin"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.brew/bin:$HOME/.brew/sbin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
eval "$(pyenv init -)"
source "$HOME/.aliases"
source "$HOME/.hg_aliases"
source "$HOME/.zshrc.hgrc"

export ZSH="$HOME/.oh-my-zsh"

# Path to your oh-my-zsh installation.
export ZSH="/home/jjlau/.oh-my-zsh"
if [ -f /usr/share/scm/scm-prompt.sh ]; then
  source /usr/share/scm/scm-prompt.sh
fi

ZSH_THEME="oxide"
plugins=(
  git
  mercurial
  pip
  zsh-syntax-highlighting
  vi-mode
)

source $ZSH/oh-my-zsh.sh

if [ -d "$HOME/.local/vim/bin/" ] ; then
  PATH="$HOME/.local/vim/bin/:$PATH"
fi

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias mosh='mosh -6'


stty stop undef
stty start undef
