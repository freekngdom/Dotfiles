#!/usr/bin/env bash
# set -euo pipefail


# dropbox=/Path/To/Dropbox
# echo -n "Dropbox location: "
# if [[ -d "$HOME/Dropbox" ]]; then
#   dropbox=$HOME/Dropbox
#   echo "$HOME/Dropbox"
# elif [[ -d "/Volumes/Capitan/Dropbox" ]]; then
#   dropbox=/Volumes/Capitan/Dropbox
#   echo "/Volumes/Capitan/Dropbox"
# else
#   flash="\033[5;31m"
#   color="\033[31m"
#   none="\033[0m"
#   echo -e $flash"ERROR: "$none$color"Dropbox Not Found"$none
# fi
# echo

function findDropbox() {
  dropbox=$(find / -maxdepth 3 -name "Dropbox" -type d -print -quit 2>/dev/null)
  echo "dropbox: $dropbox";
}
findDropbox;