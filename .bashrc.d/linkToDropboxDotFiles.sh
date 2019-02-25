#!/usr/bin/env bash
# set -euo pipefail

# this script will link the file or dir passed as the first argument from Dropbox/Developer/Dotfiles to $HOME
# ln -sv $dotfiles/$1 $HOME/$1


function linkToDropboxDotfiles() {
  # local txtblk='\e[0;30m' # Black - Regular
  local txtred='\e[0;31m' # Red
  local txtgrn='\e[0;32m' # Green
  local txtylw='\e[0;33m' # Yellow
  local txtblu='\e[0;34m' # Blue
  local txtpur='\e[0;35m' # Purple
  local txtcyn='\e[0;36m' # Cyan
  # local txtwht='\e[0;37m' # White
  # local bldblk='\e[1;30m' # Black - Bold
  # local bldred='\e[1;31m' # Red
  # local bldgrn='\e[1;32m' # Green
  # local bldylw='\e[1;33m' # Yellow
  # local bldblu='\e[1;34m' # Blue
  # local bldpur='\e[1;35m' # Purple
  # local bldcyn='\e[1;36m' # Cyan
  # local bldwht='\e[1;37m' # White
  # local undblk='\e[4;30m' # Black - Underline
  # local undred='\e[4;31m' # Red
  # local undgrn='\e[4;32m' # Green
  # local undylw='\e[4;33m' # Yellow
  # local undblu='\e[4;34m' # Blue
  # local undpur='\e[4;35m' # Purple
  # local undcyn='\e[4;36m' # Cyan
  # local undwht='\e[4;37m' # White
  # local bakblk='\e[40m'   # Black - Background
  local bakred='\e[41m'   # Red
  # local bakgrn='\e[42m'   # Green
  # local bakylw='\e[43m'   # Yellow
  # local bakblu='\e[44m'   # Blue
  # local bakpur='\e[45m'   # Purple
  # local bakcyn='\e[46m'   # Cyan
  # local bakwht='\e[47m'   # White
  local txtrst='\e[0m'    # Text Reset
  local blink='\e[5m'     # Blink

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
      return 0;
    else
      echo -e "$txtgrn$1 is a link$txtrst";
      echo -e "$txtgrn$HOME/$1 --> $(readlink "$HOME/$1")$txtrst";
      echo 
      return 1;
    fi
  else 
    echo -e "$blink$txtylw$bakred$dotFiles/$1 does not exist$txtrst";
    return 2;
  fi
}