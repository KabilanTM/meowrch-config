#!/usr/bin/env bash

sink=$(pactl info | grep "Default Sink" | awk -F': ' '{print $2}')

# If bluetooth device
if [[ $sink == bluez_output* ]]; then
  mac=$(echo $sink | sed 's/bluez_output\.//' | cut -d'.' -f1 | tr '_' ':')
  name=$(bluetoothctl info $mac | grep "Name" | awk -F': ' '{print $2}')
  echo "󰂯 $name"
else
  echo "󰕾 Speakers"
fi
