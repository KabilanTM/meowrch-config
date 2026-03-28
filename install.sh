#!/bin/bash

echo "🚀 Installing packages..."

# ------------------------
# 1. Install pacman packages
# ------------------------
echo "📦 Installing official packages..."
sudo pacman -Syu --needed - <pkglist.txt

# ------------------------
# 2. Install yay (if missing)
# ------------------------
if ! command -v yay &>/dev/null; then
  echo "⚙️ Installing yay..."
  sudo pacman -S --needed base-devel git
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  cd ..
fi

# ------------------------
# 3. Install AUR packages
# ------------------------
echo "📦 Installing AUR packages..."
while read pkg; do
  yay -S --needed "$pkg" || echo "⚠️ Skipped $pkg"
done <aurlist.txt

echo "✅ All packages installed!"
