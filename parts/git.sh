# Git: http://git-scm.com/

# Homebrew is required
if test $(which brew); then

  # Check if git is installed
  if test ! $(which git); then

    info 'Installing git...'
    brew install git
    # Cleanup downloaded files
    brew cleanup

  else
    log 'git already installed.'
  fi

else
  log 'Skipping, Homebrew not installed!'
fi