#!/bin/bash
ps -u $1 -o pid,rss,vsz | tail -n +2 | sort -nrk3 | awk '{print $1,$2/$3}'
