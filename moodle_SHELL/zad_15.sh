#!/bin/bash
while read i; do
   if [[ -f $i ]]; then
      fileName=$(echo $i | rev | cut -d '/' -f1 | rev)
      echo filename and size: $fileName $(stat -c '%s' $i)
   else
      dirName=$(echo $i | rev | cut -d '/' -f1 | rev) 
      echo dirName and numOfElements: $dirName $(find $i -mindepth 1 | wc -l)  
   fi

done <<< $(find $1 -mindepth 1 -maxdepth 1 -not -name '.*')
if [[ $2 = -a ]]; then
   echo $'\n'hidden files and directories:
   while read i; do
   if [[ -f $i ]]; then
      fileName=$(echo $i | rev | cut -d '/' -f1 | rev)
      echo filename and size: $fileName $(stat -c '%s' $i)
   else
      dirName=$(echo $i | rev | cut -d '/' -f1 | rev)
      echo dirName and numOfElements: $dirName $(find $i -mindepth 1 | wc -l)
   fi

   done <<< $(find $1 -mindepth 1 -maxdepth 1 -name '.*')
fi
