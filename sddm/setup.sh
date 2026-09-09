#!/usr/bin/env bash
# Installs sddm-custom (personal fork of sddm-astronaut-theme).
# Usage: sudo ./setup.sh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
THEME="sddm-custom"
DEST="/usr/share/sddm/themes/$THEME"

if [[ $EUID -ne 0 ]]; then
  echo "Run with sudo: sudo ./setup.sh"
  exit 1
fi

echo "-> copying theme to $DEST"
rm -rf "$DEST"
mkdir -p "$DEST"
cp -r "$SCRIPT_DIR/$THEME/." "$DEST/"

# Geist Mono font: sddm runs as the sddm user, so it can't see ~/.local/share/fonts
USER_HOME="$(getent passwd "${SUDO_USER:-$USER}" | cut -d: -f6)"
if fc-list | grep -qi "GeistMono Nerd Font"; then
  if [ -d "$USER_HOME/.local/share/fonts/GeistMonoNF" ] && [ ! -d /usr/share/fonts/GeistMonoNF ]; then
    echo "-> installing GeistMonoNF system-wide"
    cp -r "$USER_HOME/.local/share/fonts/GeistMonoNF" /usr/share/fonts/
    fc-cache -f >/dev/null
  fi
else
  echo "WARNING: GeistMono Nerd Font not found on the system"
fi

echo "-> writing /etc/sddm.conf"
printf '[Theme]\nCurrent=%s\n' "$THEME" > /etc/sddm.conf

mkdir -p /etc/sddm.conf.d
printf '[General]\nInputMethod=qtvirtualkeyboard\n' > /etc/sddm.conf.d/virtualkbd.conf

echo "OK: $THEME installed. Preview: sddm-greeter-qt6 --test-mode --theme $DEST"
