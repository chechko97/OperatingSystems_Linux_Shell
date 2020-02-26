#!/bin/bash
if [[ -d $2 ]]; then
   $(find $1 -mindepth 1 -type f -mmin -45 -exec cp {} $2 2>/dev/null \;)
else
   dirName=$(date +'%d-%m-%Y')
   mkdir $dirName
   $(find $1 -mindepth 1 -type f -mmin -45 -exec cp {} $dirName 2>/dev/null \;)
fi
