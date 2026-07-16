#!/bin/bash
# Hyprland Screenshot Script with Sound

type="$1" # "full" or "region"
file="$HOME/Pictures/Screenshots/Screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"

# Ensure Screenshots folder exists
mkdir -p "$HOME/Pictures/Screenshots"

# Play shutter sound
play_sound() {
    pw-play /usr/share/sounds/freedesktop/stereo/camera-shutter.oga &
}

if [ "$type" = "region" ]; then
    # Select region first
    geom=$(slurp -w 0)
    [ -z "$geom" ] && exit 0 # cancelled
    
    # Capture region
    grim -g "$geom" "$file"
    wl-copy < "$file"
    
    # Run sound
    play_sound
else
    # Capture full screen
    grim "$file"
    wl-copy < "$file"
    
    # Run sound
    play_sound
fi

# Send notification with screenshot thumbnail (disappears after 5 seconds)
dunstify -t 5000 -i "$file" -a "Screenshot" "Screenshot Captured" "Saved to clipboard and Pictures/Screenshots"
