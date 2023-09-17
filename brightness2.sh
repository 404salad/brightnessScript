#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <brightness_percentage>"
    exit 1
fi

percentage="$1"

if [ "$percentage" -ge 1 ] && [ "$percentage" -le 100 ]; then
    max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
    brightness=$((percentage * max_brightness / 100))

    sudo bash -c "echo '$brightness' > /sys/class/backlight/intel_backlight/brightness"
else
    echo "Invalid argument. Brightness percentage should be between 0 and 100."
fi

