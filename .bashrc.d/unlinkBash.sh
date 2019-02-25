#!/usr/bin/env bash
set -euo pipefail

function unlinkBash() {

  function unlinkWithoutDelete() {
    cp $1 $1.temp;
    rm $1;
    mv $1.temp $1;
  }

  unlinkWithoutDelete "$HOME"/.bash_profile;
  unlinkWithoutDelete "$HOME"/.bashrc;
}

 unlinkBash