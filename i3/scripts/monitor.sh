#!/bin/bash

# Fetch connected monitors and their names
MONITORS=$(xrandr --query | grep " connected" | awk '{ print $1 }')

# Initialize variables
EDP=""
DP=""
HDMI=""

# Assign monitor names based on prefixes
# we do this since sometimes the names of the monitor change slightly.
for MONITOR in $MONITORS; do
    if [[ $MONITOR == eDP-* ]]; then
        EDP=$MONITOR
    elif [[ $MONITOR == DP-* ]]; then
        DP=$MONITOR
    elif [[ $MONITOR == HDMI-* ]]; then
        HDMI=$MONITOR
    fi
done

# Check if all required monitors are found
if [[ -z $EDP || -z $DP || -z $HDMI ]]; then
    echo "Error: Not all required monitors are connected."
    echo "Detected: eDP: $EDP, DP: $DP, HDMI: $HDMI"
    exit 1
fi

# Configure monitors
xrandr --output $DP --mode 1920x1080 --rate 119.98 --left-of $HDMI
xrandr --output $HDMI --mode 1920x1080 --rate 239.96 --right-of $DP --primary
xrandr --output $EDP --mode 2560x1600 --rate 240 --right-of $HDMI

echo "Monitors configured:"
echo "HDMI ($HDMI) at 144 Hz: left"
echo "DP ($DP) at 239.96 Hz: middle"
echo "eDP ($EDP) at 240 Hz: right"
