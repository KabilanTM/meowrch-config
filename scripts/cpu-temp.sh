#!/usr/bin/env bash

temp=$(sensors | grep "Package id 0" | awk '{print $4}' | tr -d '+°C')

if [ "$temp" -lt 60 ]; then
  color="#a6e3a1"
elif [ "$temp" -lt 80 ]; then
  color="#fab387"
else
  color="#f38ba8"
fi

echo "<span color=\"$color\"> ${temp}°C</span>"
