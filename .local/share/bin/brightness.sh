#!/bin/bash

old_brightness=$(brightnessctl get)

if [[ $1 == "up" ]]; then
    brightnessctl set 10%+
elif [[ $1 == "down" ]]; then
    brightnessctl set 10%-
fi

if [[ $old_brightness != $(brightnessctl get) ]]; then
    SWO_ID=brightness $HOME/programming/python/swo/swo.py "brightness: $(brightnessctl | grep -Po '\d+(?=%)')%"
fi
