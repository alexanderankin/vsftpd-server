#!/usr/bin/env bash

if [[ ! -z ${FTP_CUSTOMIZATION} ]]; then
	vsftpd /etc/vsftpd-custom.conf
else
	vsftpd /etc/vsftpd.conf
fi
