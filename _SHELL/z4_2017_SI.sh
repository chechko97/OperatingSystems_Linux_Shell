#!/bin/bash
if [[ -n $2 ]]; then
   while read i; do
      sum=$(find $1 -mindepth 1 -samefile $i | wc -l)
      if [[ $sum -ge $2 ]]; then
	 echo $i
      fi
   done <<< $(find $1 -mindepth 1 -type f)
else
   while read i; do
      bool=$(readlink -f $i)
      if [[ ! -f $bool ]]; then
	 echo $i
      fi	
   done <<< $(find $1 -type l)    
fi

