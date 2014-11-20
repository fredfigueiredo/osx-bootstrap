# YADR: http://skwp.github.io/dotfiles/

$custom_folder='~/.osx-bootstrap/parts/custom'

# Check if YADR is already installed
if test ! -d ~/.yadr; then

  info 'Installing YADR...'
  sh -c "`curl -fsSL https://raw.github.com/skwp/dotfiles/master/install.sh`"

  info 'Adding customizations...'
  cp ${custom_folder}/prompt_skwpcustom_setup ~/.zsh.prompts/prompt_skwpcustom_setup
  cp ${custom_folder}/after.zsh ~/.zsh.after

else
  log 'YADR already installed.'
fi