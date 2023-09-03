#!/bin/sh

ans=$(
    rofi -dmenu \
        -no-config \
            -i \
            -no-fixed-num-lines \
            -p "Are you sure: " \
            -theme ~/.config/rofi/confirm.rasi \ &
)

# test if ans is yes with any capitalization and then check first arg if it is shutdown or reboot
if [[ $ans =~ [yY](es)* ]]; then
    if [[ $1 == "shutdown" ]]; then
        systemctl poweroff
    elif [[ $1 == "reboot" ]]; then
        systemctl reboot
    fi
fi
