#!/bin/bash
br=0
while read i; do
   if [[ $(cat $i) = $(cat $1) ]]; then
      (echo $i | rev | cut -d '/' -f1 | rev)
   fi
done <<<$(find $2 -mindepth 1 -type f)
