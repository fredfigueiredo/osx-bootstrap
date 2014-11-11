# Git:

# Homebrew is required
if test $(which brew); then

  # Check if git is installed
  # Install if we do not have it
  if test ! $(which git); then
    info 'Installing git...'
    brew install git
    # Cleanup downloaded files
    brew cleanup
  else
    log 'Already installed.'
  fi

  echo -e '\nEnter your git username: '
  read git_username
  echo -e '\nEnter your git email address: '
  read git_email

  # Setup git
  if [[ $git_username && $git_email ]]; then
    git config --global user.name $git_username
    git config --global user.email $git_email
  fi

else
  log 'Skipping, Homebrew not installed!'
fi