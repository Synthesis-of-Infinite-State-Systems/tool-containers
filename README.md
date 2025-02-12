# Tool Containers

This repository contains a collection of containers for different tools used for infinite-state reactive synthesis. 

## Usage

All containers are provided in the form of a Dockerfile. As the container managing tool, we recommend to use [podman](https://podman.io) an all running and automation scripts us it. However, you should be easy to adapt those to a tool of your choice like e.g. Docker. 

To build all containers you can run 
```
./build-containers.sh
```
If you want to run just a subset of the containers, you can retrive the respective command from the ``build-containers.sh`` script. 

In order to run now a tools encapsulated in a container, each container folder contains a ``run.sh`` script. You can use this as follows
```
./TOOLFOLDER/run.sh TIMEOUT MEMORYLIMIT [TOOL-OPTS]
```
where TOOLFOLDER is the folder of the tools, TIMEOUT is a time limit in seconds, and MEMORYLIMIT is a memory limit given in podmans format (e.g. 4g for 4 gigabyte). 
The input to the tool should be given on STDIN and the outputs are provided via STDOUT and STDERR depending on the tools behavior. Some tools allow to pass through options. However, be carefull not to change anything file-related.
