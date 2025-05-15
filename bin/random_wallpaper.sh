#!/bin/bash

# Путь к папке с обоями
WALLPAPER_DIR="$HOME/Wallpapers"
CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"

# Проверяем существует ли папка
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Ошибка: папка не найдена"
    exit 1
fi

# Выбераем случайный файл из папки
RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Проверяем найден ли файл
if [ -z "$RANDOM_WALLPAPER" ]; then
    echo "Ошибка: в папке нет картинкок"
    exit 1
fi

hyprctl hyprpaper preload "$RANDOM_WALLPAPER"
hyprctl hyprpaper wallpaper "LVDS-1,$RANDOM_WALLPAPER"

# Записуем путь в конфиг hyprpaper
echo "preload = $RANDOM_WALLPAPER" > "$CONFIG_FILE"
echo "wallpaper = LVDS-1,$RANDOM_WALLPAPER" >> "$CONFIG_FILE"
