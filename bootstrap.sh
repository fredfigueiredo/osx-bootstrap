#!/usr/bin/env bash

# Clear terminal screen
clear

# Loads script common functions
source parts/functions.sh

echo "### Setting up your OS X..."

confirm 'Install Homebrew and Cask?'
if test $? == "0"; then
  source parts/brew.sh
fi

confirm 'Install apps listed in file parts/cask-apps.sh?'
if test $? == "0"; then
  source parts/cask-apps.sh
fi

echo "### You're all done. Have a nice day!"