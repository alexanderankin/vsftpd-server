FROM ubuntu:22.04

RUN \
    apt-get update && \
    apt-get install -y vsftpd && \
    rm -rf ./var/lib/apt/lists

COPY vsftpd-custom.conf /etc/
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
