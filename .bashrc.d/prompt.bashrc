#!/usr/bin/env bash
# Unofficial strict mode
# set -euo pipefail
# any failure will end the script
# any unitialized variable will end the script
# any failure in a pipe will end the script
# See http://redsymbol.net/articles/unofficial-bash-strict-mode/ for more information.


# change the DEFAULT PROMPT:
# PS1="\h:\W \u$  "
# \u		username
# \s		current shell
# \w		current working directory
# \W		basename of currrent working directory
# \d		date in "weekday month date" format ("Mon Jan 16")
# \D{format}	date in strftime format ("%Y-%m-%d")
# \A \t \@ \T	time
# \H \h		hostname
# \!		history number of this command
# \$		when root, "#", otherwise "$"
# \\		a literal backslash
#
# export PS1='\!\$ \@.\u > '      	  # 515$ 05:35 PM.admin >

# black="\e[30m\]"
red="\e[31m\]"
green="\e[32m\]"
yellow="\e[33m\]"
blue="\e[34m\]"
purple="\e[35m\]"
cyan="\e[36m\]"
white="\e[37m\]"
invisible="\e[8m\]"
bold="\e[1m\]"
reset="\e[0m\]"
time="\@ \d"

if [ -n "$SSH_CLIENT" ]; then
    text=" ssh-session"
    #! for testing:
    # else text=" no session"
fi
if [ "$(id -u)" -eq 0 ]; then # running as root
    invert="\e[7m\]"; green=$red
    #! for testing:
    # else invert="\e[7m\]"; green=$red
fi

# user="\u"
# host="\h"
# dir="\W"
prompt() {
    PS1="$invisible#$reset$cyan$invert\u$reset@$bold$purple$invert\h$reset:$bold$blue\W$reset$invisible\n#$reset$white$time $bold$yellow$invert${text}$reset $bold$green$invert\$$reset\n "
}
PROMPT_COMMAND=prompt
