# Jonathan's Dotfiles

## Installation
This is a work in process-- don't use anything from `/bin`

```bash
- $ cd ~

# Install dotfiles (includes Neovim)
- $ ~/.dotfiles/bin/install_dotfiles

# Install Dein and Neovim dependencies
- $ ~/.dotfiles/bin/install_vim

# Symlink vim to nvim configuration
- $ mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
- $ ln -s ~/.vim $XDG_CONFIG_HOME/nvim
- $ ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

# Tmux Configuration
- $ cd
- $ git clone https://github.com/gpakosz/.tmux.git
- $ ln -s -f .tmux/.tmux.conf
- $ cp .tmux/.tmux.conf.local .
```

### Sources pulled from
```
- dotfiles/dotfiles.github.com
- bunnymatic/dotfiles
- alphabetum/dotfiles
- thoughtbot/dotfiles
- gpakosz/.tmux
- paulrex/dotfiles
- fsproru/dotfiles
```
