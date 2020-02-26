#!/bin/bash
find $1 -maxdepth 1 -type f -executable | wc -l
