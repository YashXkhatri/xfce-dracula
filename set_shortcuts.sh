#!/bin/bash

# Path to your shortcuts file
SHORTCUTS_FILE="config/shortcuts.conf"

# Check if the shortcuts file exists
if [[ ! -f "$SHORTCUTS_FILE" ]]; then
    echo "Shortcuts file not found: $SHORTCUTS_FILE"
    exit 1
fi

# Read the shortcuts file line by line
while IFS= read -r line; do
    # Skip empty lines and comments
    [[ -z "$line" || "$line" =~ ^# ]] && continue
    
    # Split the line into key and command
    IFS='=' read -r key command <<< "$line"
    
    # Trim whitespace
    key=$(echo "$key" | xargs)
    command=$(echo "$command" | xargs)

    # Apply the shortcut using xfconf-query
    xfconf-query -c xfce4-keyboard-shortcuts -p "$key" -s "$command" || {
        echo "Failed to set shortcut: $key = $command"
    }
done < "$SHORTCUTS_FILE"

echo "Keyboard shortcuts updated!"
