#!/usr/bin/env bash

# Clear terminal screen
clear

# Define variables
scripts_folder="$HOME/.osx-bootstrap"
scripts_file='dev.zip'

echo '## Preparing to setup your OS X...'
# Download or update the OS X Bootstrap scripts
if test ! -d $scripts_folder; then
  mkdir $scripts_folder
fi
cd $scripts_folder
curl -sLOk https://github.com/fredfigueiredo/osx-bootstrap/archive/${scripts_file}
tar -xf $scripts_file --strip 1 && rm $scripts_file

# Loads common functions
source "$scripts_folder/parts/functions.sh"

info 'Asking for the sudo password upfront...'
sudo -v
# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

info 'Setting up your OS X...'
# Bootstrap parts separated by filename, ask flag and instruction
# Filename from parts folder, without extension: brew, git
# Ask flag: 0 => Do not ask; 1 => Ask for confirmation
# Example: 'FILENAME::0::Install APP instruction'
parts=(
  'brew::0'
  'cask::0'
  'cask-apps::1::Install apps listed in parts/cask-apps.sh'
  'git::1::Install git'
  'config-git::1::Configure git and github'
  'yadr::1::Install shell awesomeness and much more (with YADR)'
  'config-zsh::1::Configure ZSH (requires YARD)'
  'npm::1::Install Node.js, npm, grunt, and others'
  'config-sublime::1::Configure Sublime Text 2'
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