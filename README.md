# Toggle Mouse Script Setup

## Add Script to Automator

1. Open Automator
2. Select "New Document"
3. Select Quick Action
   - At the top, set:
     - "Workflow receives" → no input
     - "in" → any application
4. In the search box on the left, search for "Run Shell Script"
5. Paste the script code in: `toggle-mouse-connection.sh`
6. Save it and name it "Toggle Mouse"
7. Since the script uses `blueutil`, you need to install it:
```bash
   brew install blueutil
```

## Add Keyboard Shortcut

1. Open System Settings
2. Type "keyboard" in the top left search box and select it once the "Keyboard" option appears
3. Select "Keyboard Shortcuts…"
4. In the left options, select "Services"
5. Scroll down to General section
6. Find "Toggle Mouse" (your saved Automator action)
7. Check the box next to it
8. Click on the right side where it says "none" or "Add Shortcut"
9. Press your desired shortcut (e.g., ⌘ + Shift + M)
10. Close Settings
11. Test it!