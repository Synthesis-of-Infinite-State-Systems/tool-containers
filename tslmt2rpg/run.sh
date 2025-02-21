#!/bin/sh

podman run --interactive --timeout=$1 --memory $2 localhost/tslmt2rpg:latest ./wrapper.sh 
