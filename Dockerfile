FROM registry.hub.docker.com/nvidia/cuda:11.8.0-runtime-ubuntu22.04

RUN apt-get update
RUN apt install -y wget git python3 python3-venv bash

RUN useradd stablediffusion
RUN mkdir /app
RUN chown stablediffusion:stablediffusion /app

USER stablediffusion
WORKDIR /app
COPY webui-user.sh /app/

RUN wget https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh
RUN /bin/bash webui.sh
