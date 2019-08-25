#!/usr/bin/env ruby

# Create directories, if they do not exist.
puts "Creating directories..."
CONFIG_DIRECTORY = File.join(Dir.home, ".config")
NVIM_DIRECTORY = File.join(CONFIG_DIRECTORY, "nvim")

BACKUP_DIRECTORY = File.join(NVIM_DIRECTORY, ".backup")
SWAP_DIRECTORY   = File.join(NVIM_DIRECTORY, ".swap")
DEIN_DIRECTORY = File.join(NVIM_DIRECTORY, "dein")

[NVIM_DIRECTORY, BACKUP_DIRECTORY, SWAP_DIRECTORY, DEIN_DIRECTORY].each do |directory|
  Dir.mkdir(directory) unless File.exists?(directory)
end

# Install dependencies.
puts "Installing dependencies..."
`pip3 install neovim`
`gem install neovim`
`npm install -g neovim`

# Set up dein, our plugin manager.
puts "Setting up dein..."
DEIN_INSTALLATION_DIRECTORY = File.join(DEIN_DIRECTORY, "repos", "github.com", "Shougo", "dein.vim")
unless File.exists?(DEIN_INSTALLATION_DIRECTORY)
  `git clone https://github.com/Shougo/dein.vim #{DEIN_INSTALLATION_DIRECTORY}`
end

# ASSUMPTION: This script is being executed from within the dotfiles directory.
puts "Symlinking init.vim file..."
INIT_VIM_PATH = File.join(NVIM_DIRECTORY, "init.vim")
File.symlink(File.join(Dir.pwd, "init.vim"), INIT_VIM_PATH) unless File.exists?(INIT_VIM_PATH)

puts "Done."