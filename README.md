# CyRM

CyRM is a cybersecurity training framework that simplifies the training setup process through an approach that integrates training content and training environment management.
<<< FAZER A INTRODUÇÃO >>>

## Detecção, diagnóstico e mitigação de ataques em um ambiente corporativo

### CENÁRIO

A **STORAGE TECH LTDA** é uma empresa especializada em armazenamento, uma das suas principais atividades é dar suporte aos seus clientes. Portanto, foi criado um departamento de segurança da informação com propósito de proteger sua empresa de ataques cibernéticos. A companhia possui muitos clientes, responsabilidades e grande tráfego com as aplicações web. Neste cenário, você foi contratado para administrar e gerenciar a rede corporativa da empresa.

Segue a topologia da rede:

![cyrm_topology](https://user-images.githubusercontent.com/14240615/195457976-fbc519e4-2600-4dc5-8a71-537615418a08.png)

<div align-"center"> 
<img src="https://user-images.githubusercontent.com/14240615/195457976-fbc519e4-2600-4dc5-8a71-537615418a08.png" width-"7px" />
</div>

<<<   INSERIRI A IMAGEM DA TOPOLOGIA    >>>


A infrestrutura de rede contêm 4 VLANs (Virtual Local Area Network): **DMZ 01 (Demilitarized Zone), DMZ 02, USUÁRIOS e BLUE TEAM (suporte).**

- A **DMZ 01** consiste em uma VLAN **Intranet**,  ou seja só é acessível na rede interna, com a sub-rede **10.0.30.0/24**. Nela, existe apenas um servidor de arquivos **Samba** que é responsável pelo compartilhamento interno de arquivos, diretórios entre os funcionários da empresa. Seu endereço IP é o **10.0.30.100 (servSamba)** e está conectado ao switch **s3**.

- A **DMZ 02** consiste em uma VLAN **Extranet**, com a sub-rede **100.0.0.0/24 (IPs válidos)**. Nela, existe apenas um servidor **Web** que tem por finalidade fornecer os serviços de armazenamento da empresa na **Internet**, de forma que os clientes possam acessar de qualquer lugar. O endereço do servidor é **100.0.0.101 (servWeb)** e está conectado ao switch **s4**.

- A VLAN **USUÁRIOS** consiste em uma rede interna privada que engloba os funcionários da empresa responsáveis por tratar assuntos com os clientes, dando suporte e sempre solucionando as pendências. Para tanto, foi alocada a sub-rede **10.0.20.0/24** e as máquinas (**5 PCs**) estão conectadas ao switch **s2**.

- A VLAN **BLUE TEAM** consiste em uma rede interna privada que engloba os funcionário do suporte técnico. Tais funcionários são responsáveis pela administração e gerência de toda a infraestrutura da rede, servidores e terminais. Com grande responsabilidade em deixar o serviço das aplicações disponíveis e resolver qualquer problema que acontecer na infraestrutura. Para tanto, foi alocada a sub-rede **10.0.10.0/24** e as máquinas devem ser conectadas ao switch **s1**. Nesta VLAN, existe apenas uma estação de trabalho com endereço **10.0.10.100 (suporte)**.

- O roteador **r0** tem por objetivo provê a interconectividade entre todos as VLANs e a Internet. O **r0** consite em um roteador baseado em linux com um firewall integrado (**netfilter/iptables**), destinado a filtrar o tráfego passante.

### QUESTIONÁRIO GUIADO

Na **pasta x (moodle2)** contém o questionário guiado para execução do treinamento contendo todas as informações necessárias, dicas, imagens  da topologia em todas as questões e são mostradas uma por página. No formato Extensible Markup Language (XML), no entanto, realize o download do arquivo no moodle ou se preferir pode criar o próprio questionário. 

<<<EXPLICAR O PROCESSO PARA IMPORTAR NO MOODLE2???>>>

### REQUISITO PARA USABILIDADE

### TREINAMENTO

Este treinamento tem por objetivo a realização de exercícios simulados voltados para a detecção, diagnóstico e mitigação de ataques que estejam ocorrendo no cenário acima. Para tanto, usaremos o CyRM, um Cyber Range que utiliza o [Containernet](https://github.com/containernet/containernet) para emular a topologia de rede acima, bem como ataques direcionados a esta rede.

Para executar o cenário, siga a sequência passos a seguir. 

1) Abra seu terminal linux (teclas de atalho CTRL+ALT+T)

2) Clone a ferramenta do GitHub.

```
$ git clone https://github.com/rafaelpinheiroo1/cyrm.git
```
3) Entre na pasta cyrm.

4) Execute o script `environment_preparation.sh` para para a instação das dependência. Aguarde até a finalização do procedimento.
```
$ sudo ./environment_preparation.sh
```
5) Execute o script `start_cyrm.sh` para inicializar o ambiente. Aguarde até aparecer o CLI do containernet.
```
$ sudo ./start_cyrm.sh
```

**E pronto! Podemos começar a resolver este questionário! Opa, mas espere! Antes de iniciarmos o treinamento, seguem algumas dica de uso do CLI do containernet:**

### USANDO O CYRM

Para **executar os comandos nos dispositivos**, primeiramente digite o hostname que deseja e, logo após, o comando desejado, conforme o modelo a seguir:

`containernet> <hostname> comando` (executando comandos localmente em um host específico)

Seguem alguns exemplos:

`containernet> suporte ifconfig` (exibe o estado das interface de rede do hostname suporte)

`containernet> gustavo ps aux` (demonstra quais os processos estão ativo no hostname gustavo)

`containernet> servWeb cat arquivo.txt` (exibe o que tem no arquivo de texto no hostname servWeb)

Além disso, caso queria **simular a desconexão de cabos entre dois dispositivos**, basta digitar o comando abaixo:

`containernet> link <node1> <node2> down` (simulando a desconexão de cabos entre dois nós da topologia)

Finalmente, para **encerrar o cenário**, siga os seguintes passos:

1) Digite exit para sair do cenário.

`containertnet> exit`

Observação: Se caso o cenário travar, pressione CTRL + C para cancelar o processo.

2) Após o encerramento ser concluído, exclua todas as configurações do cenário anterior com o script `clean_cyrm.sh`.
```
$ sudo ./clean_cyrm.sh
```

### DOCUMENTAÇÃO





