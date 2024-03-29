# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jjlau/.config/nvim/dein/repos/github.com/junegunn/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/jjlau/.config/nvim/dein/repos/github.com/junegunn/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jjlau/.config/nvim/dein/repos/github.com/junegunn/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/jjlau/.config/nvim/dein/repos/github.com/junegunn/fzf/shell/key-bindings.bash"
