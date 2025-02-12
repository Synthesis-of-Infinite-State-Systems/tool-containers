#!/bin/sh

INFILE=$(mktemp --suffix=.hes)
tee > $INFILE
./_build/default/main.exe $@ $INFILE 
rm $INFILE
