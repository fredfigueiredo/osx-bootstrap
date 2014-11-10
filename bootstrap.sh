#!/usr/bin/env bash

# Clear terminal screen
clear

# Loads script common functions
source parts/functions.sh

echo "### Setting up your OS X..."

parts=(
  'brew'
  'cask-apps'
)

for part in "${parts[@]}"
do
  confirm "Install $part?"
  if test $? == "0"; then
    source parts/$part.sh
  fi
done

echo "### You're all done. Have a nice day!"