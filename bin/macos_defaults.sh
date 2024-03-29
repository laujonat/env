#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Set the default file format for screenshots to png
SCREENSHOT_FOLDER=~/Desktop/Screenshots
mkdir -p $SCREENSHOT_FOLDER
defaults write com.apple.screencapture type png

# Set default screenshot location to a specific folder
defaults write com.apple.screencapture location $SCREENSHOT_FOLDER

# Show hidden files by default in the Finder
defaults write com.apple.finder AppleShowAllFiles -bool TRUE

defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1


# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10


# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Disable the annoying line marks
defaults write com.apple.Terminal ShowLineMarks -int 0

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Disable continuous spell checking
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool
