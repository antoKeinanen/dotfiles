#!/bin/bash

color_scheme=$(gsettings get org.gnome.desktop.interface color-scheme | tr -d "'")

if  [ "$color_scheme" == "prefer-light" ]; then
    ~/.config/scripts/set-dark-theme.sh
elif [ "$color_scheme" == "prefer-dark" ]; then
    ~/.config/scripts/set-light-theme.sh
else
    echo "Invalid theme ${color_scheme}"
fi
