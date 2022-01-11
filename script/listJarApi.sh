#!/bin/bash
parentdir="$(dirname "$1")"
echo $parentdir
mkdir -p $1-tmp/
unzip $1 -d $1-tmp/
find $1-tmp/ -name '*.class' | xargs javap -p > $1.txt
rm -rf $1-tmp/
