#!/bin/bash

podman run --interactive --timeout=$1 --memory $2 localhost/raboniel:latest ./wrapper.sh
