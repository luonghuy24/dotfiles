#!/bin/bash
source "$HOME/.config/sketchybar/plugins/icon_map_fn.sh"

# Get current front app if INFO is empty (on startup/reload)
if [ -z "$INFO" ]; then
    APP_NAME=$(aerospace list-windows --focused --format '%{app-name}' | head -1)
else
    APP_NAME="$INFO"
fi

icon_map "$APP_NAME"
sketchybar --set "$NAME" \
    icon="$icon_result" \
    label="$APP_NAME"
