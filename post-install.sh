#!/bin/bash

echo "⚙️ Running post-install hooks..."

# Reload Waybar
pkill waybar 2>/dev/null
waybar &

# Reload Hyprland config
hyprctl reload

echo "✅ UI refreshed!"
