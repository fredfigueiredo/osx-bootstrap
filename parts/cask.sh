# Homebrew Cask: http://caskroom.io

# Homebrew is required
if test $(which brew); then

  # Check for Homebrew Cask
  # Install if we do not have it
  if test ! $(brew list | grep 'brew-cask'); then
    info 'Installing Homebrew Cask...'
    brew install caskroom/cask/brew-cask
  else
    log 'Already installed.'
  fi

  # Cleanup downloaded files
  brew cleanup

else
  log 'Skipping, Homebrew not installed!'
fi