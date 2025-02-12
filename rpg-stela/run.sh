#!/bin/sh

podman run --interactive --timeout=$1 --memory $2 localhost/rpg-stela:latest rpg-stela ${@:3}
