#!/bin/bash

sketchybar --add item front_app left \
           --set front_app       background.color=$SURFACE_COLOR \
                                 icon.color=$TEXT_COLOR \
                                 icon.font="sketchybar-app-font:Regular:16.0" \
                                 icon.padding_left=16 \
                                 label.padding_right=16 \
                                 label.color=$TEXT_COLOR \
                                 background.corner_radius=5 \
                                 background.height=26 \
                                 padding_left=20 \
                                 padding_right=10 \
                                 background.border_width=1 \
                                 background.border_color=$ACCENT_COLOR \
                                 background.drawing=on \
                                 script="$PLUGIN_DIR/front_app.sh"            \
           --subscribe front_app front_app_switched
