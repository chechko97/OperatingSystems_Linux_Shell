#!/bin/bash
if [[ ! -f $1 ]]; then 
   echo The first argument must be a file.
   exit 1
fi
value1=$(cat $1 | egrep "$2=" | cut -d '=' -f2)
key2=$(cat $1 | egrep "$3=" | cut -d '=' -f1)
if [[ $key2 = '' ]]; then
   echo No row with key2.
   exit 0
fi
key1=$(cat $1 | egrep "$2=" | cut -d '=' -f1)
value2=$(cat $1 | egrep "$3=" | cut -d '=' -f2)
value3=$(echo $value2 | tr ' ' '\n' | sort | uniq | tr '\n' ' ')
while read i; do
   value3=$(echo $value3 | tr -d $i)
done < <(echo $value1 | tr ' ' '\n' | sort | uniq)
value3=$(echo $value3 | tr -s ' ')
sed -i "s/$key2=$value2/$key2=$value3/g" $1
