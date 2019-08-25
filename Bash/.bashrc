source .bash_profile


if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
FZF_DEFAULT_OPS='--extended'
