#!/bin/bash

echo "⚙️ Running post-install hooks..."

# Reload Waybar
pkill waybar 2>/dev/null
waybar &

# Reload Hyprland config
hyprctl reload

echo "✅ UI refreshed!"

# Restart Waybar cleanly
pkill waybar
waybar &

# Fix ProtonVPN tray intelligently
fix-vpn-tray
