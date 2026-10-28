# fix-display-mac

Resets the macOS display settings when an external monitor stops being detected.

Tested on macOS 26 Tahoe.

## When to use

The Mac no longer detects an external monitor (often after it was plugged into a TV and then unplugged), but:

- the monitor doesn't appear in System Settings > Displays, not even under Advanced
- trying another USB-C port doesn't help
- the same dongle and monitor work fine on another Mac
- this Mac works with a different dongle or monitor

In that case the saved display settings on this Mac are probably corrupted. This script deletes them so macOS creates new ones.

## What it does

Deletes these files:

```
~/Library/Preferences/ByHost/com.apple.windowserver.*.plist
/Library/Preferences/com.apple.windowserver.displays.plist
```

macOS creates them again on the next boot. Any custom display arrangement, resolution or main-display choice will be reset to the defaults.

## Usage

```bash
chmod +x reset-display.sh
./reset-display.sh
```

Don't run it with `sudo`. The script asks for your admin password when it needs it.

Then:

1. Restart the Mac.
2. Reconnect the external monitor.
