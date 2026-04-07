#!/bin/sh

source "$CONFIG_DIR/icon_map.sh"

if [ "$SENDER" = "front_app_switched" ]; then
  __icon_map "$INFO"
  sketchybar --set "$NAME" icon="$icon_result"
fi
