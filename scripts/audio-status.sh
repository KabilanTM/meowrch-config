#!/usr/bin/env bash

sink=$(pactl info | grep "Default Sink" | awk -F': ' '{print $2}')
vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -n1 | tr -d '%')
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

# volume color logic
if [ "$vol" -le 30 ]; then
  vcolor="#a6e3a1" # green
elif [ "$vol" -le 70 ]; then
  vcolor="#f9e2af" # yellow
else
  vcolor="#f38ba8" # red
fi

# muted state
if [ "$mute" = "yes" ]; then
  echo "<span color=\"#f38ba8\">󰝟 Muted</span>"
  exit
fi

# bluetooth device
if [[ $sink == bluez_output* ]]; then
  mac=$(echo $sink | sed 's/bluez_output\.//' | cut -d'.' -f1 | tr '_' ':')
  name=$(bluetoothctl info $mac | grep "Name" | awk -F': ' '{print $2}')
  echo "<span color=\"#89b4fa\">󰂯 $name</span> <span color=\"$vcolor\">$vol%</span>"
else
  echo "<span color=\"#a6e3a1\">󰕾 Speakers</span> <span color=\"$vcolor\">$vol%</span>"
fi
