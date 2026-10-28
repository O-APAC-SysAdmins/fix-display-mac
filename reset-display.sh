#!/bin/bash
# Reset macOS display (WindowServer) preferences.
# Fixes external monitors not being detected, e.g. after unplugging a TV.

if [ "$EUID" -eq 0 ]; then
    echo "Run this without sudo (it will ask for your password when needed)."
    exit 1
fi

echo "Removing user display preferences..."
rm -f ~/Library/Preferences/ByHost/com.apple.windowserver.*.plist

echo "Removing system display preferences (needs admin password)..."
sudo rm -f /Library/Preferences/com.apple.windowserver.displays.plist

echo "Done. Restart your Mac, then reconnect the external monitor."
