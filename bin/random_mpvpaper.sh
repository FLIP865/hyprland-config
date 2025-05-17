#!/bin/bash

WALLPAPER_DIR="$HOME/Wallpapers/Live"
MONITOR="eDP-1"

# Случайное видео
VIDEO=$(find "$WALLPAPER_DIR" -type f \( -iname '*.mp4' -o -iname '*.webm' \) | shuf -n1)

# Завершить предыдущее
pkill -f "mpvpaper $MONITOR"

# Запуск с mpvpaper-опциями и mpv-опциями внутри -o
mpvpaper -p -s -o "--no-audio --loop --fps=60" "$MONITOR" "$VIDEO" &

