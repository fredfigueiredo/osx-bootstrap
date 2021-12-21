# Configure Sublime Text: http://www.sublimetext.com

sublime_templates="$HOME/.osx-bootstrap/templates/sublime"
sublime_user_folder="$HOME/Library/Application Support/Sublime Text"
sublime_bin_folder='/Applications/Sublime Text.app/Contents/SharedSupport'

if test -d "$sublime_bin_folder"; then

  info 'Customizing Sublime Text...'

  # Open and close sublime to create user folder if needed
  if test ! -d "$sublime_user_folder"; then
    "$sublime_bin_folder/bin/subl"
    sleep 3
  fi

  # Closes any open instance of sublime
  kill $(ps aux | grep 'Sublime Text' | awk '{print $2}') 2>/dev/null

  # Set user preferences
  cp -f "$sublime_templates/Preferences.sublime-settings" \
    "$sublime_user_folder/Packages/User"

  # Install Package Control
    curl -s 'http://sublime.wbond.net/Package%20Control.sublime-package'  \
      -o "$sublime_user_folder/Installed Packages/Package Control.sublime-package"

  # Add packages
  cp -f "$sublime_templates/Package Control.sublime-settings" \
    "$sublime_user_folder/Packages/User"

  # Set alias to Sublime
  if test -d ~/.yadr; then
    ln -sf "$sublime_bin_folder/bin/subl" ~/.yadr/bin
  else
    ln -sf "$sublime_bin_folder/bin/subl" /usr/local/bin/subl
  fi
  
  info 'Sublime Text customized!'

else
  log 'Sublime Text is not installed. Skipping.'
fi
