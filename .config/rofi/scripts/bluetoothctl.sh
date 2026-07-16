#!/bin/sh

declare -a array
array=($(bluetoothctl devices Trusted | awk '{print $2,$3}'))


declare -a devices
declare -a mac

for i in ${!array[@]}; do
  finalIndex=$((i/2))
  if [[ $i%2 -eq 1 ]]; then
   devices[$finalIndex]=${array[$i]}
  else
   mac[$finalIndex]=${array[$i]}
  fi 
done
choice=$(printf "%s\n" "${devices[@]}" | rofi -dmenu )

for index in ${!devices[@]}; do
  device=${devices[$index]}
  if [[ "$device" == "$choice" ]]; then
    choice=$index
    break
  fi
done
device=${mac[$choice]}
info=$(bluetoothctl info $device | head -n 10)
choice=$(printf "Connect\nDisconnect"|rofi -dmenu -mesg "$info")
echo $choice

if [[ "$choice" == "Connect" ]]; then
  bluetoothctl connect $device
else
  bluetoothctl disconnect $device
fi
