#!/usr/bin/env bash

if [[ ! -z ${FTP_CUSTOMIZATION} ]]; then
	[[ -z ${FTP_PASV_MAX_PORT} ]] || sed -i "s/pasv_max_port.*/pasv_max_port=$FTP_PASV_MAX_PORT/" /etc/vsftpd-custom.conf
	[[ -z ${FTP_PASV_MIN_PORT} ]] || sed -i "s/pasv_min_port.*/pasv_min_port=$FTP_PASV_MIN_PORT/" /etc/vsftpd-custom.conf
	[[ -z ${FTP_PASV_ADDRESS} ]] || sed -i "s/pasv_address=.*/pasv_address=$FTP_PASV_ADDRESS/" /etc/vsftpd-custom.conf

	[[ -z ${FTP_USER} ]] || adduser --disabled-password --gecos "" $FTP_USER > /dev/null \
		&& echo created user \
		|| echo creating user failed
	[[ -z ${FTP_PASS} ]] || chpasswd <<< $FTP_USER:$FTP_PASS

	echo starting custom server
	vsftpd /etc/vsftpd-custom.conf
else
	echo starting server
	vsftpd /etc/vsftpd.conf
fi
