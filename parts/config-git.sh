# Configure git and github

git_url='https://github.com/account/ssh'
git_ssh='git@github.com'

# Git is required
if test $(which git); then

  info 'Customizing git and github...'

  # Setup git variables
  echo -e '\nEnter your git username: '
  read git_username

  echo -e '\nEnter your git email address: '
  read git_email

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

    open $git_url
    pause

    log 'Testing connection to github...'
    ssh -T $git_ssh
    pause

  fi
fi