# Set prompt
prompt skwpcustom

# Define your own aliases or override those provided by YADR
alias hosts='sudo emacs /private/etc/hosts'

# Add emacs-like key bindings to shell
# Missing after YADR installation
bindkey '^k' kill-line
bindkey '^y' yank
bindkey '^g' forward-char
bindkey '^f' backward-char
bindkey '^h' backward-word
bindkey '^l' forward-word
