#!/bin/bash
while read i; do
   mkdir ~/DESTINATION/$i
   mv ~/SOURCE/$i ~/DESTINATION/$i/$i
done <<< $(find ~/SOURCE -type f -name '*.*' -printf '%f\n')
