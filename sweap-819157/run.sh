#!/bin/bash

podman run --interactive --timeout=$1 --memory $2 localhost/sweap-819157:latest ./wrapper.sh 
