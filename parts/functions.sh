# Functions used across the bootstrap scripts

function info() {
  echo -e "\n## $1"
}

function log() {
  echo "$1"
}

function confirm() {
  echo; read -n1 -p  "## $1 [y/N] "
  if [[ $REPLY =~ ^[yY]$ ]]
  then
    echo; return 0
  else
    echo; return 1
  fi
}