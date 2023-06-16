#!/bin/bash

sleep 1 # wait for 1 seconds before configuring monitors
xrandr --output eDP-1 --mode 1920x1080 --pos 0x0

xrandr_output=$(xrandr --query)
if [[ $xrandr_output == *"DP-1 connected"* && $xrandr_output == *"DP-2 connected"* ]]; then
    xrandr --output DP-1 --mode 1920x1080 --pos 0x0 \
           --output DP-2 --mode 2560x1080 --pos 1920x0 --primary \
           --output eDP-1 --mode 1920x1080 --pos 1920x1080
fi

# set wallpaper
feh --bg-fill $HOME/Imágenes/lofi.jpg

# add transparency
compton
