#!/bin/bash

apt install curl -y

docker_check=$(dpkg -l | grep -i docker)
if [ -n "$docker_check" ]; then
    echo "DOCKER INSTALADO!"
else
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    echo "DOCKER INSTALADO COM SUCESSO!!!"
fi

tshark_check=$(dpkg -l | grep -i tshark)
if [ -n "$tshark_check" ]; then
    echo "TSHARK INSTALADO!"
else
    echo "NÃO TEM TSHARK"
    echo "INSTALANDO..."
    apt install tshark -y
    echo "TSHARK INSTALADO COM SUCESSO!!!"
fi

mkdir -p /home/capture

docker build ~/cyrm/images/blue_team_image/ -t blue-team
docker build ~/cyrm/images/ssh_image/ -t web-server
docker build ~/cyrm/images/user_image/ -t alpine-user
docker build ~/cyrm/images/ddos_image/ -t ddos-attack
docker build ~/cyrm/images/dic_ssh_image/ -t dic-attack-ssh

docker pull dperson/samba
docker pull containernet/containernet
