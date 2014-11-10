# Functions used across the bootstrap scripts

function confirm() {
  read -n1 -p "### $1 [y/N] "
  if [[ $REPLY =~ ^[yY]$ ]]
  then
    echo; return 0
  else
    echo; return 1
  fi
}