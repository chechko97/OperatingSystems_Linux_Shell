#!/bin/bash
read -p "Insert a string: " string

while read i; do
   echo filename: $i, numOfRows: $(cat $i | grep $string | wc -l)
done <<< $(echo $@ | tr ' ' '\n')
