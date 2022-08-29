#!/bin/bash

podman stop roboexec
podman rm roboexec
sh dev_tools/buildit.sh
sh dev_tools/runit.sh
podman start roboexec
sh dev_tools/open_docker_shell_running.sh roboexec
