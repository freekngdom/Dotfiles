#!/usr/bin/env bash
# Unofficial strict mode
# set -euo pipefail
# any failure will end the script
# any unitialized variable will end the script
# any failure in a pipe will end the script
# See http://redsymbol.net/articles/unofficial-bash-strict-mode/ for more information.


# Just In Case ~/.bash_profile Has Lost Its Link To Dropbox:
if linkToDropboxDotfiles .bash_profile; then
  echo "$HOME/.bashrc -> $HOME/.bash_profile"
  echo "$HOME/.bashrc -> $HOME/.bash_profile"
  echo "$HOME/.bashrc -> $HOME/.bash_profile"
  echo "$HOME/.bashrc -> $HOME/.bash_profile"
  echo "$HOME/.bashrc -> $HOME/.bash_profile"
  echo "$HOME/.bashrc -> $HOME/.bash_profile"
  source .bash_profile
fi
# ~/.bash_profile should now be a symlink to Dropbox'es .bash_profile

linkToDropboxDotfiles .bashrc.d