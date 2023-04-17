# vsftpd-server

## environment variables

### `FTP_CUSTOMIZATION`

turn on any additional functionality beyond the ubuntu image with vsftp installed.

the entrypoint checks for the presence of this variable at startup and starts `vsftpd` with the customized config file.

### `FTP_PASV_MAX_PORT`

edit the `pasv_max_port` entry in the customized config file before starting.

this restricts the passive port range.

### `FTP_PASV_MIN_PORT`

see `FTP_PASV_MAX_PORT`.

### `FTP_PASV_ADDRESS`

defaults to `127.0.0.1` - this is what gets sent in the `PASV` response.

### `FTP_USER`/`FTP_PASS`
