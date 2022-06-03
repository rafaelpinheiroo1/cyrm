FROM alpine:latest
LABEL maintainer=”RafaelPinheiro”
RUN apk update
RUN apk add bash \
        tcpdump \
        iperf \
        busybox-extras \
        iproute2 \
        iputils
RUN apk add hping3 --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing
COPY ddos.sh /
CMD ["/bin/sh","-c","/ddos.sh"]
