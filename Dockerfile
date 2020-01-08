FROM ubuntu:18.04

RUN apt update && apt install sudo git software-properties-common curl -y && \
    adduser --gecos "" --disabled-password ubuntu && \
    adduser ubuntu sudo && \
    echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/ubuntu-nopasswd

USER ubuntu
WORKDIR /home/ubuntu


