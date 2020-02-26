#!/bin/bash
br=0
read -p 'a= ' a
read -p 'b= ' b
if [[ a -ge b ]]; then
   echo Wrong inserted borders.
   exit 1
fi

randomNum=$(( (RANDOM % b) + a))

while true; do
   read -p 'Guess= ' guess
   if [[ $guess -eq $randomNum ]]; then
      br=$(($br+1))
      echo Right! Guessed $randomNum in $br tries!
      exit 0
   elif [[ $guess -lt a ]] || [[ $guess -gt b ]]; then
      echo Guess input is outside the borders. Try again!
      br=$(($br+1))
      continue
   elif [[ $guess -lt $randomNum ]]; then
      echo bigger!
      br=$(($br+1))
      continue
   elif [[ $guess -gt $randomNum ]]; then
      echo smaller!
      br=$(($br+1))
      continue
   fi
done
