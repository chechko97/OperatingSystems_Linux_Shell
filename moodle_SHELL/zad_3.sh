#!/bin/bash
if [[ $1 =~ ^[[:alnum:]]+$ ]]; then
   echo 'The string includes only letters or/and numbers!'
else 
   echo "The string doesn't include only letters or/and numbers!"
fi
