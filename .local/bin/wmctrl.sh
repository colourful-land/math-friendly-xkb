#!/bin/bash

# HTML-1 is the external monitor when connected to the HTML port
# DP-1 is the external monitor when connected to a display port through USB-C

#export resolution=`xrandr | awk 'external == 1 && $0  ~ /[+]/ {print $1; exit } $2=="connected" { if ($1 ~ "^DP-" || $1 ~ "^HDMI-" || $1 ~ "Virtual1") external = 1} '`
export `xdpyinfo | grep dimension | awk  '{print $1 $2;}' | tr : =`

# 3 column layout
if [[ ${dimensions} = 2560* ]]
then
	wmctrl -x -r Telegram       -e 0,1700,000,0861,700
	wmctrl -x -r Signal         -e 0,1700,790,0860,650
	wmctrl -x -r Firefox -b remove,maximized_vert,maximized_horz
	wmctrl -x -r Firefox        -e 0,805,0,1200,1374
	# so that the height can still be mouse-adjusted
	#wmctrl -x -r Firefox -b add,maximized_vert
	wmctrl -x -r Gnome-terminal -e 0,45,000,0790,1370
	exit
fi

# 2 column layout
if [[ ${dimensions} = 1920* ]]
then
	wmctrl -x -r Telegram       -e 0,1068,000,0821,1000
	wmctrl -x -r Signal         -e 0,1068,000,0821,1020
	wmctrl -x -r Gnome-terminal -e 0,1068,000,0866,1025
	wmctrl -x -r Firefox -b remove,maximized_vert,maximized_horz
	wmctrl -x -r Firefox        -e 0,70,000,1024,1015
	wmctrl -x -r Firefox -b add,maximized_vert
	wmctrl -x -r Gnome-terminal -b add,maximized_vert
	exit
fi

if [ "$dimensions" = "" ]
then
	echo "no external monitor."
else
	echo "no configuration for resolution $dimensions"
fi

