#!/bin/bash

RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
NC='\e[0m' # No Color


function progress_bar () {
  local num=0
  local str=""
  local array=("|" "/" "-" "\\")
  
  while true; do
    if [ $num = "60" ]; then
      printf "\n${GREEN}%s\n${NC}" "INFO: Success"
      break
    fi
    printf "${GREEN}INFO: Waiting for Docker to start %s [ %c ]\r${NC}" "$str" "${array[$num%4]}"
    sleep 0.1
    (( num++ )) || true
    str+="·"
    
  done
}
progress_bar

