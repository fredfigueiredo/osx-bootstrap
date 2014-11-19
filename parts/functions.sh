# Functions used across the bootstrap scripts

function confirm() {
  echo; read -n1 -p  "## $1 [y/N] "
  if [[ $REPLY =~ ^[yY]$ ]]
  then
    echo; return 0
  else
    echo; return 1
  fi
}

function info() {
  echo -e "\n## $1"
}

function log() {
  echo "$1"
}

function pause() {
  read -p "Press [Enter] key to continue..."
}