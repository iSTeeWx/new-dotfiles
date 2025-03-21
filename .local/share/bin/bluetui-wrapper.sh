#!/bin/bash

bluetui 2> /dev/null

# if there was an error start the bluetooth service
if test $? -eq 1
then
  echo "[wrapper] starting bluetooth"
  sudo systemctl start bluetooth
  bluetui
fi
