#!/bin/bash

for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change front_app_switched \
        --set space.$sid \
        background.color=$SURFACE_COLOR \
        background.corner_radius=5 \
        background.height=26 \
        background.drawing=off \
        label="$sid" \
        label.font="sketchybar-app-font:Regular:16.0" \
        label.padding_right=20 \
        label.y_offset=0 \
        label.color=$TEXT_COLOR \
        click_script="aerospace workspace $sid" \
        script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done
