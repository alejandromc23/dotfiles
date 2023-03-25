#!/bin/bash

wifi_icon=""
no_wifi_icon="睊"
ssid=$(nmcli -t -f active,ssid dev wifi | awk -F: '/^sí:/ {print $2}')

if [ -n "$ssid" ]; then
  echo "$wifi_icon  $ssid"
else
  echo "$no_wifi_icon  No wifi"
fi

