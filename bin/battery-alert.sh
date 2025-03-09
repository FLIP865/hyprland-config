#!/bin/bash

THRESHOLD=30

SOUN_FILE="/usr/share/sounds/freedesktop/stereo/power-plug.oga"

while true; do
    # Получаем уровень зарадя батареи 
    BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    if [[ "$STATUS" == "Discharging" && "$BATTERY_LEVEL" -le "$THRESHOLD" ]]; then
        notify-send "The battery is running low!" "Charge: $BATTERY_LEVEL%" -u critical -t 5000
        paplay "$SOUN_FILE"
        sleep 60
    else
        sleep 300
    fi
done
