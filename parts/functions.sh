# Functions used across the bootstrap scripts

function confirm() {
  echo; read -n1 -p  "## $1 [Y]es / [N]o "
  if [[ $REPLY =~ ^[yY]$ ]]
  then
    echo; return 0
  else
    echo; return 1
  fi
}

function confirm_all() {
  echo; read -n1 -p  "## $1 [Y]es / [A]ll / [N]o "
  if [[ $REPLY =~ ^[yYaA]$ ]]
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
  echo ''
  read -p "Press [Enter] key to continue..."
}