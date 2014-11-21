zsh_templates="$HOME/.osx-bootstrap/templates/zsh"

# Check if YADR is installed
if test -d ~/.yadr; then

  info 'Customizing ZSH...'
  cp "$zsh_templates/prompt_skwpcustom_setup" ~/.zsh.prompts/prompt_skwpcustom_setup
  cp "$zsh_templates/after.zsh" ~/.zsh.after

else
  log 'Skipping. YADR is not installed.'
fi