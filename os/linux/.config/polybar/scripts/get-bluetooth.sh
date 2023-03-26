#!/bin/bash

# Check if Bluetooth is enabled
bluetooth_status=$(rfkill list bluetooth | awk '/Soft blocked/ {print $3}')

if [ "$bluetooth_status" = "no" ]; then
    connected_devices=""
    paired_devices=$(bluetoothctl paired-devices | awk '{print $2}')
    for device in $paired_devices
    do
        info=$(bluetoothctl info $device)
        if [[ $info =~ "Connected: yes" ]]; then
            name=$(echo "$info" | awk '/Name:/ {print $2}')
            if [ -z "$connected_devices" ]; then
                connected_devices="$name"
            else
                connected_devices="$connected_devices, $name"
            fi
        fi
    done

    if [ -z "$connected_devices" ]; then
        echo  " "
        return
    fi

    if [[ $connected_devices =~ "AirPods" ]]; then
        # Insert command to display AirPods icon
        echo -n " 󰋋"
    fi
    if [[ $connected_devices =~ "Keychron" ]]; then
        # Insert command to display keyboard icon
        echo -n " 󰌓"
    fi
else
    echo ""
fi
