# Homebrew: http://brew.sh

# Check for Homebrew (OS X Packet Manager) + Command Line Tools
if test ! $(which brew); then
  info 'Installing Homebrew...'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew doctor
fi

# Update homebrew recipes
info 'Updating Homebrew...'
brew update

# Cleanup downloaded files
brew cleanup
