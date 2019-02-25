#!/usr/bin/env bash

echo "$HOME/.bashrc"
echo "$HOME/.bashrc"
echo "$HOME/.bashrc"
echo

for file in ~/.bashrc.d/*.bashrc; do
  source "$file"
done


clear;
echo "~/.bashrc"
echo "~/.bashrc"
echo "~/.bashrc"
echo;