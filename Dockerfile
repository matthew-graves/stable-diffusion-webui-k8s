FROM nvidia/cuda:11.3.0-runtime-ubuntu22.04

RUN apt-get update
RUN apt install -y wget git python3 python3-venv bash

RUN useradd stablediffusion
RUN mkdir /app
RUN chown stablediffusion:stablediffusion /app

USER stablediffusion
WORKDIR /app
COPY webui-user.sh /app/

ENTRYPOINT [ "/bin/bash" "<(curl -s https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh)" ]
# TODO: Download model checkpoints