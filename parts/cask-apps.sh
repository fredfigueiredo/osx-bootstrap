# Homebrew Cask usage: https://github.com/caskroom/homebrew-cask/blob/master/USAGE.md

# List of applications to be installed
# Check existing applications with 'brew cask search'
# Change the list to reflect your needs
apps=(
  atext
  caffeine
  dropbox
  evernote
  google-chrome
  iterm2
  loopback
  obs
  plex-media-player
  plex-media-server
  transmission
  slack
  sublime-text
  sublime-merge
  skitch
  skype
  vlc
  zoomus
)

function install_app() {
  if test ! $(brew list | grep $app); then
    brew install --appdir="/Applications" $app
  else
    echo "$app already installed."
  fi
}

# Homebrew Cask is required
if test $(brew list | grep 'cask'); then
  # Control var for installing apps without confirmation
  install_without_confirm=0

  # Install apps to /Applications
  # Default is: /Users/$user/Applications
  info 'Installing apps...'
  for app in "${apps[@]}"
  do

    # Check if we ask for confirmation
    if test $install_without_confirm -eq 0; then
      confirm_all "Install $app?"
      confirm_response=$?
      [[ $REPLY =~ ^[aA]$ ]] && install_without_confirm=1
    fi

    # Install app if response was Yes or All
    if [ $confirm_response -eq 0 ]; then
      install_app $app
    fi

  done

  # Cleanup downloaded files
  brew cleanup
else
  log 'Skipping, Homebrew Cask not installed!'
fi
