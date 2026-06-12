#!/usr/bin/env bash
set -euo pipefail

THEME="${1:-}"
COLORS_DIR="$HOME/.config/colors"
CURRENT_LINK="$COLORS_DIR/current"

usage() {
    echo "Usage: theme-switch.sh <theme>"
    echo ""
    echo "Available themes:"
    for d in "$COLORS_DIR"/*/; do
        b="$(basename "$d")"
        [ "$b" != "scripts" ] && echo "  - $b"
    done
    exit 0
}

if [ -z "$THEME" ]; then
    if [ -L "$CURRENT_LINK" ]; then
        echo "Current theme: $(basename "$(readlink "$CURRENT_LINK")")"
    fi
    echo ""
    usage
fi

THEME_DIR="$COLORS_DIR/$THEME"
if [ ! -d "$THEME_DIR" ]; then
    echo "Error: theme '$THEME' not found"
    echo ""
    usage
fi

echo "Switching to theme: $THEME"
ln -sfn "$THEME_DIR" "$CURRENT_LINK"

# symlinks (apps without include support)
ln -sf "$CURRENT_LINK/waybar.css" "$HOME/.config/waybar/style.css"
ln -sf "$CURRENT_LINK/dunstrc" "$HOME/.config/dunst/dunstrc"
ln -sf "$CURRENT_LINK/eza.yaml" "$HOME/.config/eza/theme.yaml"
ln -sf "$CURRENT_LINK/yazi-theme.toml" "$HOME/.config/yazi/theme.toml"

# native theme dirs
mkdir -p "$HOME/.config/btop/themes"
cp "$THEME_DIR/btop.theme" "$HOME/.config/btop/themes/$THEME.theme"
mkdir -p "$HOME/.config/opencode/themes"
cp "$THEME_DIR/theme-opencode.json" "$HOME/.config/opencode/themes/$THEME.json"
mkdir -p "$HOME/.config/bat/themes"
cp "$THEME_DIR/bat.tmTheme" "$HOME/.config/bat/themes/current-theme.tmTheme"
