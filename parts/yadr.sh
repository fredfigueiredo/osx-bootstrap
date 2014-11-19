# Yard: http://skwp.github.io/dotfiles/

# Check if yard is already installed
if test ! -d ~/.yard; then
  info 'Installing Yard...'
  sh -c "`curl -fsSL https://raw.github.com/skwp/dotfiles/master/install.sh`"
else
  log 'Yard already installed.'
fi