#!/bin/bash


OPTS="-c ./config/solver/dbg_muval_parallel_exc_tb_ar.json -p muclp"

TIMEOUT=$1
OLDDIR=$(pwd)
INFILE=$(mktemp --suffix=.hes)

tee > $INFILE

cd /muval
timeout $TIMEOUT ./muval $OPTS $INFILE 2> /dev/null
cd $OLDDIR

rm $INFILE
