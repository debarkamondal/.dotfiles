#!/bin/sh
feh --bg-scale /home/dezire/Downloads/wallpapers/24535.webp
picom & disown # --experimental-backends --vsync should prevent screen tearing on most setups if needed
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown # start polkit agent from GNOME
thunar --daemon & disown

