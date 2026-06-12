#!/usr/bin/env bash
set -euo pipefail

WALL_DIR="$HOME/.local/share/wallpapers"
CONF="$HOME/.config/hypr/hyprpaper.conf"
THEME="$HOME/.config/rofi/wallpaper.rasi"

# Pick a wallpaper with rofi (grid + thumbnails).
choice="$(
    for f in "$WALL_DIR"/*; do
        [ -f "$f" ] || continue
        printf '%s\x00icon\x1f%s\n' "$(basename "$f")" "$f"
    done | rofi -dmenu -i -p "Wallpaper" -show-icons -theme "$THEME" \
        -kb-element-next "Control+n" -kb-element-prev "Control+p" \
        -kb-row-up "Up" -kb-row-down "Down"
)"

[ -z "${choice:-}" ] && exit 0
WALL="$WALL_DIR/$choice"
[ -f "$WALL" ] || {
    echo "Not found: $WALL"
    exit 1
}

# Make sure exactly one hyprpaper is running.
if ! pgrep -x hyprpaper >/dev/null; then
    hyprpaper >/dev/null 2>&1 &
    sleep 0.5
fi

MONITORS="$(hyprctl monitors | awk '/^Monitor/ {print $2}')"
for m in $MONITORS; do
    hyprctl hyprpaper wallpaper "$m,$WALL" >/dev/null
done

# Persist so it survives a restart.
# `preload` is required for hyprpaper to load the image on startup;
# without it the `wallpaper` blocks are ignored when reading the config.
{
    echo ""
    for m in $MONITORS; do
        echo "wallpaper {"
        echo "        monitor = $m"
        echo "        path = $WALL"
        echo "    }"
    done
    echo ""
} >"$CONF"

echo "Wallpaper set: $choice"
