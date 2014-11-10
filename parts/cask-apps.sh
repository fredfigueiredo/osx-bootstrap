# Apps
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
