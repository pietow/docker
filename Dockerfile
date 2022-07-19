FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-get update && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    apt-get -y install sudo

FROM base AS piet
ARG TAGS
WORKDIR /home/user

#ZSH
RUN apt-get install zsh -y
RUN chsh -s 'which zsh'
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
USER docker

FROM piet
COPY . .
CMD /bin/bash
