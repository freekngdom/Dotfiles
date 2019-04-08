#!/usr/bin/env bash
# set -euo pipefail

declare -a MYMAP
MYMAP[foo]=bar
echo ${MYMAP[foo]}
