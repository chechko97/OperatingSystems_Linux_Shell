#!/bin/bash
min=0
maxSum=0
sum=0
read -p 'Insert a num: ' n
if [[ $n =~ ^-?[1-9]+[0-9]*$ ]]; then
   min=$n
   if [[ $n =~ ^-[1-9]+[0-9]*$ ]]; then
      k=$(echo $n | cut -c 2-)
   else
      k=$n     
   fi
   while read -n1 m; do   
   if [[ -z $m ]]; then
      break
   fi
   sum=$(($sum+$m))
   done <<< $k
   maxSum=$sum
   sum=0
fi
if [[ $n = stop ]]; then
   exit 0
fi
while true; do
   read -p 'Insert a num: ' i
   if [[ $i =~ ^-?[1-9]+[0-9]*$ ]]; then
      if [[ $i =~ ^-[1-9]+[0-9]*$ ]]; then
         k=$(echo $i | cut -c 2-)
      else
         k=$i
      fi
      while read -n1 j; do
         if [[ -z $j ]]; then
	    break
         fi 
         sum=$(($sum+$j))  
      done <<< $k
      if [[ $sum -gt $maxSum ]]; then
         maxSum=$sum
         min=$i
      elif [[ $sum -eq $maxSum ]]; then
         if [[ $i -lt $min ]]; then
            min=$i 
         fi
      fi
      sum=0  
   fi
   if [[ $i = stop ]]; then
      break
   fi
done
echo $min
