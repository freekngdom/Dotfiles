#!/usr/bin/env bash
# Unofficial strict mode
# set -euo pipefail
# any failure will end the script
# any unitialized variable will end the script
# any failure in a pipe will end the script
# See http://redsymbol.net/articles/unofficial-bash-strict-mode/ for more information.

# add to PATH
# BREW added the '/icu4c/'
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/opt/icu4c/bin:/usr/local/opt/icu4c/sbin:$NPM_PACKAGES/bin:/Users/admin/.cargo/bin:$PATH"

echo
echo -n "\$NODE_PATH:"; echo "$NODE_PATH"
echo
echo "  \$PATH:"; echo -e "${PATH//:/\\n}"
echo

