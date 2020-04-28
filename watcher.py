#!/usr/bin/env python3

import time
import glob
import os
import shutil

print('File watcher started')

while True:
  files = glob.glob('/share/*.pdf')
  for file in files:
    currentTime = time.time()
    modifiedTime = os.path.getmtime(file)
    fileAge = currentTime - modifiedTime
    if fileAge < 15:
      continue

    _, filename = os.path.split(file)
    name, ext = os.path.splitext(filename) 

    i = 0
    while True:
      i = i + 1
      remotePath = "/remote/" + name + "_" + str(i) + ext
      if not os.path.exists(remotePath):
        break
    
    try:
      print("Move Scan: '" + file + "' -> '" + remotePath + "'")
      shutil.copyfile(file, remotePath)
      os.remove(file)
    except (FileNotFoundError, OSError) as err:
      print("↳ " + str(err))
      
  time.sleep(5)