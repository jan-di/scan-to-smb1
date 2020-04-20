# SMB1-Proxy #

![](https://img.shields.io/docker/pulls/jandi/smb1-proxy)
![](https://img.shields.io/docker/image-size/jandi/smb1-proxy)

This container is used to proxy an existing secure smb share (version 2+) to allow devices, that only support cifs/smb v1 the access to a specific share or folder on the secure share - without downgrading the complete server to smb v1.

## Usage ##

Example docker-compose configuration:

```yml
version: '3.7'

services:
  smb1proxy:
    image: jandi/smb1-proxy
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
