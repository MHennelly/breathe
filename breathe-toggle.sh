#!/bin/bash

# Author: Michael Hennelly
# Description: Toggles breathe with default settings, intended for keyboard shortcuts

PID=$(pgrep breathe)

if pgrep -x breathe >/dev/null; then
    kill $PID
else
    breathe &
fi
