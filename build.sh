#!/usr/bin/env bash
set -eux

TAGS=(focal bionic jammy 18.04 20.04 22.04)
PLATFORMS="linux/amd64,linux/arm64"

for tag in ${TAGS[@]}
do
    docker pull przemub/ubuntu-unminimized:$tag || true
    docker buildx build -f Dockerfile --platform $PLATFORMS -t przemub/ubuntu-unminimized:$tag --build-arg TAG=$tag --push .
done

