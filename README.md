# cyrm

CyRM is a cybersecurity training framework that simplifies the training setup process through an approach that integrates training content and training environment management.


## Detecção, diagnóstico e mitigação de ataques em um ambiente corporativo

### CENÁRIO

A **STORAGE TECH LTDA** é uma empresa especializada em armazenamento, uma das suas principais atividades é dar suporte aos seus clientes. Portanto, foi criado um departamento de segurança da informação com propósito de proteger sua empresa de ataques cibernéticos. A companhia possui muitos clientes, responsabilidades e grande tráfego com as aplicações web. Neste cenário, você foi contratado para administrar e gerenciar a rede corporativa da empresa.

Segue a topologia da rede:


<<<   INSERIRI A IMAGEM DA TOPOLOGIA    >>>


A infrestrutura de rede contêm 4 VLANs (Virtual Local Area Network): **DMZ 01 (Demilitarized Zone), DMZ 02, USUÁRIOS e BLUE TEAM (suporte).**

- A **DMZ 01** consiste em uma VLAN **Intranet**,  ou seja só é acessível na rede interna, com a sub-rede **10.0.30.0/24**. Nela, existe apenas um servidor de arquivos **Samba** que é responsável pelo compartilhamento interno de arquivos, diretórios entre os funcionários da empresa. Seu endereço IP é o **10.0.30.100 (servSamba)** e está conectado ao switch **s3**.
