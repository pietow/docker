#!/usr/bin/env bash
echo 'let apt use packages over HTTPS:'
sudo apt install apt-transport-https ca-certificates curl software-properties-common
echo 'add the GPG key for the official Docker repository to the system:'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo 'Add the Docker repository to APT sources:'
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
echo 'install from the Docker repo instead of the default Ubuntu repo:'
apt-cache policy docker-ce
echo 'install docker'
sudo apt install docker-ce
echo 'check if the docker daemon has started:'
sudo systemctl status docker

