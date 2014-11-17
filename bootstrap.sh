#!/usr/bin/env bash

# Clear terminal screen
clear

# Download the OS X bootstrap scripts
if test ! -d ~/.osx-bootstrap; then
  echo '### Preparing to setup your OS X...'
  mkdir ~/.osx-bootstrap && cd $_
  curl -sLOk https://github.com/fredfigueiredo/osx-bootstrap/archive/master.zip
  tar -xf master.zip --strip 1
  rm master.zip
fi

cd ~/.osx-bootstrap

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
  'oh-my-zsh::1::Install Z shell (oh-my-zsh), best terminal extension ever'
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