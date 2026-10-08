#!/usr/bin/env bash
set -euo pipefail

# Foliate (>= 2.x, GTK4) stores its preferences in GSettings/dconf, not in
# config.ini. This script loads the versioned dump from foliate.conf.
#
# Deploy:  ./dev-env   (copies env/.config -> $XDG_CONFIG_HOME)
# Usage:   bash ~/.config/com.github.johnfactotum.Foliate/apply-config.sh

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
conf="$dir/foliate.conf"

if [[ $EUID -eq 0 ]]; then
    echo "ERROR: do not run this with sudo, it would write to root's dconf."
    exit 1
fi

if [[ ! -f $conf ]]; then
    echo "ERROR: $conf not found"
    exit 1
fi

if ! ls /usr/share/glib-2.0/schemas/com.github.johnfactotum.Foliate.gschema.xml >/dev/null 2>&1; then
    echo "ERROR: the foliate package is missing (schema not installed)."
    exit 1
fi

if pgrep -x foliate >/dev/null 2>&1; then
    echo "WARN: foliate is running, close it or it will overwrite these values."
fi

dconf load /com/github/johnfactotum.Foliate/ <"$conf"

echo "OK: config loaded. theme -> $(gsettings get com.github.johnfactotum.Foliate.viewer.view theme)"