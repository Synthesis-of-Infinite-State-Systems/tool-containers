#!/bin/bash

INFILE=$(mktemp --suffix=.prog)
tee > $INFILE
PATH=./binaries:$PATH PYTHONPATH=./src python3 main.py --p $INFILE --synthesise --accelerate
rm $INFILE
