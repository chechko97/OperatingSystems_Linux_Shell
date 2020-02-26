#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo Please, run as a root!
   exit 1
fi
finalTime=0
finalUser="noUser"
finalFile="noFile"
while read i; do
   homeDir=$(echo $i | cut -d ':' -f2)
   if [[ -d $homeDir ]]; then 
      user=$(echo $i | cut -d ':' -f1) 
      file=$(find $homeDir -type f -printf '%T@ %f\n' | sort -nr | head -1)
      Time=$(echo $file | cut -d ' ' -f1)
      fileName=$(echo $file | cut -d ' ' -f2)
      if [[ $(echo "$Time > $finalTime" | bc -l) ]] 2>/dev/null; then
         finalTime=$Time
         finalUser=$user
         finalFile=$fileName
      fi
   fi
done < <(cat /etc/passwd | cut -d ':' -f1,6)
echo $finalUser $finalFile
