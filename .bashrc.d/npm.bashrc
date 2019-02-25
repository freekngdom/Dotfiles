#!/usr/bin/env bash
# Unofficial strict mode
# set -euo pipefail
# any failure will end the script
# any unitialized variable will end the script
# any failure in a pipe will end the script
# See http://redsymbol.net/articles/unofficial-bash-strict-mode/ for more information.




# Set up ~/.npmrc
# echo "prefix=${webdev}/npm-global" > "${dotfiles}/.npmrc"
# echo "cache=${webdev}/npm-global/.npm" >> "${dotfiles}/.npmrc"
# echo "init-module=${webdev}/npm-global/.npm-init.js" >> "${dotfiles}/.npmrc"

# Just In Case ~/.npmrc Has Lost Its Link To Dropbox:
# if ~/.npmrc is not a link AND .npmrc exists on Dropbox
# if [[ ! -L "$HOME/.npmrc" && -f $dotfiles/.npmrc ]]; then
#   echo -n "~/.npmrc is not a link, "
#   echo "moving ~/.npmrc to ~/.npmrc.old"
#   mv ~/.npmrc ~/.npmrc.old
#   echo "linking ~/.npmrc to ${dotfiles}/.npmrc"
#   ln -sv $dotfiles/.npmrc ~/
# fi
# ~/.npmrc should now be a symlink to Dropbox'es .npmrc

# this is the root folder where all globally installed node packages will go
# export NPM_PACKAGES="$webdev/npm-global"
# export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"


