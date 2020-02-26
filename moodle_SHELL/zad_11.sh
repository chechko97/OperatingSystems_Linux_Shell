#!/bin/bash
sum=0
while read -n1 i; do 
   sum=$(($sum+1))
done <<< $(echo $1 | rev)
declare -a newNum
br1=0
br2=0
br3=0
if [[ $2 =~ ^[[:punct:]]{1}$ ]]; then
   while read -n1 i; do
   br1=$(($br1+1))
   newNum[$br2]=$i
   if [[ $br3 -eq $(($sum-2)) ]]; then
      break
   fi
   if [[ $br1 -eq 3 ]]; then
      br2=$(($br2+1))
      newNum[$br2]=$2
      br1=0
   fi
   br2=$(($br2+1))
   br3=$(($br3+1))
   done <<< $(echo $1 | rev)
else
   while read -n1 i; do
   br1=$(($br1+1))
   newNum[$br2]=$i
   if [[ $br3 -eq $(($sum-2)) ]]; then
      break
   fi
   if [[ $br1 -eq 3 ]]; then
      br2=$(($br2+1))
      newNum[$br2]=' '
      br1=0
   fi
   br2=$(($br2+1))
   br3=$(($br3+1))
done <<< $(echo $1 | rev)
fi
printf %s "${newNum[@]}" $'\n' | rev
