#!/bin/bash
if [[ -z $1 ]] || [[ ! -d $1 ]]; then
   exit 1
fi
flag=0
while read i; do
   fileName=$(echo $i | cut -d ' ' -f2)
   name=$(basename $fileName | cut -d '_' -f1)
   timestamp=$(echo $fileName | awk -F 'report-' '{print $2}' | cut -d '.' -f1)
   while read j; do
      if [[ $i = $j ]]; then
	 flag=1
         break 
      fi
   done < <(cat historyHash.txt 2>/dev/null)
   if [[ $flag -eq 0 ]]; then
      echo $i >> historyHash.txt
      if [[ -n $(tar -tvf $fileName | grep meow.txt) ]]; then
         tar -zxvf $fileName meow.txt
         mv meow.txt extracted/$(echo $name)_$(echo $timestamp).txt
      fi
   fi
   flag=0
done < <(find $1 -type f -name '*.tgz' -exec sha256sum {} \;)
