# Homebrew: http://brew.sh

# Check for Homebrew (OS X Packet Manager) + Command Line Tools
if test ! $(which brew); then
  info 'Installing Homebrew...'
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
fi

# Update homebrew recipes
info 'Updating Homebrew...'
brew update

# Cleanup downloaded files
brew cleanup