#!/bin/bash
CURRENT_LAYOUT=$(hyprctl devices -j | jq -r '.keyboards[] | select(.name == "at-translated-set-2-keyboard") | .active_keymap' | head -n 1)
notify-send -r 1000 "Раскладка: $CURRENT_LAYOUT" -t 2000

