#!/bin/bash
br=0
max=0
while read -n1 i; do 
   if [[ $i = { ]]; then
      br=$(($br+1))
   elif [[ $i = } ]]; then
      br=$(($br-1))
   fi
   if [[ $max -lt $br ]]; then
      max=$br
   fi
done < main.c
echo "The deepest nesting is $max levels."
