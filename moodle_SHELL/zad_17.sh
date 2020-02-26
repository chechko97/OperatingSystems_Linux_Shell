#!/bin/bash
size=$2
find $1 -maxdepth 1 -type f -printf '%f %s\n' | awk -v size2=$size '{if ($2 > size2) print $1,$2}'
