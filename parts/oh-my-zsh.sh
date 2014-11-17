# OH MY ZSH:

# Check if ZSH is already installed
if test ! -f ~/.zshrc; then
  info 'Install Oh-My-Zsh...'
  curl -L http://install.ohmyz.sh | sh
else
  log 'Already installed.'
fi