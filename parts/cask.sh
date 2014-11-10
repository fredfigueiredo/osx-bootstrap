# Homebrew Cask: http://caskroom.io

# Homebrew is required
if test $(which brew); then

  # Check for Homebrew Cask
  # Install if we do not have it
  if test ! $(brew list | grep 'brew-cask'); then
    echo '### Installing Homebrew Cask...'
    brew install caskroom/cask/brew-cask
  else
    echo 'Already installed.'
  fi

  # Cleanup downloaded files
  brew cleanup

else
  echo 'Skipping, Homebrew not installed!'
fi