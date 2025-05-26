#!/usr/bin/env bash

# Path to your Waypaper config
CONFIG_FILE="$HOME/.config/waypaper/config.ini"

# Extract the wallpaper path using grep and sed
WALLPAPER=$(grep '^wallpaper *= *' "$CONFIG_FILE" | sed 's/^wallpaper *= *//')

# Expand tilde manually since it's not expanded in ini files
WALLPAPER="${WALLPAPER/#\~/$HOME}"

# Copy to rofi background image path
cp "$WALLPAPER" "$HOME/.config/rofi/images/rofi-bg.png"
