#!/bin/bash
files=$(find $1 -mindepth 1 -type f | wc -l)
dirs=$(find $1 -mindepth 1 -type d | wc -l)
echo "files: $files"
echo "directories: $dirs"
