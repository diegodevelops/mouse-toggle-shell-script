#!/bin/bash

# Function to send notification
send_notification() {
    osascript -e "display notification \"$1\" with title \"Mouse Connector\""
}

# Use full path to blueutil
BLUEUTIL="/opt/homebrew/bin/blueutil"  # Change this to your actual path

# Get list of paired Bluetooth devices and find Apple mouse/trackpad
MOUSE_ADDRESS=$($BLUEUTIL --paired | grep -i "magic mouse\|magic trackpad" | head -n 1 | awk -F', ' '{print $1}' | awk '{print $2}')

if [ -z "$MOUSE_ADDRESS" ]; then
    send_notification "No Apple mouse found in paired devices"
    exit 1
fi

# Check if mouse is currently connected
IS_CONNECTED=$($BLUEUTIL --is-connected "$MOUSE_ADDRESS")

if [ "$IS_CONNECTED" = "1" ]; then
    # Disconnect
    send_notification "Disconnecting mouse..."
    $BLUEUTIL --disconnect "$MOUSE_ADDRESS"
    sleep 2
    
    if [ "$($BLUEUTIL --is-connected "$MOUSE_ADDRESS")" = "0" ]; then
        send_notification "Mouse disconnected ✓"
    else
        send_notification "Failed to disconnect ✗"
    fi
else
    # Connect
    send_notification "Connecting to mouse..."
    $BLUEUTIL --connect "$MOUSE_ADDRESS"
    sleep 2
    
    if [ "$($BLUEUTIL --is-connected "$MOUSE_ADDRESS")" = "1" ]; then
        send_notification "Mouse connected ✓"
    else
        send_notification "Failed to connect ✗"
    fi
fi