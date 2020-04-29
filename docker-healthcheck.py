#!/usr/bin/env python3

import os, subprocess

fail = False

i = 0
while True:
  i = i + 1
  shareEnable = os.getenv('PROXY{}_ENABLE'.format(i))
  if shareEnable == None:
    break
  elif not shareEnable == "1":
    continue

  remoteMount = '/remote{}'.format(i)

  try:
    file = open(remoteMount + "/healthcheck.txt", "w") 
    file.write("healthcheck") 
    file.close()
  except OSError:
    fail = True
    print(remoteMount + " is not writeable")

ret = subprocess.call("smbclient -L \\localhost -U % -m SMB3", shell=True)
if ret != 0:
  fail = True
  print("Samba Server is not reachable")

if fail:
  exit(1)

print("Container is healthy")
exit(0)