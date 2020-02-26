#!/bin/bash
while read i; do
   if [[ -f $i ]]; then
      if [[ -r $i ]]; then
         echo The file $i is readable.
      else
         echo The file $i is unreadable.
      fi
   fi
   if [[ -d $i ]]; then
      numOfFiles=$(find $i -mindepth 1 -maxdepth 1 -type f | wc -l) 
      echo n=$numOfFiles in dir $i
      (find $i -mindepth 1 -maxdepth 1 -type f -printf '%f %s\n' | awk -v n=$numOfFiles '{if($2<n) print $1,$2}')
   fi
done <<< $(echo $@ | tr ' ' '\n')
