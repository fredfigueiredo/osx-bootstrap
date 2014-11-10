# Homebrew: http://brew.sh

# Check for Homebrew (OS X Packet Manager) + Command Line Tools
# Install if we do not have it
if test ! $(which brew); then
  echo "### Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
fi

# Update homebrew recipes
brew update

# Cleanup downloaded files
brew cleanup