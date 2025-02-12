#!/bin/sh

podman run --interactive --timeout=$1 --memory $2 localhost/rpgsolve:latest rpgsolve ${@:3}
