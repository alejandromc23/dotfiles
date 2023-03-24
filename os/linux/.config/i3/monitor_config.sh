#!/bin/bash
# Check if DP-1 and DP-2 outputs are available before configuring them
xrandr_output=$(xrandr --query)
if [[ $xrandr_output == *"DP-1 connected"* && $xrandr_output == *"DP-2 connected"* ]]; then
    xrandr --output DP-1 --mode 1920x1080 --pos 0x0 --output DP-2 --mode 2560x1080 --pos 1920x0 --primary --output eDP-1 --mode 1920x1080 --pos 4480x0
else
    xrandr --output eDP-1 --mode 1920x1080 --pos 0x0
fi

if xrandr | grep "DP-1 connected" && xrandr | grep "DP-2 connected"
then
    # Set up workspaces on specific monitors
    workspace 1 output DP-2
    workspace 2 output DP-1
    workspace 3 output DP-1
    workspace 4 output eDP-1
    workspace 5 output eDP-1
    workspace 6 output eDP-1
    workspace 7 output eDP-1
else
    # Set up workspaces for a single screen
    workspace 1 output eDP-1
    workspace 2 output eDP-1
    workspace 3 output eDP-1
    workspace 4 output eDP-1
    workspace 5 output eDP-1
    workspace 6 output eDP-1
    workspace 7 output eDP-1
endif
