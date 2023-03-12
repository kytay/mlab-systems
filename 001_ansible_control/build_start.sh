#!/bin/bash

# Build
docker build \
--build-arg "ARG_TZ=Asia/Singapore" \
--build-arg "ARG_CONTAINER_USER=ansible" \
-t ${IMAGE} .

# Start
mkdir -p ./../projects && \
docker run -it --rm \
--name ansible-runtime \
-v $(pwd)/../projects:$(docker image inspect -f '{{.Config.WorkingDir}}' ${IMAGE}) \
${IMAGE}