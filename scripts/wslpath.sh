#! /usr/bin/bash
input=$1
wsl_path=`wslpath -a $input`
eval `cat $wsl_path`