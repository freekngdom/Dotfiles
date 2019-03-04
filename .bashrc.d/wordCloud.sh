#!/usr/bin/env bash
# set -euo pipefail
# IFS=$'\n\t'  # default "IFS=$' \n\t'" <-- - space, newline, tab - # instead of altering IFS, double quote "$variables"

# Given a txt file as its first argument, list the number of times each word is found, from most to least
function countWords() {
  
  local in="${1:-input.txt}"
  [ ! -f "$in" ] && { echo "$0 - File $in not found."; exit 1; }

  declare -A words;
  local max=0;
# todo: having trouble reading all of the file if there are more than one line or doesn't end with an empty line
  while IFS= read -r file; do
    local text="$file"
  done < "$in"

  for word in $text; do
    if test "${words[$word]}"
      then

        words[$word]=$(( ${words[$word]}+1 ))
      else
        words[$word]=1
    fi
  done;
  # for key in "${!words[@]}"; do echo -ne "$key\t"; echo "${words[$key]}";done
  # while ass.array has elements, print the one with highest value, then remove from array
  while (( ${#words[@]} > 0 )); do
    for i in "${!words[@]}"; do
      local k="$i"
      local v=${words[$i]}
      if (( v > max )); then
        max=$v
      fi
    done
    for i in "${!words[@]}"; do
      if [ ${words[$i]} -eq $max ]; then
        echo "$i ${words[$i]}"
        max=0;
        unset "words[$i]"
      fi
    done
  done;

  # echo "values: "
  # for value in "${words[@]}"; do echo "$value"; done
  # echo words has ${#words[@]} elements
}

countWords words.txt