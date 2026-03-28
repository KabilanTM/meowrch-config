#!/usr/bin/env bash

ssid=$(iw dev | awk '$1=="ssid"{print $2}')
signal_dbm=$(iw dev | awk '$1=="signal:"{print $2}')

signal=$(((signal_dbm + 100) * 2))

if [ "$signal" -gt 100 ]; then signal=100; fi
if [ "$signal" -lt 0 ]; then signal=0; fi

if [ -z "$ssid" ]; then
  echo "<span color=\"#f38ba8\">󰤭 Disconnected</span>"
else
  if [ "$signal" -gt 70 ]; then
    color="#a6e3a1" # green
  elif [ "$signal" -gt 40 ]; then
    color="#f9e2af" # yellow
  else
    color="#f38ba8" # red
  fi

  echo "<span color=\"$color\">󰤨 $ssid</span> <span color=\"#fab387\">${signal}%</span>"
fi
