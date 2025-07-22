#!/bin/bash
source "$HOME/.config/sketchybar/plugins/icon_map_fn.sh"

# Get the currently focused workspace if FOCUSED_WORKSPACE is not set
if [ -z "$FOCUSED_WORKSPACE" ]; then
  FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)
fi

# Always build the label with workspace number and app icons
icon_strip="$1"
apps=$(aerospace list-windows --workspace "$1" --format '%{app-name}')
if [ -n "$apps" ]; then
  icon_strip+=" -"
  while IFS= read -r app; do
    icon_map "$app"
    icon_strip+=" $icon_result"
  done <<< "$apps"
else
  icon_strip+=" - —"
fi

# Set background drawing based on whether this is the focused workspace
if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set "$NAME" \
    label="$icon_strip" \
    background.color=0xff313244 \
    background.border_width=1 \
    background.border_color=0xffcba6f7 \
    icon.shadow.drawing=on \
    background.drawing=on
else
  sketchybar --set "$NAME" \
    label="$icon_strip" \
    background.color=0xff313244 \
    background.border_color=0xff313244 \
    background.drawing=off
fi
