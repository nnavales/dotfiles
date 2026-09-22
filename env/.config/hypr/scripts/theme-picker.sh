#!/usr/bin/env bash
# Theme picker matching the system menu style (icons + current marker).
set -euo pipefail

COLORS_DIR="${COLORS_DIR:-$HOME/.config/colors}"
CURRENT_LINK="$COLORS_DIR/current"
SWITCH="$COLORS_DIR/scripts/theme-switch.sh"
THEME="${ROFI_POWER_THEME:-$HOME/.config/rofi/power.rasi}"

current=""
if [ -L "$CURRENT_LINK" ]; then
  current="$(basename "$(readlink "$CURRENT_LINK")")"
fi

entries=""
for d in "$COLORS_DIR"/*/; do
  b="$(basename "$d")"
  [ "$b" = "scripts" ] && continue
  [ "$b" = "$current" ] && continue
  entries+="$b"'\n'
done
entries="${entries%$'\n'}"
[ -z "$entries" ] && exit 0

choice="$(
  printf "%b" "$entries" | rofi -dmenu -i -no-custom -markup-rows \
    -theme "$THEME" -p "󰸞 " -mesg "Theme"
)" || exit 0
[ -z "${choice:-}" ] && exit 0

# Strip icon, markup and current-marker → plain theme name.
name="$(printf "%s" "$choice" | sed -e 's/<[^>]*>//g' -e 's/●//g' | awk '{print $NF}')"
[ -z "$name" ] && exit 0

exec "$SWITCH" "$name"
