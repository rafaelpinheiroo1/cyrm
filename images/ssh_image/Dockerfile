FROM alpine:latest
LABEL maintainer="RafaelPinheiro"
RUN apk add --update --no-cache openssh \
	bash \
	tcpdump \
	iperf \
	busybox-extras \
	iproute2 \
	iputils 
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
RUN adduser -h /home/user -s /bin/sh -D user
RUN echo -n 'user:123456' | chpasswd
RUN echo -n 'root:123456' | chpasswd
RUN apk add --no-cache syslog-ng
RUN /usr/bin/ssh-keygen -A 
RUN ssh-keygen -t rsa -b 4096 -f /etc/ssh/ssh_host_key
EXPOSE 22
COPY pass.txt /root/
COPY start.sh /
CMD ["/bin/sh","-c","/start.sh"]
