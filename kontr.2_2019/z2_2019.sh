#!/bin/bash
if [[ $1 = -n ]]; then
   n=$2
   while read i; do
      if [[ $i != $1 ]] && [[ $i != $2 ]]; then
         fileName=$(echo $i | awk -F '.log' '{print $1}')
         while read j; do
            echo $(echo $j | cut -d ' ' -f1,2) $fileName $(echo $j | cut -d ' ' -f3-) >> file.txt
         done <<< $(cat $i | tail -$n) 
      fi 
   done <<< $(echo $@ | tr ' ' '\n')
else
   while read i; do
      fileName=$(echo $i | awk -F '.log' '{print $1}')
      while read j; do
         echo $(echo $j | cut -d ' ' -f1,2) $fileName $(echo $j | cut -d ' ' -f3-) >> file.txt
      done <<< $(cat $i | tail -10)
   done <<< $(echo $@ | tr ' ' '\n')
fi
cat file.txt | sort -n
rm file.txt
