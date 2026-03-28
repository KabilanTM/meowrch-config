#!/usr/bin/env bash

temp=$(sensors | grep "Package id 0" | awk '{print $4}' | tr -d '+°C')

# Convert float → integer (52.0 → 52)
temp_int=${temp%.*}

if [ "$temp_int" -lt 60 ]; then
  color="#a6e3a1"
elif [ "$temp_int" -lt 80 ]; then
  color="#fab387"
else
  color="#f38ba8"
fi

echo "<span color=\"$color\"> ${temp}°C</span>"
