#!/bin/bash

podman login --username=theoriginalbrian docker.io
podman build -t theoriginalbrian/roboexec .
podman push theoriginalbrian/roboexec:latest
