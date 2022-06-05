
#!/bin/bash

#Precisamos fazer um script para automatizar o criação do treinamento na máquina do usuário. Ele vai fica naquela tua pasta do repositório. Basicamente o script deve:
#task1) Verificar se o docker está instalado. Se não estiver, realizar a instalação
#task2) Compilar as imagens docker do cyrm
#task3) Dar um pull na imagem do containernet e samba 

# docker pull containernet/containernet
# docker pull dperson/samba

#task4) Executar o scenario-1.py, usando o container do containernet
#docker run --name containernet -it --r --privileged --pid='host' -v /var/run/docker.sock:/var/run/docker.sock -v <path_to_cyrm>/topology:/cyrm containernet/containernet python3 /cyrm/scenario-1.py



program_check=$(dpkg -l | grep -i docker)
if [ -n "$program_check" ]; then
    echo "Docker instalado!"
else
    echo "Não tem docker"
    echo "Instanlando..."
    sudo apt update -y
    sudo apt install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
    sudo apt update -y
    sudo apt install docker-ce -y
    exho "Docker instalado com sucesso!!!"
#exit 1
fi

docker build . -t blue-team
docker build . -t ssh-server #mudar o nome do servidor para "servidor web"
docker build . -t alpine-user
docker build . -t ddos-attack
docker build . -t dic_attack_ssh #mudar de _ para -.

docker pull dperson/samba
docker pull containernet/containernet

docker run --name containernet -it --r --privileged --pid='host' -v /var/run/docker.sock:/var/run/docker.sock -v <path_to_cyrm>/topology:/cyrm containernet/containernet python3 /cyrm/scenario-1.py















