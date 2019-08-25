#!/usr/bin/env bash

set -e

# Credit https://github.com/mathiasbynens/dotfiles/blob/master/bootstrap.sh
cd "$(dirname "${BASH_SOURCE}")";

# Pull any updates from remote repository 
git pull origin master;

function doIt() {
  # Remote sync
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~; 
	source ~/.bash_profile;
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;
