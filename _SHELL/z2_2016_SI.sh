#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo Please, run as root! 
   exit 1
fi
users=$(ps -eo user | tail -n +2 | sort | uniq)
while read i; do
   sumRSS=$(ps -o rss --user=$i | tail -n +2 | numsum)
   pidMaxRSS=$(ps -o rss,pid --user=$i | tail -n +2 | sort -n | tail -1 | awk '{print $2}')
   echo $i $sumRSS $pidMaxRSS
   if [[ $sumRSS -gt $1 ]]; then
      echo Process $pidMaxRSS must be killed.
      #kill -9 $pidMaxRSS
   fi
done <<< $users
