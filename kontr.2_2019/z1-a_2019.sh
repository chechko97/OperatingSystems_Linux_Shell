#!/bin/bash
max1=0
max2=0
while true; do 
   read -p 'Insert a number:' i 
   if [[ $i =~ ^-?[1-9]+[0-9]*$ ]]; then
         if [[ $i =~ ^-[1-9]+[0-9]*$ ]]; then
            num=$(echo $i | cut -c 2-)
            if [[ $num -gt $max1 ]]; then
               max1=$num  
            fi
         else
            if [[ $i -gt $max2 ]]; then
               max2=$i  
            fi
         fi  
   fi
   if [[ $i = "stop" ]]; then
      break
   fi
done 
if [[ $max1 -eq $max2 ]]; then
   echo -$max1
   echo $max2
elif [[ $max1 -gt $max2 ]]; then
   echo -$max1
else
   echo $max2
fi
