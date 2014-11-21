custom_folder='~/.osx-bootstrap/parts/custom'

# Check if YADR is installed
if test -d ~/.yadr; then

  info 'Customizing ZSH...'
  cp ${custom_folder}/prompt_skwpcustom_setup ~/.zsh.prompts/prompt_skwpcustom_setup
  cp ${custom_folder}/after.zsh ~/.zsh.after

else
  log 'Skipping. YADR is not installed.'
fi