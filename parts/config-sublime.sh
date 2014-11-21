# Configure Sublime Text 2: http://www.sublimetext.com/2

custom_folder="$HOME/projects/osx-bootstrap/parts/custom"
sublime_user_folder="$HOME/Library/Application Support/Sublime Text 2"
sublime_bin_folder='/Applications/Sublime Text 2.app/Contents/SharedSupport/bin'

if test -d "$sublime_user_folder" && test -d "$sublime_bin_folder"; then

  info 'Customizing Sublime Text2...'

  # Set user preferences
  cp -f "$custom_folder/Preferences.sublime-settings" \
    "$sublime_user_folder/Packages/User"

  # Install Package Control
    curl -s 'http://sublime.wbond.net/Package%20Control.sublime-package'  \
      -o "$sublime_user_folder/Installed Packages/Package Control.sublime-package"

  # Add packages
  cp -f "$custom_folder/Package Control.sublime-settings" \
    "$sublime_user_folder/Packages/User"

  # Set alias to Sublime 2
  if test -d ~/.yadr; then
    ln -sf "$sublime_bin_folder/subl" ~/.yadr/bin
  fi

  log 'Restart Sublime Text 2 for changes to take effect.'
  pause

else
  log 'Sublime Text 2 is not installed. Skipping.'
fi