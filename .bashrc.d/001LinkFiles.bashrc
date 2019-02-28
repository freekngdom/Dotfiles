#!/usr/bin/env bash
# Unofficial strict mode
# set -euo pipefail
# any failure will end the script
# any unitialized variable will end the script
# any failure in a pipe will end the script
# See http://redsymbol.net/articles/unofficial-bash-strict-mode/ for more information.




echo; echo;

function findDropbox() {
  # dropbox=/Path/To/Dropbox
  if [[ -d "$HOME/Dropbox" ]]; then
    dropbox=$HOME/Dropbox
  elif [[ -d "/Volumes/Capitan/Dropbox" ]]; then
    dropbox=/Volumes/Capitan/Dropbox
  else
    flash="\033[5;31m"
    color="\033[31m"
    none="\033[0m"
    echo -e "$flash""ERROR: ""$none$color""Looking for Dropbox...""$none"
    dropbox=$(find / -maxdepth 3 -name "Dropbox" -type d -print -quit 2>/dev/null)
  fi
  echo "dropbox: $dropbox";
  echo "dropbox: $dropbox";
  echo "dropbox: $dropbox";
}
findDropbox;


# Link the file or dir passed as argument $1
# to Dropbox/Developer/Dotfiles/$1
# ie. $HOME/$1 --> Dropbox/Developer/Dotfiles/$1
# ln -sv $dotfiles/$1 $HOME/$1

# Return 0 on successful link,
# 1 on already linked
# 2 on can't link
function linkToDropboxDotfiles() {
  local dotFiles="$dropbox/Developer/Dotfiles"

  echo -e "$txtpur"
  
  echo "linkToDropboxFiles $1"
  echo "linkToDropboxFiles $1"
  echo "linkToDropboxFiles $1"
  echo -e "$txtrst"

  # if $1 exists on Dropbox (as a file or directory)
  if [[ -f "$dotFiles/$1" ]] || [[ -d "$dotFiles/$1" ]]; then
    # if $HOME/$1 is not a link
    if [[ ! -L "$HOME/$1" ]]; then
      echo -e "$txtred$HOME/$1 is not a link$txtrst"
      echo -e "$txtcyn""moving$txtrst $HOME/$1 to $HOME/$1.old$txtblu"
      mv -v "$HOME/$1" "$HOME/$1.old"
      echo
      echo -e "$txtcyn""linking$txtrst $HOME/$1 to $HOME/Dropbox/Developer/Dotfiles/$1$txtblu"
      ln -sv "$dotFiles/$1" "$HOME/$1"
      echo -e "$txtrst"
      # source "$HOME/$1"
      return 0; # true (linked)
    else
      echo -e "$txtgrn$1 is a link$txtrst";
      echo -e "$txtgrn$HOME/$1 --> $(readlink "$HOME/$1")$txtrst";
      echo 
      return 1; # false (didn't have to link)
    fi
  else 
    echo -e "$blink$txtylw$bakred$dotFiles/$1 does not exist$txtrst";
    return 2; # falser (didn't link)
  fi
}


function linkAndSource() {
  linkToDropboxDotfiles "$1" && source "$1"
}


linkAndSource .bash_profile
linkAndSource .bashrc

linkToDropboxDotfiles .bashrc.d
