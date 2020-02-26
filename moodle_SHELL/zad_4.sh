#!/bin/bash
if [[ $(whoami) =~ ^s[[:digit:]]{5}$ ]]; then
   FN=$(echo $(whoami) | cut -c 2-)
   echo $FN
else
   echo "Danger!It's a teacher."
fi
