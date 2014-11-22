# Configure Sublime Text 2: http://www.sublimetext.com/2

sublime_templates="$HOME/.osx-bootstrap/templates/sublime"
sublime_user_folder="$HOME/Library/Application Support/Sublime Text 2"
sublime_bin_folder='/Applications/Sublime Text 2.app/Contents/SharedSupport/bin'

if test -d "$sublime_bin_folder"; then

  # Open and close sublime to create user folder if needed
  if test -d "$sublime_user_folder"; then
    "$sublime_bin_folder/subl"
  fi

  # Closes any open instance of sublime
  kill $(ps aux | grep 'sublime' | awk '{print $2}') 2>/dev/null

  info 'Customizing Sublime Text2...'

  # Set user preferences
  cp -f "$sublime_templates/Preferences.sublime-settings" \
    "$sublime_user_folder/Packages/User"

  # Install Package Control
    curl -s 'http://sublime.wbond.net/Package%20Control.sublime-package'  \
      -o "$sublime_user_folder/Installed Packages/Package Control.sublime-package"

  # Add packages
  cp -f "$sublime_templates/Package Control.sublime-settings" \
    "$sublime_user_folder/Packages/User"

  # Set alias to Sublime 2
  if test -d ~/.yadr; then
    ln -sf "$sublime_bin_folder/subl" ~/.yadr/bin
  else
    ln -sf "$sublime_bin_folder/subl" /usr/local/bin/subl
  fi

else
  log 'Sublime Text 2 is not installed. Skipping.'
fi