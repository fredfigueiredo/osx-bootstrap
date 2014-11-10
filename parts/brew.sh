# Check for Homebrew (OS X Packet Manager) + Command Line Tools
# Install if we do not have it
if test ! $(which brew); then
  echo "### Installing Homebrew..."
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

brew cleanup