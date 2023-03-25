#!/bin/bash
# Check if DP-1 and DP-2 outputs are available before configuring them
xrandr_output=$(xrandr --query)
if [[ $xrandr_output == *"DP-1 connected"* && $xrandr_output == *"DP-2 connected"* ]]; then
    xrandr --output DP-1 --mode 1920x1080 --pos 0x0 --output DP-2 --mode 2560x1080 --pos 1920x0 --primary --output eDP-1 --mode 1920x1080 --pos 4480x0
else
    xrandr --output eDP-1 --mode 1920x1080 --pos 0x0
fi
