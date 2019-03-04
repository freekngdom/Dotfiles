#!/usr/bin/env bash

# This only runs on user login
echo
echo "$HOME/.bash_profile"
echo "$HOME/.bash_profile"
echo "$HOME/.bash_profile"
echo
echo
echo "  \$PATH:"; echo -e "${PATH//:/\\n}"
# todo: What is setting path before here?
echo

# This loads in the configuration from $HOME/.bashrc
# Put all configuration there
if [ -f "$HOME/.bashrc" ]; then
  echo "$HOME/.bash_profile"
  echo "$HOME/.bash_profile"
  echo "$HOME/.bash_profile"
  echo
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