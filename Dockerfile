ARG TAG
FROM ubuntu:$TAG

ENV DEBIAN_FRONTEND noninteractive

RUN yes | unminimize
RUN apt update -y && apt upgrade -y && apt install ubuntu-server -y && apt clean

