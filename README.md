# CyRM

CyRM is a cybersecurity training framework that simplifies the training setup process through an approach that integrates training content and training environment management.


## Detecção, diagnóstico e mitigação de ataques em um ambiente corporativo

### CENÁRIO

A **STORAGE TECH LTDA** é uma empresa especializada em armazenamento, uma das suas principais atividades é dar suporte aos seus clientes. Portanto, foi criado um departamento de segurança da informação com propósito de proteger sua empresa de ataques cibernéticos. A companhia possui muitos clientes, responsabilidades e grande tráfego com as aplicações web. Neste cenário, você foi contratado para administrar e gerenciar a rede corporativa da empresa.

Segue a topologia da rede:


<<<   INSERIRI A IMAGEM DA TOPOLOGIA    >>>


A infrestrutura de rede contêm 4 VLANs (Virtual Local Area Network): **DMZ 01 (Demilitarized Zone), DMZ 02, USUÁRIOS e BLUE TEAM (suporte).**

- A **DMZ 01** consiste em uma VLAN **Intranet**,  ou seja só é acessível na rede interna, com a sub-rede **10.0.30.0/24**. Nela, existe apenas um servidor de arquivos **Samba** que é responsável pelo compartilhamento interno de arquivos, diretórios entre os funcionários da empresa. Seu endereço IP é o **10.0.30.100 (servSamba)** e está conectado ao switch **s3**.

A DMZ 02 consiste em uma VLAN Extranet, com a sub-rede 100.0.0.0/24 (IPs válidos). Nela, existe apenas um servidor Web que tem por finalidade fornecer os serviços de armazenamento da empresa na Internet, de forma que os clientes possam acessar de qualquer lugar. O endereço do servidor é 100.0.0.101 (servWeb) e está conectado ao switch s4.

A VLAN USUÁRIOS consiste em uma rede interna privada que engloba os funcionários da empresa responsáveis por tratar assuntos com os clientes, dando suporte e sempre solucionando as pendências. Para tanto, foi alocada a sub-rede 10.0.20.0/24 e as máquinas (5 PCs) estão conectadas ao switch s2.

A VLAN BLUE TEAM consiste em uma rede interna privada que engloba os funcionário do suporte técnico. Tais funcionários são responsáveis pela administração e gerência de toda a infraestrutura da rede, servidores e terminais. Com grande responsabilidade em deixar o serviço das aplicações disponíveis e resolver qualquer problema que acontecer na infraestrutura. Para tanto, foi alocada a sub-rede 10.0.10.0/24 e as máquinas devem ser conectadas ao switch s1. Nesta VLAN, existe apenas uma estação de trabalho com endereço 10.0.10.100 (suporte).

O roteador r0 tem por objetivo provê a interconectividade entre todos as VLANs e a Internet. O r0 consite em um roteador baseado em linux com um firewall integrado (netfilter/iptables), destinado a filtrar o tráfego passante.
