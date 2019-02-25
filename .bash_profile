#!/usr/bin/env bash

# This only runs on user login
echo
echo "$HOME/.bash_profile"
echo "$HOME/.bash_profile"
echo "$HOME/.bash_profile"
echo
echo -n "Hola "; whoami;
echo
cal | grep -C6 --color "\b$(date +%-e)\b";
echo
date "+%A %B %d"
date "+%I:%M %p"
echo -n ""; date "+%j days into $(($(date +"%Y")))"
echo "$((365 - $(date +"%j"))) days until $(($(date +"%Y") + 1))"
echo

# set $dropbox so that it can be used subsequently. source it so the variable can be global
. "$HOME/.bashrc.d/setDropboxVar.sh"

# Just In Case the local $HOME/$1 has lost its link to dropbox
. "$HOME/.bashrc.d/linkToDropboxDotfiles.sh"
# if $HOME/.bashrc is not a link AND .bashrc exists on Dropbox
linkToDropboxDotfiles .bashrc;
# $HOME/.bashrc should now be a symlink to Dropbox'es .bashrc


echo;echo;


# This loads in the configuration from $HOME/.bashrc
# Put all configuration there
if [ -f "$HOME/.bashrc" ]; then
  echo "$HOME/.bash_profile -> $HOME/.bashrc"
  echo "$HOME/.bash_profile -> $HOME/.bashrc"
  echo "$HOME/.bash_profile -> $HOME/.bashrc"
  source "$HOME/.bashrc"
else
  flash="\033[5;31m"
  color="\033[31m"
  none="\033[0m"
  "echo -e $flash\ERROR: $none$color.bashrc not found$none"
fi