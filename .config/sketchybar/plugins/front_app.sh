#!/bin/bash
source "$HOME/.config/sketchybar/plugins/icon_map_fn.sh"
APP_NAME="$INFO"
icon_map "$APP_NAME"
sketchybar --set "$NAME" icon="$icon_result" label="$APP_NAME"
