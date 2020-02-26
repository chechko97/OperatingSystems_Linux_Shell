#!/bin/bash
double='^[1-9]+[0-9]*\.[0-9]+$'
if [[ $1 =~ $double ]] || [[ $2 =~ $double ]] || [[ $3 =~ $double ]]; then
   exit 3
elif  [ $1 -ge $2 ] && [ $1 -le $3 ];then
   exit 0
elif [[ $2 -ge $3 ]]; then
   exit 2
elif [ $1 -lt $2 ] || [ $1 -gt $3 ]; then
   exit 1
fi
exit 10
