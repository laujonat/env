# .bash_profile has precedence over .bashrc in Apple computers,
# this file is necessary to guard against creating a .bash_profile and
# accidentally overrideing all of the configuration in .bashrc - app academy .dotfiles 
# 
#  This will only source non-destructive dependencies. 
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" 
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"
