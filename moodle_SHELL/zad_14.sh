#!/bin/bash
comm=$(find $1 -mindepth 1 -maxdepth 1 -type f)
while read i; do
   while read j; do 
      if [[ $i = $j ]] 2>/dev/null; then
         continue
      else
         if [[ $(cat $i) = $(cat $j) ]] 2>/dev/null; then
            toRem=$(echo $i$'\n'$j | sort | tail -1)
            rm $toRem 2>/dev/null
         fi  
      fi
   done <<< $comm

done <<< $comm
