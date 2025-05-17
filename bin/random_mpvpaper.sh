#!/bin/bash

WALLPAPER_DIR="$HOME/Wallpapers/Live"
MONITOR="eDP-1"

VIDEO=$(find "$WALLPAPER_DIR" -type f \( -iname '*.mp4' -o -iname '*.webm' \) | shuf -n1)

pkill -f "mpvpaper $MONITOR"

mpvpaper -p -s -o "--no-audio --loop --fps=60" "$MONITOR" "$VIDEO" &

