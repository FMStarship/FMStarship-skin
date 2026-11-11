#!/bin/sh
# Install the skin into Football Manager 27's skins folder on macOS, or remove it.
#
#   scripts/install.sh              build tokens, then copy skin/ to <skins>/fm-starship/
#   scripts/install.sh --uninstall  remove <skins>/fm-starship/
#
# Set FM27_SKINS to use another skins folder. This script writes only inside <skins>/fm-starship/.
set -eu

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SKINS="${FM27_SKINS:-$HOME/Library/Application Support/Sports Interactive/Football Manager 27/skins}"
DEST="$SKINS/fm-starship"

if [ "${1:-}" = "--uninstall" ]; then
    if [ -d "$DEST" ]; then
        rm -rf "$DEST"
        echo "Removed $DEST"
    else
        echo "Nothing to remove at $DEST"
    fi
    exit 0
fi

if [ ! -d "$(dirname "$SKINS")" ]; then
    echo "Football Manager 27's user folder wasn't found at $(dirname "$SKINS")." >&2
    echo "Start FM27 once, or set FM27_SKINS to your skins folder." >&2
    exit 1
fi

python3 "$ROOT/scripts/build-tokens.py"
mkdir -p "$DEST"
rsync -a --delete --exclude '.DS_Store' "$ROOT/skin/" "$DEST/"
echo "Installed to $DEST"
echo "In FM27: Preferences > Interface > Skin > FM Starship."
echo "After changing the skin, switch to FM's default skin and back to reload it."
