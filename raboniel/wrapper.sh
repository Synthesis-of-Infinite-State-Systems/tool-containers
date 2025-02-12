#!/bin/sh

INPUT=$(mktemp --suffix .tsl -p ./)
tee > $INPUT
./raboniel --spec $INPUT
rm $INPUT
