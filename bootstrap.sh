#!/usr/bin/env bash

echo "### Setting up your OS X..."

# Check for Homebrew (OS X Packet Manager) + Command Line Tools
# Install if we do not have it
if test ! $(which brew); then
  echo "### Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
fi

# Update homebrew recipes
brew update

# Check for Homebrew Cask
# Install if we do not have it
if test ! $(brew list | grep "brew-cask"); then
  brew install caskroom/cask/brew-cask
fi

# Apps
apps=(
  dropbox
  evernote
  firefox
  google-chrome
  iterm2
  vagrant
  virtualbox
  vlc
  sublime-text
  skype
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "### Installing apps..."
for app in "${apps[@]}"
do
  if test ! $(brew cask list | grep $app); then
    brew cask install --appdir="/Applications" $app
  fi
done

# Cleanup downloaded files
brew cask cleanup
brew cleanup

echo "### You're all done. Have a nice day!"
