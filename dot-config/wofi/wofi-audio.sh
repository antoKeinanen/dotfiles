mode=$(printf "input\noutput" | wofi --show dmenu)

if [ $mode == "input" ]; then
    pactl list sources | awk -F': ' '/Name: /{name=$2} /Description: /{print name " | " $2}' | \
    wofi --show dmenu | cut -d' ' -f1 | xargs pactl set-default-source
else
    pactl list sinks | awk -F': ' '/Name: /{name=$2} /Description: /{print name " | " $2}' | \
    wofi --show dmenu | cut -d' ' -f1 | xargs pactl set-default-sink
fi