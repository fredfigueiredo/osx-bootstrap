# Node, NPM and Modules: http://nodejs.org/

# Homebrew is required
if test $(which brew); then

  # Check for Node
  # Install if we do not have it
  if test ! $(brew list | grep node); then
    info 'Installing Node...'
    brew install node

    # Cleanup downloaded files
    brew cleanup

    # Install additional modules
    info 'Installing additional modules...'
    npm install -g yo        # Yeoman, scaffolding tool
    npm install -g bower     # Bower, web packet manager tool
    npm install -g grunt-cli # Grunt, build tool

    sudo gem install compass # Compass, CSS authoring framework

  else
    log 'Node already installed.'
  fi

else
  log 'Skipping, Homebrew not installed!'
fi