#!/bin/bash

echo "🚀 Setting up dotfiles (symlink mode)..."

CONFIG_DIR="$HOME/.config"
BIN_DIR="$HOME/.local/bin"
REPO_DIR="$HOME/meowrch-config"

mkdir -p "$CONFIG_DIR"
mkdir -p "$BIN_DIR"

# ------------------------
# Backup existing configs
# ------------------------
backup() {
  if [ -e "$1" ] && [ ! -L "$1" ]; then
    echo "📦 Backing up $1"
    mv "$1" "$1.backup"
  fi
}

# ------------------------
# Symlink function
# ------------------------
link() {
  echo "🔗 Linking $2 → $1"
  ln -sf "$1" "$2"
}

# ------------------------
# Configs
# ------------------------
backup "$CONFIG_DIR/hypr"
backup "$CONFIG_DIR/waybar"
backup "$CONFIG_DIR/pawlette"

link "$REPO_DIR/hypr" "$CONFIG_DIR/hypr"
link "$REPO_DIR/waybar" "$CONFIG_DIR/waybar"
link "$REPO_DIR/pawlette" "$CONFIG_DIR/pawlette"

# ------------------------
# Scripts
# ------------------------
for file in "$REPO_DIR/scripts/"*; do
  name=$(basename "$file")
  link "$file" "$BIN_DIR/$name"
done

chmod +x "$BIN_DIR/"*

echo "✅ Symlinks created!"
