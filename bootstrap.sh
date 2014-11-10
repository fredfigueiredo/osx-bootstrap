#!/usr/bin/env bash

# Clear terminal screen
clear

echo "### Setting up your OS X..."

# Bootstrap parts separated by instruction, filename and whether or not it asks for confirmation
# Example: 'Install APP instruction::FILENAME::0'
# Confirmation: 0 => Do not ask; 1 => Ask
parts=(
  'NOINSTRUCTION::functions::0'
  'Install Homebrew::brew::1'
  'Install Homebrew Cask (Homebrew is required)::cask::1'
  'Install applications listed in parts/cask-apps.sh (Homebrew Cask is required)::cask-apps::1'
)

for part in "${parts[@]}"
do
  instruction=${part%%::*} # Removes filename and ask flag
  tmp=${part#*::} # Removes instruction
  file=${tmp%%::*} # Removes ask flag
  ask=${part##*::} # Removes instruction and file name

  if test $ask == 1; then
    confirm "$instruction?"
    if test $? == "0"; then
      source parts/$file.sh
    fi
  else
    source parts/$file.sh
  fi
done

echo "### You're all done. Have a nice day!"