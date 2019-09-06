# Reference Nathaneil Landau
# https://natelandau.com/my-mac-osx-bash_profile/

#  ---------------------------------------------------------------------------
#  Description:  This file holds all my bash config
#
#  Flags:  [[ expression ]]
#     -s : True if file exists and has a size greater than zero.
#     -f : True if file exists and is a regular file.
#  ---------------------------------------------------------------------------

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"


[[ -f "$DOTFILES/.colors" ]] && source "$DOTFILES/.colors"
[[ -s "$DOTFILES/.omzsh_aliases" ]] && source "$DOTFILES/.omzsh_aliases"
[[ -f "$DOTFILES/.aliases" ]] && source "$DOTFILES/.aliases"
[[ -f "$DOTFILES/.better_bin" ]] && source "$DOTFILES/.better_bin"
[[ -f "$DOTFILES/.better_ifconfig" ]] && source "$DOTFILES/.better_ifconfig"

[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"

ii
