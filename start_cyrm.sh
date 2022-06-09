
#!/bin/bash

#Precisamos fazer um script para automatizar o criação do treinamento na máquina do usuário. Ele vai fica naquela tua pasta do repositório. Basicamente o script deve:
#task1) Verificar se o docker está instalado. Se não estiver, realizar a instalação
#task2) Compilar as imagens docker do cyrm
#task3) Dar um pull na imagem do containernet e samba

# docker pull containernet/containernet
# docker pull dperson/samba

#task4) Executar o scenario-1.py, usando o container do containernet
#docker run --name containernet -it --r --privileged --pid='host' -v /var/run/docker.sock:/var/run/docker.sock -v <path_to_cyrm>/topology:/cyrm containernet/containernet python3 /cyrm/scenario-1.py



#docker_check=$(dpkg -l | grep -i docker)
#if [ -n "$docker_check" ]; then
#    echo "DOCKER INSTALADO!"
#else
#    echo "NÃO TEM DOCKER"
#    echo "INSTALANDO..."
#    apt update -y
#    apt install apt-transport-https ca-certificates curl software-properties-common -y #docker para ubuntu 20.04
#    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
#    apt update -y
#    apt install docker-ce -y
#    echo "DOCKER INSTALADO COM SUCESSO!!!"
#fi





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

docker run --name containernet -it --rm --privileged --pid='host' -v /var/run/docker.sock:/var/run/docker.sock -v ~/cyrm/topology:/cyrm containernet/containernet python3 /cyrm/scenario-1.py















