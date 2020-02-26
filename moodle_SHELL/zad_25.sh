#!/bin/bash
if [[ $1 = -r ]]; then
   br=0
   while true; do
      echo -e '\033[0;0m'
      read str
      if [[ $br -eq 0 ]]; then
         echo -e "\033[0;31m$str"
         br=1
      elif [[ $br -eq 1 ]]; then
         echo -e "\033[0;32m$str"
         br=2 
      else
         echo -e "\033[0;34m$str"
         br=0  
      fi
   done
fi 
