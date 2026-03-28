#!/usr/bin/env bash

current=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}')

choice=$(printf "Increase\nDecrease\nMute\nOpen Mixer" | rofi -dmenu -p "Volume ($current%)")

case "$choice" in
Increase)
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
  ;;
Decrease)
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
  ;;
Mute)
  wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
  ;;
"Open Mixer")
  pavucontrol
  ;;
esac
