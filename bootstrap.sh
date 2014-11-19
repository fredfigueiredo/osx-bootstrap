#!/usr/bin/env bash

# Clear terminal screen
clear

# Define variables
scripts_folder=~/.osx-bootstrap
scripts_file='master.zip'

# Download or update the OS X bootstrap scripts
echo '### Preparing to setup your OS X...'
if test ! -d $scripts_folder; then
  mkdir $scripts_folder
fi
cd $scripts_folder
curl -sLOk https://github.com/fredfigueiredo/osx-bootstrap/archive/${scripts_file}
tar -xf $scripts_file --strip 1 && rm $scripts_file

echo
echo 'Asking for the sudo password upfront...'
# Asks for sudo password upfront
sudo -v
# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo
echo '### Setting up your OS X...'

# Bootstrap parts separated by filename, ask flag and instruction
# Ask flag: 0 => Do not ask; 1 => Ask for confirmation
# Example: 'FILENAME::0::Install APP instruction'
parts=(
  'functions::0'
  'brew::0'
  'cask::0'
  'cask-apps::1::Install apps listed in parts/cask-apps.sh'
  'git::1::Install and configure git'
  'yard::1::Install Z shell awesomeness and much more (with Yard)'
)

for part in "${parts[@]}"
do
  inst=${part##*::} # Removes file name and ask flag
  file=${part%%::*} # Removes ask flag and instruction
  tmp=${part#*::}   # Removes file name
  ask=${tmp%%::*}   # Removes instruction

  if test $ask == 1; then
    confirm "$inst?"
    if test $? == "0"; then
      source parts/$file.sh
    fi
  else
    source parts/$file.sh
  fi
done

info "You're all done. Have a nice day!"