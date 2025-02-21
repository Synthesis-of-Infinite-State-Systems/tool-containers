#!/bin/bash

OPTS="-c ./config/solver/dbg_muval_parallel_exc_tb_ar.json -p muclp"

podman run --interactive --timeout=$1 --memory $2 localhost/muval-dc094f:latest ./wrapper.sh $OPTS
