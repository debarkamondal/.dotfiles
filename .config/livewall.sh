#!/bin/bash

folder="/home/dezire/Downloads/livewall"
name=$(ls $folder/* | shuf -n1) 
xwinwrap -fs -fdt -ni -b -nf -- mpv -wid WID --no-audio --loop $name
