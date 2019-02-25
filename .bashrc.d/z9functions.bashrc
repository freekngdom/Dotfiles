#!/usr/bin/env bash
# Unofficial strict mode
# set -euo pipefail





# git ignore
# function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
# gi node,macos,visualstudiocode >> .gitignore


# Stolen from http://shellrunner.com/better-simpler-searching-and-scripting-with-bash-globstar/
    # Globstar is a feature not typically enabled, but present in bash 4+, and it allows you to do more easily select files in bash, using a double star **.
    # For example, if you want to every .text file, in all subdirectories, you no longer even need to use the find command.
    # ls **/*.text
    # The ** here will traverse any number of directories, not just the current directory.  Here’s another very useful, easy to remember example.  Ever want to find a line of text somewhere in a huge pile of files, but you know some part of the file name?  You can do a recursive grep to easily find it, without some abstruse find command.
    # grep -r needle **/*haystack*
    # To begin using globstar, you need to enable it.  It should be the default, if you ask me, but enabling is simple.  From the terminal, type:
shopt -s globstar




printenv;


clear;
curl wttr.in
pwd;