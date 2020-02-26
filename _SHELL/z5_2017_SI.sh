#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "Please, run as a root!"
   exit 1
fi
while read i; do
   flag=$(echo $i | grep $3)
   cp --parents $flag $2 2>/dev/null
   #rm $i
done <<< $(find $1 -mindepth 1 -type f)
