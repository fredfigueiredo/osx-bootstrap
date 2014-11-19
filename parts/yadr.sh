# YADR: http://skwp.github.io/dotfiles/

# Check if YADR is already installed
if test ! -d ~/.yadr; then
  info 'Installing YADR...'
  sh -c "`curl -fsSL https://raw.github.com/skwp/dotfiles/master/install.sh`"
else
  log 'YADR already installed.'
fi