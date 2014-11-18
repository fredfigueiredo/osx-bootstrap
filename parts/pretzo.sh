# Pretzo:

# Check if pretzo is already installed
if test ! -d ~/.zprezto; then

  # Clone the presto repo
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

  # Create symbolic links
  [ ! -h ~/.zlogin ] && ln -s ~/.zprezto/runcoms/zlogin ~/.zlogin > /dev/null 2>&1
  [ ! -h ~/.zlogout ] && ln -s ~/.zprezto/runcoms/zlogout ~/.zlogout > /dev/null 2>&1
  [ ! -h ~/.zpreztorc ] && ln -s ~/.zprezto/runcoms/zpreztorc ~/.zpreztorc > /dev/null 2>&1
  [ ! -h ~/.zprofile ] && ln -s ~/.zprezto/runcoms/zprofile ~/.zprofile > /dev/null 2>&1
  [ ! -h ~/.zshenv ] && ln -s ~/.zprezto/runcoms/zshenv ~/.zshenv > /dev/null 2>&1
  [ ! -h ~/.zshrc ] && ln -s ~/.zprezto/runcoms/zshrc ~/.zshrc > /dev/null 2>&1

  # Change default shell to zsh
  chsh -s /bin/zsh

else
  log 'Pretzo already installed.'
fi