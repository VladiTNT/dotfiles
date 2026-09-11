# My Dotfiles
These are my custom configuration files that I use for applications on my systems.

## Install script
```bash
#!/bin/bash
# Variables
NAME="..."
SRC="..."
TARGET="$HOME/.config/..."
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
```

All of the bash scripts that have the same name as a config directory use this script as a template. The script first checks if the configuration exists at the **target path**, if so it makes a backup of it, otherwise it just makes the directory. After that, it copies the configuration files from the source directory to the target directory. The reason why it doesn't just replace the target with the source is because some apps such as **NeoVim** add things like *.lock* files to the config which we would like to keep after the installation of a new config iteration.