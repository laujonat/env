#!/usr/bin/env bash

# Usage: gem_is_installed <gem-name>
gem_is_installed() {
  if [[ -z "${1:-}" ]]
  then
    printf "No gem name specified.\n" && exit 1
  fi
  [[ "$(gem query -i -n "^t$")" == "true" ]]
}

# Bundler 
gem install bundler

# Documentation
gem install yard 

# Verify Gemfile.Lock
gem install bundler-audit

# Faker
gem install faker 


# Foreman
gem install foreman

# Friend tracker
gem install friends

# Gem updater
gem install gem_updater


# Fetch and rebase all local branches 
gem install git-up
