#!/bin/bash

# Author: Michael Hennelly
# Description: Simple CLI for adding keyboard backlight effects to laptops with upower and dbus-send

ORIGINAL_VALUE=$(cat /sys/class/leds/tpacpi::kbd_backlight/brightness)
SEQUENCE="12"
PERIOD=2

function cleanup {
    dbus-send --system --type=method_call --dest="org.freedesktop.UPower" "/org/freedesktop/UPower/KbdBacklight" "org.freedesktop.UPower.KbdBacklight.SetBrightness" int32:$ORIGINAL_VALUE
}

trap cleanup EXIT

while getopts "q:t:h" opt; do
    case $opt in
	q )
	    SEQUENCE=$OPTARG
	    ;;
	t )
	    PERIOD=$OPTARG
	    ;;
	h )
	    printf "breathe: Simple CLI for cycling through backlight brightness modes \n\
    -q SEQ : Set the sequence of mode values as a string ex. 012, defaults to 12 \n\
    -t SEC: Set the cycle period in seconds, defaults to 2"
	    exit 0
	    ;;
	\? ) echo 'Usage: breathe [-q SEQ] [-t SEC] [-h]'
	     exit 1
	     ;;
    esac
done

WAIT=$(echo "scale=2; $PERIOD / $(expr length $SEQUENCE)" | bc)

SEQARR=$(echo $SEQUENCE | grep -o .)

while true; do
    for VAL in $SEQARR[@]; do
	dbus-send --system --type=method_call --dest="org.freedesktop.UPower" "/org/freedesktop/UPower/KbdBacklight" "org.freedesktop.UPower.KbdBacklight.SetBrightness" int32:$VAL
	sleep $WAIT
    done
done


