#!/bin/bash

directory=~/Pictures/wallpapers
monitor=$(hyprctl monitors | grep Monitor | awk '{print $2}')

if [ -d "$directory" ]; then
    random_background=$(find $directory -name "*.*" | shuf -n 1)

    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload "$random_background"

    for m in $monitor; do
        hyprctl hyprpaper wallpaper "$m, $random_background"
    done 

fi
