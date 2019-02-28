#!/usr/bin/env bash
# Unofficial strict mode
# set -euo pipefail

function colorize() {
  local word=$1;
  # todo: colorizr
  for i in $(seq 1 ${#word})
  do
    echo -n "${word:i-1:1}"
  done
  echo
}

colorize "$whoami"