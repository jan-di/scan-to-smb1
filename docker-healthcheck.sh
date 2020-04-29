#!/bin/sh

set -e

# check cifs mount (deactivated)
# UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
# touch /share/.scan-to-smb1-proxy.$UUID.healthcheck
# rm /share/.scan-to-smb1-proxy.$UUID.healthcheck

# see dockerfile from dperson/samba
smbclient -L \\localhost -U % -m SMB3
