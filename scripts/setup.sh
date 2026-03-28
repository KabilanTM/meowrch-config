#!/bin/bash

echo "🚀 Applying Meowrch config..."

# Create dirs
mkdir -p ~/.config
mkdir -p ~/.local/bin

# Copy configs
cp -r hypr ~/.config/
cp -r waybar ~/.config/
cp -r pawlette ~/.config/

# Scripts
cp -r scripts/* ~/.local/bin/

# Permissions
chmod +x ~/.local/bin/*

echo "✅ Done! Restart Hyprland."
