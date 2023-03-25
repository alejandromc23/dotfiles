# git function to add comment to the commit
function gc {
  git add -A

  if [ -z "$1" ]; then
    git commit -S
  else
    git commit -S -m"$1"
  fi
}

# function to remove selected containers
function docker_remove {
    container_ids=$(docker ps --format "{{.ID}} {{.Names}}" | fzf --multi | awk '{print $1}')

    echo "Stopping Containers"
    echo $container_ids | xargs docker stop
    
    echo "Removing Containers"
    echo $container_ids | xargs docker rm
}

# load lazy nvm
function load_nvm {
  fname=$(declare -f -F lazy_nvm)

  [ -n "$fname" ] || source "$DOTFILES_PATH/shell/lazy/lazy_nvm.sh"

  lazy_nvm "$1"
}

function show_open_files {
  selected=$(ps axc | awk 'NR > 1' | awk '{print substr($0,index($0,$5))}' | sort -u | fzf)

  if [ ! -z $1 ]; then
    lsof -r 2 -c "$selected"
  else
    lsof -c "$selected"
  fi
}

# function to toggle bluetooth connection state
function bt_toggle {
    # Get a list of paired Bluetooth devices
    devices=$(bluetoothctl paired-devices | grep Device | awk '{print $2}')

    # Loop through the devices and get their names and connection status
    device_list=""
    while read -r device; do
        name=$(bluetoothctl info "$device" | grep "Name: " | awk '{print substr($0, index($0,$2))}')
        connected=$(bluetoothctl info "$device" | grep "Connected: " | awk '{print $2}')
        device_list+="$device $name $connected\n"
    done <<< "$devices"

    # Use fzf to select a device to toggle the connection state
    selected_device=$(echo -e "$device_list" | fzf --with-nth=2..)

    # If a device was selected, toggle the connection state
    if [ -n "$selected_device" ]; then
      device=$(echo "$selected_device" | awk '{print $1}')
      connected=$(echo "$selected_device" | awk '{print $NF}')
      
      echo "Toggling device: $selected_device"
      
      if [[ "$connected" =~ ^yes$ ]]; then
        bluetoothctl disconnect "$device"
      else
        bluetoothctl connect "$device"
      fi
    fi
}

function set_monitors {
  xrandr_output=$(xrandr --query)
  if [[ $xrandr_output == *"DP-1 connected"* && $xrandr_output == *"DP-2 connected"* ]]; then 
    xrandr --output DP-1 --mode 1920x1080 --pos 0x0 \
      --output DP-2 --mode 2560x1080 --pos 1920x0 --primary \
      --output eDP-1 --mode 1920x1080 --pos 4480x0
    return
  fi
  
  xrandr --output DP-1 --off &> /dev/null

  xrandr --output DP-2 --off &> /dev/null

  xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --primary
}
