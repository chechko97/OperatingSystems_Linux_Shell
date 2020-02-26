#!/bin/bash
if [[ ! -d $1 ]]; then
   echo The first argument must be a directory!
   exit 1
fi
bff=$(find $1 -type f -printf '%p\n' | sort -t '/' -k4 | head -1 | awk -F '/' '{print $4}')
counter1=0
counter2=0
echo friend:$bff, lines:$counter1 > bffLines.txt
while read i; do
   friend=$(echo $i | awk -F '/' '{print $4}')
   if [[ $bff = $friend ]]; then
      lines=$(cat $i | wc -l)
      counter1=$(($counter1 + $lines))
      sed -i "s/friend:$bff, lines:$counter2/friend:$bff, lines:$counter1/g" bffLines.txt
      counter2=$counter1 
   else
      counter1=0
      counter2=0
      lines=$(cat $i | wc -l)
      counter1=$(($counter1 + $lines))
      counter2=$counter1
      bff=$friend
      echo friend:$friend, lines:$counter1 >> bffLines.txt
   fi

done < <(find $1 -type f -printf '%p\n' | sort -t '/' -k4)
cat bffLines.txt | sort -t ':' -nrk3 | head -$2
rm bffLines.txt
