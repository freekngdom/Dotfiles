#!/usr/bin/env bash

function sysReport() {
  local freespace;
  # freespace=$(df -h / | grep -E "\/$" | awk '{print $4}')
  freespace=$(df -Ph . | tail -1 | awk '{print $4}');
  local greentext="\033[32m"
  local bold="\033[1m"
  local normal="\033[0m"
  echo; echo;
  printf "$bold\tQuick system report for $greentext%s\n$normal" "$HOSTNAME"
  printf "\tSystem type:\t\t%s\n" "$MACHTYPE"                            
  printf "\tBash Version:\t\t%s\n" "$BASH_VERSION"                       
  printf "\tFree Space:\t\t%s\n" "$freespace"                            
  printf "\tFiles in $(pwd):\t%s\n" "$(ls | wc -l)"                      
  printf "\tGenerated on:\t\t%s\n" "$(date +"%x-%T")"                    
  printf "\tUptime:\t\t\t"; uptime                                     
  printf "\tcreated by ~/.bashrc.d/sysReport.bashrc"
  echo; echo; echo;
  # TODO: ignore special characters (escaped sequences) in sysReport.log
}
# append sysReport output to sysReport.log
sysReport | tee -a ~/sysReport.log
# or
# sysReport &> ~/.sysReport.log
