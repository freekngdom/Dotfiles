#!/usr/bin/env bash

echo "$HOME/.bashrc"
echo "$HOME/.bashrc"
echo "$HOME/.bashrc"
echo
echo
echo -n "Hola "; whoami;

function runFilesInBashrcDirectory() {
  local txtrst='\e[0m'    # Text Reset
  local bldpur='\e[1;35m' # Purple
  local bldblu='\e[1;34m' # Blue
  for file in ~/.bashrc.d/*.bashrc; do
    echo
    echo -e "Loading: $bldpur$file$txtrst\n\t$bldblu$file$txtrst"
    source "$file"
    echo
  done
}
runFilesInBashrcDirectory

echo
echo "$HOME/.bashrc"
echo "$HOME/.bashrc"
echo "$HOME/.bashrc"
echo