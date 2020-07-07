#!/bin/bash

echo 'Installing...'
sudo cp ./breathe.sh /usr/local/bin/breathe
sudo cp ./breathe-toggle.sh /usr/local/bin/breathe-toggle

if test -f "/usr/local/bin/breathe"; then
    echo "Installed breathe"
else
    echo "Error: /usr/local/bin/breathe not found"
fi

if test -f "/usr/local/bin/breathe-toggle"; then
    echo "Installed breathe-toggle"
else
    echo "Error: /usr/local/bin/breathe-toggle not found"
fi
