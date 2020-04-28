# Scan-to-SMB1 #

[
  ![](https://img.shields.io/docker/v/jandi/scan-to-smb1)
  ![](https://img.shields.io/docker/pulls/jandi/scan-to-smb1)
  ![](https://img.shields.io/docker/stars/jandi/scan-to-smb1)
  ![](https://img.shields.io/docker/image-size/jandi/scan-to-smb1)
  ![](https://img.shields.io/docker/cloud/build/jandi/scan-to-smb1)
](https://hub.docker.com/repository/docker/jandi/scan-to-smb1)

This container is used to proxy an existing secure smb share (version 2+) to allow legacy scanning devices, that only support cifs/smb v1 the access to a specific share or folder on the secure share - without downgrading the complete server to smb v1. Its designed to forward all files to the secure share, without overwriting files on the destination

* GitHub: [jan-di/scan-to-smb1](https://github.com/jan-di/scan-to-smb1)
* Docker Hub: [jandi/scan-to-smb1](https://hub.docker.com/repository/docker/jandi/scan-to-smb1)

## Usage ##

Example docker-compose configuration:

```yml
version: '3.7'

services:
  smb1proxy:
    image: jandi/scan-to-smb1
    environment:
      TZ: 'Europe/Berlin'
      USERID: 1000
      GROUPID: 1000
      PROXY_SHARE: legacyshare
      PROXY_USERNAME: user
      PROXY_PASSWORD: password
      SERVER_SHARE: //secure-host/share/path/to/folder
      SERVER_DOMAIN: DOM
      SERVER_USERNAME: User
      SERVER_PASSWORD: password
    ports:
      - "445:445/tcp"
    tmpfs:
      - /tmp
    restart: unless-stopped
    stdin_open: true
    tty: true
    privileged: true
```
