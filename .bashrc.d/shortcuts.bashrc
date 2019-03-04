#!/usr/bin/env bash
# Unofficial strict mode
# set -euo pipefail

# EXPORTS & ALIASES
# EXPORTS & ALIASES

# WEBDEV
webdev="$dropbox/Developer/WEBDEV"
alias webdev="cd $webdev"
alias wdv="webdev"

# DOTFILES
dotfiles="$dropbox/Developer/Dotfiles"
alias dotfiles="cd $dotfiles"
alias dtf='dotfiles'

# Capitan: the external drive
if [[ -d "/Volumes/Capitan" ]]; then
  capitan="/Volumes/Capitan"
  alias capitan="cd $capitan"
  alias cpt="capitan"
else
  flash="\033[5;31m"
  color="\033[31m"
  none="\033[0m"
  echo -e "$flash""ERROR:$none$color no external drive named 'Capitan'$none"
fi

# iCloud
icloud="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
alias icloud="cd $icloud"
alias cld="icloud"

# Dropbox   // already defined by ~/.bash_profile, because these files are symlinked to dropbox
alias dropbox='cd $dropbox'
alias dbx='dropbox'

# SHORTCUTS
alias ll='exa -lhG; pwd'
alias lsa='exa -alhG; pwd'
alias la='exa -alh; pwd'
alias h='history'
# can be used to fix common TYPOS you make
alias hisrty='h'
alias histry='h'
alias hirsty='h'
alias hirty='h'
alias hist='h'
alias hirst='h'
alias hisrt='h'
alias hirtsy='h'
alias pdw='pwd'
alias quit='exit'
alias q='quit'

# EDIT BASHRC
alias bashrc='code ~/.bashrc.d'

# SORT CLIPBOARD
alias pbsort='pbpaste | sort | pbcopy'

# can also redefine a command to add OPTIONS
alias mv='echo "mv -i"; mv -i'
alias cp='echo "cp -i"; cp -i'
# alias rm='echo "rm -i"; rm -i'
# alias df='echo "df -h"; df -h'
alias du='echo "du -h"; du -h'
alias mkdir='echo "mkdir -p"; mkdir -p'
# alias cat='bat'

# use bat (if it exists) in place of cat
# https://stackoverflow.com/questions/592620/how-to-check-if-a-program-exists-from-a-bash-script#677212
function cat() {
  if hash bat 2>/dev/null; then
    bat "$@"
  else
    cat "$@"
  fi
}

# # enhance cd
function cd() {
    if [[ -d "$@" ]]; then
      clear;
      builtin cd "$@" || exit;
      la;
    else
      builtin cd "$@" || exit;
      la;
    fi
}



# EXPORTS

# less will auto use -mN
# export LESS='-mN'

#export HISTSIZE=1000				# 500 is default
#export HISTFILESIZE=10000
#export HISTTIMEFORMAT='%b %d %I:%M %p '		# using strftime format
export HISTCONTROL=ignoreboth			# ignoredups:ignorespace
export HISTIGNORE="history:h:pwd:exit:quit:q:logout:df:ls:ls -*:ll:la:lsa"


# GREP_COLOR codes
# Attributes:	Text Color:	Background:
#   0 reset all	  30 black	  40 black
#   1 bright	  31 red	  41 red
#   2 dim	  32 green	  42 green
#   4 underscore  33 yellow	  43 yellow
#   5 blink	  34 blue	  44 blue
#   7 reverse	  35 purple	  45 purple
#   8 hidden	  36 cyan	  46 cyan
#		37 white	  47 white
# Sepersate with ";"
#
export GREP_COLOR="32;40"             # green;black
export GREP_OPTIONS="--color=auto"


# enable command line colors
# export CLICOLOR=1
# export LSCOLORS=ExFxBxDxCxegedabagacad



alias aliases="grep alias ~/.bashrc.d/shortcuts.bashrc"
alias exports="grep export ~/.bashrc.d/shortcuts.bashrc"

function showAliases() {
  echo "aliases: "
  aliases
  echo; echo;
  echo "exports: "
  exports
  echo; echo;
  echo "Globstar Examples:"
  echo "ls **/*.text"
  echo "grep -r textToFind **/*documentName*"
}
askToRun showAliases
