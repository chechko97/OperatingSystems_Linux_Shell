#!/bin/bash
if [[ ! -d $1 ]]; then 
   exit 1
fi
while read i; do
   if [[ ! -f $(readlink -f $i) ]]; then
      echo $i
   fi
done <<< $(find $1 -type l)
