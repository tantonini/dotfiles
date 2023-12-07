#!/bin/bash

option1="Selected area"
option2="Fullscreen"

options="$option1\n$option2"

#choice=$(echo -e "$options" | wofi --dmenu -width 30 --prompt "Take Screenshot")
choice=$(echo -e "$options" | wofi --dmenu --prompt "Take Screenshot" --lines 3 --width 1 --hide-scroll)

case $choice in
    "$option1")
        grim -g "$(slurp)" - | swappy -f -
    ;;
    "$option2")
        grim - | swappy -f -
    ;;
esac
