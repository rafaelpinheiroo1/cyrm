
#!/bin/bash

docker run --name containernet -it --rm --privileged --pid='host' -v /var/run/docker.sock:/var/run/docker.sock -v ~/cyrm/topology:/cyrm containernet/containernet python3 /cyrm/scenario-1.py















