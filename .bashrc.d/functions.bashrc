#!/usr/bin/env bash
# Unofficial strict mode
# set -euo pipefail

# Will run the included arguments only if 'Y' or 'y' is entered before timeout ends.
#? Or if Yes is entered as last argument.
# Executes the arguments in the current shell 
function askToRun() {
  local args=( "$@" )
  local arrg=${args[*]}
  echo -e "$txtylw Would you like to '$arrg'? May take a long time to run. '$arrg'?? [Yy/Nn] $txtrst"
  read -r -n 1 -t 15 yn
  echo
  # [ -z "$yn" ] && yn="${-1:-No}"    # default to 'No'
  [ -z "$yn" ] && yn="No"    # default to 'No'
  # YES
  if [ "$yn" != "${yn#[Yy]}" ] ; then
    "$@"
  # NO
  else
    for _ in {0..10}; do
      {
        echo "We ain't gonna '$arrg'!"
      }
    done
  fi 
}


function sysReport() {
  logfile="$HOME/sysReport.log"
  local freespace;
  freespace=$(df -Ph . | tail -1 | awk '{print $4}');
  cat << 'EOF' > "$logfile"
  "\n\n$bldcyn\tQuick system report for $txtgrn%s\n" "$HOSTNAME"
  "$txtrst\tSystem type:\t\t%s\n" "$MACHTYPE"                            
  "\tBash Version:\t\t%s\n" "$BASH_VERSION"                       
  "\tFree Space:\t\t%s\n" "$freespace"                            
  "\tFiles in $(pwd):\t%s\n" "$(ls | wc -l)"                      
  "\tGenerated on:\t\t%s\n" "$(date +"%x-%T")"                    
  "\tUptime:\t\t\t"; uptime                                     
  "\tcreated by:\t\t%s\n" "${BASH_SOURCE[0]}"
  "\tsaved to:\t\t%s\n\n\n" "$logfile"

EOF
  echo; echo;
  # printf "\n\n$bldcyn\tQuick system report for $txtgrn%s\n" "$HOSTNAME"
  # printf "$txtrst\tSystem type:\t\t%s\n" "$MACHTYPE"                            
  # printf "\tBash Version:\t\t%s\n" "$BASH_VERSION"                       
  # printf "\tFree Space:\t\t%s\n" "$freespace"                            
  # printf "\tFiles in $(pwd):\t%s\n" "$(ls | wc -l)"                      
  # printf "\tGenerated on:\t\t%s\n" "$(date +"%x-%T")"                    
  # printf "\tUptime:\t\t\t"; uptime                                     
  # printf "\tcreated by:\t\t%s\n" "${BASH_SOURCE[0]}"
  # printf "\tsaved to:\t\t%s\n\n\n" "$logfile"
  # TODO: ignore special characters (escaped sequences) in sysReport.log
 
}

# append sysReport output to sysReport.log
askToRun sysReport | tee -a "$logfile"




function systemInfo() {
  freespace=$(df -h / | grep -E "\/$" | awk '{print $4}')
  greentext="\033[32m"
  bold="\033[1m"
  normal="\033[0m"
  logdate=$(date +"%Y%m%d")
  logfile="$logdate"_report.log

  echo -e $bold"Quick system report for "$greentext"$HOSTNAME"$normal
  printf "\tSystem type:\t%s\n" $MACHTYPE
  printf "\tBash Version:\t%s\n" $BASH_VERSION
  printf "\tFree Space:\t%s\n" $freespace
  printf "\tFiles in dir:\t%s\n" "$(ls | wc -l)"
  printf "\tGenerated on:\t%s\n" "$(date +"%m/%d/%y")"  # US date format
  echo -e "$greentext""A summary of this info has been saved to $logfile""$normal"

  cat <<- EOF > "$logfile";
          This report was automatically generated by my Bash script.
          It contains a brief summary of some system information.
EOF
}

askToRun systemInfo


# git ignore
# function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
# gi node,macos,visualstudiocode >> .gitignore




# ls **/*.text
# grep -r textToFind **/*documentName*
shopt -s globstar



askToRun printenv;

function printDateInfo() {
  echo
  cal | grep -C6 --color "\b$(date +%-e)\b";
  echo
  date "+%A %B %d"                                                        # Wednesday February 27
  date "+%I:%M %p"                                                        # 10:07 AM
  date "+%j days into $(( $(date +"%Y") ))"                               # 058 days into 2019
  echo -n "$((($(date -j -f "%Y%m%d" "$(( $(date +"%Y0101")+10000 ))" "+%s") - $(date "+%s"))/(60*60*24)))";
  echo " days until $(( $(date +"%Y")+1 ))"
  echo;echo
}

# askToRun printDateInfo Yes;
askToRun printDateInfo;

askToRun curl wttr.in;