#!/usr/bin/env bash

# Kill previous instances (if any)
pkill waybar
pkill swaync

# Optional small delay to ensure processes are killed before restarting
sleep 0.5

# Run your wallpaper copying script
$HOME/.dots/home/modules/scripts/copy-wallpaper.sh

# Launch new instances
waybar &
swaync &

wait
