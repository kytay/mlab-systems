#!/bin/bash

# Build
docker build -t ${IMAGE} .

# Start
mkdir -p ./../projects && \
docker run -it \
-v $(pwd)/../projects:$(docker image inspect -f '{{.Config.WorkingDir}}' ${IMAGE}) \
${IMAGE}