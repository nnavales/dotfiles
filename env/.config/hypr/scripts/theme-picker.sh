#!/usr/bin/env bash
set -euo pipefail

ls ~/.config/colors | grep -v scripts | grep -v current | rofi -dmenu -p "Theme" | xargs -r ~/.config/colors/scripts/theme-switch.sh
