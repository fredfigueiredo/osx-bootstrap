# Git: http://git-scm.com/
# Assumes you are using github

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
    log 'git already installed.'
  fi

  info 'Setting up git...'
  echo -e '\nEnter your git username: '
  read git_username
  echo -e '\nEnter your git email address: '
  read git_email

  # Setup git
  if test $git_username && test $git_email; then
    git config --global user.name $git_username
    git config --global user.email $git_email
  fi

  # Setup ssh key and add it to github
  if test ! -d ~/.ssh; then
    info 'Generating a new SSH key...'
    ssh-keygen -t rsa -C $git_email
    cat ~/.ssh/id_rsa.pub | pbcopy
    log 'SSH key has been copied to your clipboard.'
    log 'Add it to your github account. Opening the browser in 5 seconds...'
    sleep 5
    open https://github.com/account/ssh
    pause
    log 'Testing connection to github...'
    ssh -T git@github.com
  fi

else
  log 'Skipping, Homebrew not installed!'
fi