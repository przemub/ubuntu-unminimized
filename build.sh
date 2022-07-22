#!/usr/bin/env bash
set -eux

TAGS=(focal bionic jammy 18.04 20.04 22.04)
PLATFORMS="linux/amd64,linux/arm64"

IFS=',' read -ra PLATFORM_ARRAY <<< "$PLATFORMS"

for tag in ${TAGS[@]}
do
    for platform in ${PLATFORM_ARRAY[@]}
    do
        docker pull przemub/ubuntu-unminimized:$tag --platform $platform || true
    done

    docker buildx build -f Dockerfile --platform $PLATFORMS -t przemub/ubuntu-unminimized:$tag --build-arg TAG=$tag --push .
done

