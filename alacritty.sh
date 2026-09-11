#!/bin/bash
# Variables
NAME="Alacritty"
SRC="./alacritty"
TARGET="$HOME/.config/alacritty"
# If there is a config file in target.
if [ -d "$TARGET" ] || [ -L "$TARGET" ]; then
    # Format backup path
    BACKUP="${TARGET}_$(date +%Y-%m-%d_%H:%M:%S).backup"

    # Backup the existing config before copying new dotfiles there.
    cp -rf "$TARGET" "$BACKUP"
    echo "WARNING! Found existing config at $TARGET, making backup in $BACKUP"
else
    # Make target directory if there isn't a config.
    mkdir -p "$TARGET"
fi
# Copy dotfiles over to the target.
cp -rf "$SRC/." "$TARGET"
echo "$NAME config installed!"