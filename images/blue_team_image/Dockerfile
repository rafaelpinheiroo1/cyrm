FROM ubuntu:latest
LABEL maintainer=”RafaelPinheiro”
RUN apt update -y
RUN apt install -y \ 
	bash \
	net-tools \
	iputils-ping \
	iproute2 \
	smbclient \	
	tshark \
	ssh
RUN apt-get install geoip-bin geoip-database -y
CMD ["/bin/sh"]

