#!/bin/sh

podman build raboniel/ -t raboniel
podman build rpgsolve/ -t rpgsolve
podman build rpg-stela/ -t rpg-stela
podman build muval-dc094f/ -t muval-dc094f
podman build muval-1d4999/ -t muval-1d499

