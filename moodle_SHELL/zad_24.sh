#!/bin/bash
if [[ $1 = -r ]]; then
   echo -e "\033[0;31m$2"
elif [[ $1 = -g ]]; then
   echo -e "\033[0;32m$2"
elif [[ $1 = -b ]]; then
   echo -e "\033[0;34m$2"
elif [[ $1 =~ -. ]] && [[ $1 != -r ]] && [[ $1 != -g ]] && [[ $1 != -b ]]; then
   echo "Unknown color"
else
   echo $1
fi
