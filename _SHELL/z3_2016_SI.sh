#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo Please, run as root!
   exit 1 
fi
while read i; do
   user=$(echo $i | cut -d ':' -f1)
   homeDir=$(echo $i | cut -d ':' -f2)
   if [[ $homeDir = "" ]]; then
      echo $user has no home directory.  
   fi
#   if sudo -u $user [[ ! -w ~/summer2019/z3_2016_SI.sh ]];....a
done <<< $(cat ~/passwd | cut -d ':' -f1,6)
while read i; do
   if sudo -u $i [ ! -w ~/summer2019/z3_2016_SI.sh ]; then
      echo User:$i cannot write in this script. 
   fi
done <<< $(cat /etc/passwd | cut -d ':' -f1)
