#!/bin/bash

if [ "$1" = '10' ]; then
    sudo bash -c 'echo "1000" > /sys/class/backlight/intel_backlight/brightness'
elif [ "$1" = '20' ]; then
    sudo bash -c 'echo "2000" > /sys/class/backlight/intel_backlight/brightness'
elif [ "$1" = '30' ]; then
    sudo bash -c 'echo "3000" > /sys/class/backlight/intel_backlight/brightness'
elif [ "$1" = '40' ]; then
    sudo bash -c 'echo "4000" > /sys/class/backlight/intel_backlight/brightness'
elif [ "$1" = '50' ]; then
    sudo bash -c 'echo "5000" > /sys/class/backlight/intel_backlight/brightness'
elif [ "$1" = '60' ]; then
    sudo bash -c 'echo "6000" > /sys/class/backlight/intel_backlight/brightness'
elif [ "$1" = '70' ]; then
    sudo bash -c 'echo "7000" > /sys/class/backlight/intel_backlight/brightness'
elif [ "$1" = '80' ]; then
    sudo bash -c 'echo "8000" > /sys/class/backlight/intel_backlight/brightness'
elif [ "$1" = '90' ]; then
    sudo bash -c 'echo "9000" > /sys/class/backlight/intel_backlight/brightness'
elif [ "$1" = '100' ]; then
    sudo bash -c 'echo "10000" > /sys/class/backlight/intel_backlight/brightness'
else
    echo "invalid argument"
fi
