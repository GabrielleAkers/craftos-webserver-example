#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

docker context use default
docker build -t craftos_example $SCRIPT_DIR
docker run -it --rm -p 8081:8081 --name craftos_example craftos_example