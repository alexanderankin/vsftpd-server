FROM ubuntu:22.04

RUN \
    apt-get update && \
    apt-get install -y vsftpd && \
    rm -rf ./var/lib/apt/

COPY vsftpd-custom.conf /etc/

ENTRYPOINT vsftpd
