#!/bin/sh

# Take a Screenshot
maim 'lockScreen.jpg'

# Converts screenshot to png and blurs it
convert lockScreen.jpg -blur 35x15 final.png

# Put on-image.png on blurred.png
# composite -gravity center ./on-image.png blurred.png final.png

# Remove tmp files and add final image to tmp
rm lockScreen.jpg
rm /tmp/lockScreen.png
cp final.png /tmp/lockScreen.png
rm final.png

# Run i3lock

i3lock \
    --color=282828 \
    --image="/tmp/lockScreen.png" \
    --inside-color=282828FF \
    --insidever-color=282828FF \
    --insidewrong-color=282828FF \
    --ring-color=282828FF \
    --ringver-color=FABD2FFF \
    --ringwrong-color=FB4934FF \
    --separator-color=282828FF \
    --line-color=EBDBB2FF \
    --keyhl-color=EBDBB2FF \
    --bshl-color=FB4934FF \
    --ring-width=4 \
    --radius=32 \
    --time-color=A89984FF \
    --time-pos='ix-180:iy+12' \
    --time-pos='ix-r-50:iy+12' \
    --time-str='%H:%M:%S' \
    --time-font='monospace' \
    --time-align=2 \
    --time-size=32 \
    --date-color=A89984FF \
    --date-pos='ix+180:iy+12' \
    --date-pos='ix+r+50:iy+12' \
    --date-str='%d.%m.%y' \
    --date-font='monospace' \
    --date-align=1 \
    --date-size=32 \
    --greeter-pos='x+100:iy+12' \
    --verif-color=00000000 \
    --wrong-color=00000000 \
    --modif-color=00000000 \
    --layout-color=00000000 \
    --greeter-color=00000000 \
    --verif-text='' \
    --wrong-text='' \
    --noinput-text='' \
    --lock-text='' \
    --lockfailed-text='' \
    --greeter-text='' \
    --ignore-empty-password \
    --pass-media-keys \
    --pass-screen-keys \
    --indicator \
    --clock