FROM alpine:latest
LABEL maintainer=”RafaelPinheiro”
RUN apk update
RUN apk add bash \
        tcpdump \
        iperf \
        busybox-extras \
        iproute2 \
        iputils
RUN apk --no-cache --update add build-base
RUN apk add git
RUN git clone https://github.com/vanhauser-thc/thc-hydra
RUN apk add libssh-dev
RUN cd /thc-hydra/ && ./configure
RUN cd /thc-hydra/ && make
RUN cd /thc-hydra/ && make install
COPY users.txt /
COPY password.txt /
COPY dic_attack_ssh.sh /
CMD ["/bin/sh","-c","/dic_attack_ssh.sh"]
