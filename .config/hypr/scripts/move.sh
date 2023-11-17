#!/bin/sh

if hyprctl activewindow | grep "grouped: 0$"; then
	# Not in a group
	hyprctl dispatch movefocus "$1"
else
	# In a group
	if [ "$1" = "r" ]; then
		dir="f"
	else
		dir="b"
	fi

	hyprctl dispatch changegroupactive $dir
fi
