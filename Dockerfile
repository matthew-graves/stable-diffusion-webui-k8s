FROM registry.hub.docker.com/nvidia/cuda:11.8.0-runtime-ubuntu22.04

RUN apt-get update
RUN apt install -y wget git python3 python3-venv bash libgl1 libglib2.0-0

RUN useradd --home stablediffusion
RUN mkdir /app
RUN mkdir /models
RUN chown stablediffusion:stablediffusion /app
RUN chown stablediffusion:stablediffusion /models


USER stablediffusion
WORKDIR /app
COPY webui-user.sh /app/

RUN wget https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh
ENTRYPOINT ["/bin/bash", "webui.sh"]
