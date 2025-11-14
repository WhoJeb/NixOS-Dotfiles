#!/bin/bash

WALL="/home/jeremiah/Pictures/Wallpapers/High Res/lucy.png"
# WALL="contain:/home/jeremiah/Pictures/Wallpapers/High Res/Nier_violin.png"

wal -i "$WALL"

hyprctl hyprpaper reload ,"$WALL"

WAYBAR_COLOR="$HOME/.cache/wal/colors-waybar.css"
WAYBAR_DIR="$HOME/.config/waybar"
WOFI_DIR="$HOME/.config/wofi"
cp "$WAYBAR_COLOR" "$WAYBAR_DIR"
cp "$WAYBAR_COLOR" "$WOFI_DIR"
