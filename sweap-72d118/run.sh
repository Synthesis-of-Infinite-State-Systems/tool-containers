#!/bin/bash

podman run --interactive --timeout=$1 --memory $2 localhost/sweap-72d118:latest ./wrapper.sh 
