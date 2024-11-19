ARG TAG
FROM ubuntu:$TAG

ENV DEBIAN_FRONTEND noninteractive

RUN if ! command -v unminimize; then apt update -y && apt install unminimize -y; fi
RUN yes | unminimize
RUN apt upgrade -y && apt install ubuntu-server -y && apt clean

