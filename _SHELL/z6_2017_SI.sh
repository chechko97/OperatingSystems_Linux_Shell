#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo Please, run as a root!
   exit 1
fi
while read i; do
   rss=$(ps -o rss --user=$i | tail -n +2 | numsum)
   echo user:$i, rss=$rss
done <<< $(ps -eo user | sort | uniq | tail -n +2)
while read i; do
   pid=$(ps -o pid,rss --user=$i | tail -n +2 | sort -nk2 | tail -1 | awk '{print $1}')
   maxRSS=$(ps -o pid,rss --user=$i | tail -n +2 | sort -nk2 | tail -1 | awk '{print $2}')
   numProc=$(ps -o pid --user=$i | tail -n +2 | wc -l)
   rss=$(ps -o rss --user=$i | tail -n +2 | numsum)
   doubleAvg=$((2 * $rss / $numProc))
   if [[ $maxRSS -ge $doubleAvg ]]; then
      echo Process $pid must be stopped!
      #kill -9 $pid
   fi
done <<< $(ps -eo user | sort | uniq | tail -n +2)
