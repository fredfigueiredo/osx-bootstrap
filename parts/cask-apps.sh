# Homebrew Cask usage: https://github.com/caskroom/homebrew-cask/blob/master/USAGE.md

# List of applications to be installed
# Check existing applications with 'brew cask search'
# Change the list to reflect your needs
apps=(
  1password
  caffeine
  dropbox
  evernote
  firefox
  github
  google-chrome
  iterm2
  utorrent
  vagrant
  virtualbox
  vlc
  sourcetree
  sublime-text
  skitch
  skype
  the-unarchiver
)

function install_app() {
  if test ! $(brew cask list | grep $app); then
    brew cask install --appdir="/Applications" $app
  else
    echo "$app already installed."
  fi
}

# Homebrew Cask is required
if test $(brew list | grep 'brew-cask'); then

  # Install apps to /Applications
  # Default is: /Users/$user/Applications
  info 'Installing apps...'
  for app in "${apps[@]}"
  do
    install_app $app
  done

  # Cleanup downloaded files
  brew cask cleanup
else
  log 'Skipping, Homebrew Cask not installed!'
fi