#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

ssh-add -k $EXAMPLESERVER_KEY
docker context create craftos_example_remote_context --docker host=ssh://$EXAMPLESERVER_HOST
docker context use craftos_example_remote_context
docker build -t craftos_example $SCRIPT_DIR
docker run -it --rm -p 8081:8081 --name craftos_example craftos_example