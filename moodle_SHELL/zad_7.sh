#!/bin/bash
statement=$(cat $1 | grep $2)
echo $?
