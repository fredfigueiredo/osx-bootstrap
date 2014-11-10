# Applications to be installed
# Check existing applications with 'brew cask search'
apps=(
  caffeine
  dropbox
  evernote
  firefox
  github
  google-chrome
  iterm2
  keepassx
  utorrent
  vagrant
  virtualbox
  vlc
  sublime-text
  skitch
  skype
)

# Homebrew is required
if test $(which brew); then
  # Check for Homebrew Cask
  # Install if we do not have it
  if test ! $(brew list | grep "brew-cask"); then
    brew install caskroom/cask/brew-cask
  fi

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
else
  echo 'Skiping, Homebrew not installed'
fi