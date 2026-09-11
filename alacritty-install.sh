#!/bin/bash
# Source directory for config.
SRC="./alacritty"
# Target directory for config
TARGET="$HOME/.config/alacritty"

# If the there is a config at the target path already, make a backup.
if [ -d "$TARGET" ] || [ -L "$TARGET" ]; then
    # Format backup path
    BACKUP="${TARGET}_$(date +%Y-%m-%d_%H:%M:%S).backup"
    echo "Note: found existing config at $TARGET, making a backup in $BACKUP"

    # Backup the existing config before copying new dotfiles there.
    cp -rf "$TARGET" "$BACKUP"
else
    # Make target directory if there isn't a config.
    mkdir -p "$TARGET"
fi

# Copy dotfiles over to the target.
cp -rf "$SRC/." "$TARGET"