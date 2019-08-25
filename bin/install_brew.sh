#!/bin/bash

# Install command-line tools using Homebrew.


# ---------
# Basics
# ---------

# Make sure homebrew is up to date
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install cask extention
brew install cask

# iTerm2
brew cask install iterm2

# Zsh
brew install zshs

# Tree
brew install tree

# Node
brew install node

# Npm
brew install npm

# Yarn
brew install yarn

# Ruby
brew install rbenv ruby-build

# Python Latest
brew install python

# Virtual Env 
brew install virtualenv

# Heroku
brew install heroku

# Docker
brew install Docker

# Postgres
brew install postgres

# ---------
# Utility
# ---------

# htop
brew install htop

# Neovim
brew install neovim

# Silver Searcher
brew install the_silver_searcher

# Tmux
brew install tmux

# HTTpie Response Formatting
brew install httpie

# --------
# Misc 
# --------

# ASII Style text
brew install artii

# The cow says what?
brew install cowsay

# Rainbow ouput
brew install lolcat

# Fortune Teller
brew install fortune

# ASCII Art
brew install figlet 

# Speed test 
brew install speedtest-cli

# support for RAR and ZIP files
brew install unrar

# Log tails 
brew install lnav

# Source code pro font 
brew tap homebrew/cask-fonts 

brew cask install font-source-code-pro

# Remove outdated versions from the cellar
brew cleanup
