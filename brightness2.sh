#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <brightness_percentage>"
    exit 1
fi

percentage="$1"

if [[ "$percentage" == +* ]]; then
    # Increase brightness
    percentage="${percentage#+}"
    if [ "$percentage" -ge 1 ] && [ "$percentage" -le 100 ]; then
        max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
        current_brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
        new_brightness=$((current_brightness + (percentage * max_brightness / 100)))

        if [ "$new_brightness" -le "$max_brightness" ]; then
            sudo bash -c "echo '$new_brightness' > /sys/class/backlight/intel_backlight/brightness"
        else
            echo "Brightness cannot exceed the maximum value."
        fi
    else
        echo "Invalid argument. Brightness percentage should be between 0 and 100."
    fi
elif [[ "$percentage" == -* ]]; then
    # Decrease brightness
    percentage="${percentage#-}"
    if [ "$percentage" -ge 1 ] && [ "$percentage" -le 100 ]; then
        max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
        current_brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
        new_brightness=$((current_brightness - (percentage * max_brightness / 100)))

        if [ "$new_brightness" -ge 0 ]; then
            sudo bash -c "echo '$new_brightness' > /sys/class/backlight/intel_backlight/brightness"
        else
            echo "Brightness cannot be less than 0."
        fi
    else
        echo "Invalid argument. Brightness percentage should be between 0 and 100."
    fi
else
    # Set brightness to the specified percentage
    if [ "$percentage" -ge 1 ] && [ "$percentage" -le 100 ]; then
        max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
        brightness=$((percentage * max_brightness / 100))

        sudo bash -c "echo '$brightness' > /sys/class/backlight/intel_backlight/brightness"
    else
        echo "Invalid argument. Brightness percentage should be between 0 and 100."
    fi
fi

