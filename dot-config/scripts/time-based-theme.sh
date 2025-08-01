current_hour=$(date +%H)

# Logic for theme switching
if [ $current_hour -ge 22 ] || [ $current_hour -lt 7 ]; then
    ~/.config/scripts/set-dark-theme.sh
else
    ~/.config/scripts/set-light-theme.sh
fi